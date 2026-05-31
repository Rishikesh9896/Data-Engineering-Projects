CREATE DATABASE shopease_db;
USE shopease_db;

CREATE TABLE customers ( 
    customer_id   INT           PRIMARY KEY, 
    first_name    VARCHAR(50)   NOT NULL, 
    last_name     VARCHAR(50)   NOT NULL, 
    email         VARCHAR(100)  UNIQUE NOT NULL, 
    city          VARCHAR(50)   NOT NULL, 
    state         VARCHAR(50)   NOT NULL, 
    join_date     DATE          NOT NULL, 
    is_premium    BOOLEAN       DEFAULT FALSE 
); 
 
-- Index for filtering by city/state 
CREATE INDEX idx_customers_city ON customers(city); 
CREATE INDEX idx_customers_state ON customers(state); 

CREATE TABLE products ( 
    product_id    INT           PRIMARY KEY, 
    product_name  VARCHAR(100)  NOT NULL, 
    category      VARCHAR(50)   NOT NULL, 
    brand         VARCHAR(50)   NOT NULL, 
    unit_price    DECIMAL(10,2) NOT NULL  CHECK (unit_price > 0), 
    stock_qty     INT           NOT NULL  DEFAULT 0  CHECK (stock_qty >= 0) 
); 
 
-- Index for filtering by category 
CREATE INDEX idx_products_category ON products(category); 

CREATE TABLE orders ( 
    order_id      INT           PRIMARY KEY, 
    customer_id   INT           NOT NULL, 
    order_date    DATE          NOT NULL, 
    status        VARCHAR(20)   NOT NULL  DEFAULT 'Pending' 
                  CHECK (status IN ('Pending','Shipped','Delivered','Cancelled')), 
    total_amount  DECIMAL(12,2) NOT NULL  CHECK (total_amount >= 0), 
     
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
); 
 
-- Index for date-based filtering and sorting 
CREATE INDEX idx_orders_date ON orders(order_date); 
CREATE INDEX idx_orders_status ON orders(status);

CREATE TABLE order_items ( 
    item_id       INT           PRIMARY KEY, 
    order_id      INT           NOT NULL, 
    product_id    INT           NOT NULL, 
    quantity      INT           NOT NULL  CHECK (quantity > 0), 
    unit_price    DECIMAL(10,2) NOT NULL  CHECK (unit_price > 0), 
    discount_pct  DECIMAL(5,2)  DEFAULT 0 CHECK (discount_pct BETWEEN 0 AND 100), 
     
    FOREIGN KEY (order_id)   REFERENCES orders(order_id), 
    FOREIGN KEY (product_id) REFERENCES products(product_id) 
); 

SHOW TABLES;
-- ========== INSERT: customers ========== 

INSERT INTO customers VALUES 
(101, 'Aarav',  'Sharma', 'aarav.s@email.com',  'Mumbai',    'Maharashtra', '2024-01-15', TRUE), 
(102, 'Priya',  'Patel',  'priya.p@email.com',  'Ahmedabad', 'Gujarat',     '2024-02-20', FALSE), 
(103, 'Rohan',  'Gupta',  'rohan.g@email.com',  'Delhi',     'Delhi',       '2024-03-10', TRUE), 
(104, 'Sneha',  'Reddy',  'sneha.r@email.com',  'Hyderabad', 'Telangana',   '2024-04-05', FALSE), 
(105, 'Vikram', 'Singh',  'vikram.s@email.com', 'Jaipur',    'Rajasthan',   '2024-05-12', TRUE), 
(106, 'Ananya', 'Iyer',   'ananya.i@email.com', 'Chennai',   'Tamil Nadu',  '2024-06-18', FALSE), 
(107, 'Karan',  'Mehta',  'karan.m@email.com',  'Pune',      'Maharashtra', '2024-07-22', TRUE), 
(108, 'Divya',  'Nair',   'divya.n@email.com',  'Kochi',     'Kerala',      '2024-08-30', FALSE); 

