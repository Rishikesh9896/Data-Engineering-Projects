/********************************************************************
    DATA ENGINEERING ASSIGNMENT
    Topic: Subqueries, CTEs and Window Functions
    Dataset: Sample Superstore Dataset
********************************************************************/

-- ==========================================================
-- STEP 1: SELECT DATABASE
-- ==========================================================

USE store_db;

-- ==========================================================
-- STEP 2: CREATE RAW TABLE
-- Import all Superstore data into a staging table
-- ==========================================================

CREATE TABLE store_raw (
    row_id VARCHAR(20),
    order_id VARCHAR(50),
    order_date VARCHAR(30),
    ship_date VARCHAR(30),
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(255),
    sales VARCHAR(30),
    quantity VARCHAR(20),
    discount VARCHAR(20),
    profit VARCHAR(30)
);

-- ==========================================================
-- STEP 3: LOAD DATA FROM CSV FILE
-- ==========================================================

LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Sample - Superstore.csv'
INTO TABLE store_raw
CHARACTER SET latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- Verify total records imported

SELECT COUNT(*) AS total_records
FROM store_raw;

-- Preview imported data

SELECT *
FROM store_raw
LIMIT 5;

-- ==========================================================
-- STEP 4: CREATE CUSTOMERS TABLE
-- Extract unique customer information
-- ==========================================================

CREATE TABLE customers(
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50)
);

INSERT INTO customers
SELECT DISTINCT
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    postal_code,
    region
FROM store_raw;

-- Verify customer Data

SELECT*
FROM customers
LIMIT 10;

-- ==========================================================
-- STEP 5: CREATE PRODUCTS TABLE
-- Extract unique product information
-- ==========================================================

CREATE TABLE products(
    product_id VARCHAR(50),
    product_name VARCHAR(255),
    category VARCHAR(50),
    sub_category VARCHAR(50)
);

INSERT INTO products
SELECT DISTINCT
    product_id,
    product_name,
    category,
    sub_category
FROM store_raw;

-- Verify product Data

SELECT *
FROM products;

-- ==========================================================

-- STEP 6: CREATE ORDERS TABLE
-- Store order-level transactional data
-- ==========================================================

CREATE TABLE orders(
    order_id VARCHAR(50),
    order_date VARCHAR(30),
    ship_date VARCHAR(30),
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    product_id VARCHAR(50),
    sales VARCHAR(30),
    quantity VARCHAR(20),
    discount VARCHAR(20),
    profit VARCHAR(30)
);

INSERT INTO orders
SELECT DISTINCT
    order_id,
    order_date,
    ship_date,
    ship_mode,
    customer_id,
    product_id,
    sales,
    quantity,
    discount,
    profit
FROM store_raw;

-- Verify order Data

SELECT *
FROM orders;

-- Display all tables

SHOW TABLES;

-- ==========================================================
-- QUERY 1: SUBQUERY
-- Find orders with sales greater than average sales
-- ==========================================================

SELECT *
FROM orders
WHERE CAST(sales AS DECIMAL(10,2))
>
(
    SELECT AVG(CAST(sales AS DECIMAL(10,2)))
    FROM orders
);

-- ==========================================================
-- QUERY 2: SUBQUERY
-- Find highest sales order for each customer
-- ==========================================================

SELECT *
FROM orders o
WHERE CAST(o.sales AS DECIMAL(10,2))
=
(
    SELECT MAX(CAST(i.sales AS DECIMAL(10,2)))
    FROM orders i
    WHERE i.customer_id = o.customer_id
)
LIMIT 100;

-- ==========================================================
-- QUERY 3: CTE
-- Calculate total sales for each customer
-- ==========================================================

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(CAST(sales AS DECIMAL(10,2))) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT *
FROM customer_sales;

-- ==========================================================
-- QUERY 4: CTE + SUBQUERY
-- Find customers with above-average total sales
-- ==========================================================

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(CAST(sales AS DECIMAL(10,2))) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT *
FROM customer_sales
WHERE total_sales >
(
    SELECT AVG(total_sales)
    FROM customer_sales
);

-- ==========================================================
-- QUERY 5: WINDOW FUNCTION
-- Rank customers based on total sales
-- ==========================================================

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(CAST(sales AS DECIMAL(10,2))) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT
    customer_id,
    total_sales,
    RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
FROM customer_sales;

-- ==========================================================
-- QUERY 6: WINDOW FUNCTION + PARTITION BY
-- Assign row numbers to orders within each customer
-- ==========================================================

SELECT *,
ROW_NUMBER() OVER
(
    PARTITION BY customer_id
    ORDER BY CAST(sales AS DECIMAL(10,2)) DESC
) AS row_num
FROM orders;

-- ==========================================================
-- QUERY 7: WINDOW FUNCTION
-- Display Top 3 customers based on total sales
-- ==========================================================

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(CAST(sales AS DECIMAL(10,2))) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT *
FROM
(
    SELECT *,
           RANK() OVER(ORDER BY total_sales DESC) AS sales_rank
    FROM customer_sales
) x
WHERE sales_rank <= 3;

-- ==========================================================
-- FINAL COMBINED QUERY
-- JOIN + CTE + WINDOW FUNCTION
-- Display Customer Name, Total Sales and Rank
-- ==========================================================

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(CAST(sales AS DECIMAL(10,2))) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT
    c.customer_name,
    cs.total_sales,
    RANK() OVER(ORDER BY cs.total_sales DESC) AS sales_rank
FROM customer_sales cs
JOIN customers c
ON cs.customer_id = c.customer_id;

-- ==========================================================
-- MINI PROJECT: CUSTOMER SALES INSIGHTS
-- ==========================================================

-- ----------------------------------------------------------
-- 1. Top 5 Customers
-- ----------------------------------------------------------

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(CAST(sales AS DECIMAL(10,2))) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT *
FROM
(
    SELECT *,
           RANK() OVER(ORDER BY total_sales DESC) AS rnk
    FROM customer_sales
) x
WHERE rnk <= 5;

-- ----------------------------------------------------------
-- 2. Bottom 5 Customers
-- ----------------------------------------------------------

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(CAST(sales AS DECIMAL(10,2))) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT *
FROM
(
    SELECT *,
           RANK() OVER(ORDER BY total_sales ASC) AS rnk
    FROM customer_sales
) x
WHERE rnk <= 5;

-- ----------------------------------------------------------
-- 3. Customers Who Made Only One Order
-- ----------------------------------------------------------

SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) = 1;

-- ----------------------------------------------------------
-- 4. Customers With Above Average Sales
-- ----------------------------------------------------------

WITH customer_sales AS
(
    SELECT
        customer_id,
        SUM(CAST(sales AS DECIMAL(10,2))) AS total_sales
    FROM orders
    GROUP BY customer_id
)

SELECT *
FROM customer_sales
WHERE total_sales >
(
    SELECT AVG(total_sales)
    FROM customer_sales
);

-- ----------------------------------------------------------
-- 5. Highest Order Value Per Customer
-- ----------------------------------------------------------

SELECT
    customer_id,
    MAX(CAST(sales AS DECIMAL(10,2))) AS highest_order
FROM orders
GROUP BY customer_id;