-- ========== INSERT: products ========== 
INSERT INTO products VALUES 
(201, 'Wireless Earbuds',     'Electronics', 'BoAt',          1499.00, 250), 
(202, 'Cotton T-Shirt',       'Clothing',    'Levis',         799.00,  500), 
(203, 'Smart Watch',          'Electronics', 'Noise',         2999.00, 150), 
(204, 'Running Shoes',        'Clothing',    'Nike',          4599.00, 120), 
(205, 'Bluetooth Speaker',    'Electronics', 'JBL',           3499.00, 200), 
(206, 'Bedsheet Set',         'Home',        'Spaces',        1299.00, 300), 
(207, 'Laptop Stand',         'Electronics', 'AmazonBasics',  899.00,  180), 
(208, 'Cushion Covers (Set)', 'Home',        'HomeCenter',    599.00,  400); 

-- ========== INSERT: orders ========== 
INSERT INTO orders VALUES 
(1001, 101, '2024-08-01', 'Delivered',  4498.00), 
(1002, 102, '2024-08-03', 'Delivered',  799.00), 
(1003, 103, '2024-08-05', 'Shipped',    7498.00), 
(1004, 101, '2024-08-10', 'Delivered',  3499.00), 
(1005, 104, '2024-08-12', 'Cancelled',  2999.00), 
(1006, 105, '2024-08-15', 'Delivered',  5898.00), 
(1007, 106, '2024-08-18', 'Pending',    1299.00), 
(1008, 103, '2024-08-20', 'Delivered',  899.00), 
(1009, 107, '2024-08-25', 'Shipped',    6098.00), 
(1010, 108, '2024-08-28', 'Delivered',  1598.00); 

-- ========== INSERT: order_items ========== 
INSERT INTO order_items VALUES 
(5001, 1001, 201, 2, 1499.00, 0), 
(5002, 1001, 207, 1, 899.00,  10), 
(5003, 1002, 202, 1, 799.00,  0), 
(5004, 1003, 203, 1, 2999.00, 0), 
(5005, 1003, 204, 1, 4599.00, 5), 
(5006, 1004, 205, 1, 3499.00, 0), 
(5007, 1005, 203, 1, 2999.00, 0), 
(5008, 1006, 201, 1, 1499.00, 10), 
(5009, 1006, 204, 1, 4599.00, 5), 
(5010, 1007, 206, 1, 1299.00, 0), 
(5011, 1008, 207, 1, 899.00,  0), 
(5012, 1009, 205, 1, 3499.00, 0), 
(5013, 1009, 208, 2, 599.00,  15), 
(5014, 1010, 206, 1, 1299.00, 0), 
(5015, 1010, 208, 1, 599.00,  0); 

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;

SELECT COUNT(*) FROM customers;

SELECT COUNT(*) FROM products;

SELECT COUNT(*) FROM orders;

SELECT COUNT(*) FROM order_items;

-- SECTION A — SQL Basics (SELECT, Constraints, Primary Keys)

-- Q1. Write a query to display all columns and rows from the customers table.

SELECT * FROM customers;

-- Q2. Retrieve only the first_name, last_name, and city of all customers.

SELECT first_name, last_name, city FROM customers;

-- Q3. List all unique categories available in the products table.
SELECT DISTINCT category FROM products;

/*
Q4. Identify the Primary Key of each table in the schema.
Explain why a Primary Key must be unique and NOT NULL.

Answer:

customers   -> customer_id
products    -> product_id
orders      -> order_id
order_items -> item_id

Why UNIQUE?
1. Prevents duplicate records.
2. Uniquely identifies each row.
3. Maintains data integrity.

Why NOT NULL?
1. Every record must have an identifier.
2. NULL cannot uniquely identify a row.
3. Required for establishing relationships.
*/

/*
Q5. What constraints are applied to the email column in
the customers table? What would happen if you tried to
insert a duplicate email?

Answer:

Constraints:
1. UNIQUE
2. NOT NULL

If a duplicate email is inserted,
the database throws a duplicate entry error
and rejects the record.
*/

/*
Q6. Try inserting a product with unit_price = -50.
What happens and which constraint prevents it?
*/

-- INSERT INTO products VALUES ( 209, 'Test Product', 'Electronics', 'TestBrand', -50, 100 );

/*
Expected Result:
The insertion fails.

Reason:

CHECK (unit_price > 0)

The CHECK constraint prevents negative values
from being inserted into unit_price.
*/


-- SECTION B — Filtering & Optimization (WHERE, Indexes)
/*
Q7. Retrieve all orders with status = 'Delivered'.
*/

SELECT * FROM orders WHERE status = 'Delivered';

/*
Q8. Find all products in the 'Electronics' category with a unit_price greater than ₹2000.
*/

SELECT * FROM products WHERE category = 'Electronics' AND unit_price > 2000;

/* Q9. List all customers who joined in the year 2024 and belong to the state 'Maharashtra'.
*/

SELECT * FROM customers WHERE state = 'Maharashtra' AND join_date BETWEEN '2024-01-01' AND '2024-12-31';

/*
Q10. Find all orders placed between '2024-08-10' and '2024-08-25' (inclusive) that are NOT cancelled.
*/
SELECT * FROM orders WHERE order_date BETWEEN '2024-08-10' AND '2024-08-25' AND status <> 'Cancelled';

/*
Q11. Explain what the index idx_orders_date does. How would it improve performance? Write a sample query.
Answer:
idx_orders_date is an index created on the
order_date column.

Purpose:
1. Speeds up filtering operations.
2. Speeds up sorting operations.
3. Reduces full table scans.
4. Improves query performance on large datasets.

Sample Query:
*/
SELECT * FROM orders WHERE order_date = '2024-08-15';

/*
Q12. If you run: 
SELECT * FROM customers WHERE YEAR(join_date) = 2024; would the index be used?
Explain why or why not and rewrite the query to be index-friendly (SARGable).

Answer:
The index may not be used efficiently because the YEAR() function is applied to the column.

This forces MySQL to evaluate every row, which can reduce index effectiveness.

Non-SARGable Query:
*/

SELECT * FROM customers WHERE YEAR(join_date) = 2024;

-- SECTION C -  Aggregation (GROUP BY, SUM, COUNT, AVG, MIN, MAX)
/*
Q13. Count the total number of orders in the orders table.
*/

SELECT COUNT(*) AS Total_Orders FROM orders;

/*
Q14. Find the total revenue (SUM of total_amount) from all Delivered orders.
*/
SELECT SUM(total_amount) AS Total_Revenue FROM orders WHERE status = 'Delivered';

/*
Q15. Calculate the average unit_price of products in each category.
*/
SELECT category, AVG(unit_price) AS Average_Price FROM products GROUP BY category;

/*
Q16. For each order status, find:
1. Count of orders
2. Total revenue
Sort result by revenue in descending order.
*/

SELECT status, COUNT(*) AS Total_Orders, SUM(total_amount) AS Total_Revenue FROM orders
GROUP BY status
ORDER BY Total_Revenue DESC;

/*
Q17. Find the most expensive (MAX)
and cheapest (MIN) product
in each category.
*/

SELECT category, MAX(unit_price) AS Most_Expensive_Product, MIN(unit_price) AS Cheapest_Product
FROM products
GROUP BY category;

/*
Q18. List all product categories where average unit_price is greater than ₹2000.
(HAVING Clause)
*/

SELECT category, AVG(unit_price) AS Average_Price FROM products
GROUP BY category
HAVING AVG(unit_price) > 2000;

-- SECTION D JOINS AND REALTIONSHIPS 
/*
Q19. Write an INNER JOIN query to display each order along with customer's first_name and last_name.
Show:
order_id,
order_date,
first_name,
last_name,
total_amount
*/

SELECT
    o.order_id,
    o.order_date,
    c.first_name,
    c.last_name,
    o.total_amount
FROM orders o INNER JOIN customers c ON o.customer_id = c.customer_id;

/*
Q20. Using a LEFT JOIN, list ALL customers and their orders (if any).
Customers with no orders should still appear with NULL values for order columns.
*/
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date,
    o.status
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;

/*
Q21. Write a query using JOINs across three tables:
orders → order_items → products
Show: order_id, product_name, quantity, unit_price, discount_pct
*/
SELECT
    o.order_id,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    oi.discount_pct
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
JOIN products p
ON oi.product_id = p.product_id;

/*
Q22. Explain the difference between LEFT JOIN and RIGHT JOIN.
When would you use a FULL OUTER JOIN?

Answer:
LEFT JOIN:
Returns all records from the left table and matching records from the right table.
Example:
customers LEFT JOIN orders
All customers will appear even if they have not placed any order.

RIGHT JOIN:
Returns all records from the right table and matching records from the left table.

Example:
customers RIGHT JOIN orders
All orders will appear even if customer information is missing.

FULL OUTER JOIN:
Returns all matching and non-matching records from both tables.
Used when we want complete data from both tables regardless of matches.
*/

/*
Q23. Identify all Foreign Key relationships in the schema.
Explain what happens if:
customer_id = 999 is inserted into orders table.

Foreign Key Relationships:

1. orders.customer_id REFERENCES customers.customer_id
2. order_items.order_id REFERENCES orders.order_id
3. order_items.product_id REFERENCES products.product_id

Example:
*/
-- INSERT INTO orders VALUES
-- (
-- 1011, 999, '2024-08-30', 'Pending', 1000
-- );


-- SECTION E - ADVANCED CONCEPTS 
/*
Q24. Write a query using CASE to classify products into price tiers:
Budget    → unit_price < 1000
Mid-Range → unit_price BETWEEN 1000 AND 3000
Premium   → unit_price > 3000
Display:
product_name,
unit_price,
price_tier
*/

SELECT
    product_name, unit_price,
    CASE
        WHEN unit_price < 1000
            THEN 'Budget'

        WHEN unit_price BETWEEN 1000 AND 3000
            THEN 'Mid-Range'

        ELSE 'Premium'
    END AS price_tier

FROM products;


/*
Q25. Using a CASE statement inside an aggregate function, count:
1. Delivered Orders
2. Not Delivered Orders
Display result in a single row.
*/

SELECT SUM(
    CASE
        WHEN status = 'Delivered'
        THEN 1
        ELSE 0
    END
) AS Delivered_Orders,
SUM(
    CASE
        WHEN status <> 'Delivered'
        THEN 1
        ELSE 0
    END
) AS Not_Delivered_Orders

FROM orders;

/*
Q26. Explain ACID Properties
A - Atomicity
C - Consistency
I - Isolation
D - Durability
Give a real-world bank transfer example.

A - Atomicity
A transaction is either completed fully or not executed at all.
Example:
Money debited from Account A must also be credited to Account B.
If one step fails, the entire transaction is rolled back.

C - Consistency
Ensures that data remains valid before and after the transaction.
Example:
Total money in the banking system should remain unchanged after transfer.

I - Isolation
Multiple transactions should not interfere with each other.
Example:
Two users transferring money simultaneously should not affect each other's transactions.

D - Durability
Once a transaction is committed, it remains permanently stored.
Example:
Even if the database crashes after a successful transfer, the data remains saved.
*/

/*
Q27. Write a SQL transaction that:
1. Inserts a new order
2. Inserts two order items
3. Updates stock quantity
4. Rolls back if any step fails
*/

START TRANSACTION;
/* Step 1 - Insert New Order */
INSERT INTO orders
VALUES
(
1011, 102, CURDATE(), 'Pending', 1598.00
);

/* Step 2 - Insert Order Items */

INSERT INTO order_items VALUES
( 5016, 1011, 206, 1, 1299.00, 0
);

INSERT INTO order_items VALUES
( 5017, 1011, 208, 1, 299.00, 0
);

/* Step 3 - Update Product Stock */

UPDATE products SET stock_qty = stock_qty - 1 WHERE product_id = 206;
UPDATE products
SET stock_qty = stock_qty - 1 WHERE product_id = 208;

/* Step 4 - Commit Transaction */
COMMIT;






































