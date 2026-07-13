# 🛒 E-Commerce Order Analytics System

## 📌 Project Overview

The **E-Commerce Order Analytics System** is a Data Engineering mini project developed using **Python, Pandas, Spark, Databricks, and SQL**.

The project simulates an online retail environment where raw transactional data is generated, cleaned, validated, and analyzed to produce meaningful business insights.

This project demonstrates data generation, data cleaning, SQL analytics, window functions, CTEs, and business reporting.

---

# 🎯 Objectives

- Generate realistic e-commerce datasets.
- Introduce intentional data quality issues.
- Clean and validate the datasets.
- Perform SQL-based business analysis.
- Generate analytical reports.
- Handle common data quality edge cases.

---

# 🛠 Technologies Used

- Python
- Pandas
- Apache Spark
- Databricks
- Spark SQL
- Faker Library

---

# 📊 Dataset Information

## Customers

| Column |
|---------|
| customer_id |
| customer_name |
| email |
| registration_date |
| customer_type |

---

## Products

| Column |
|---------|
| product_id |
| product_name |
| category |
| subcategory |
| cost_price |

---

## Orders

| Column |
|---------|
| order_id |
| customer_id |
| order_date |
| status |
| region_code |

---

## Order Items

| Column |
|---------|
| item_id |
| order_id |
| product_id |
| quantity |
| unit_price |
| discount_percent |

---

# 📌 Data Quality Issues Introduced

The generated datasets intentionally include:

- 5% Missing Customer IDs
- 3% Negative Quantities
- Invalid Email Addresses
- Mixed Case Product Names
- Extra Spaces in Product Names
- Incorrect Date Formats
- Discount Variations

---

# 🧹 Data Cleaning

The following cleaning functions were implemented:

- clean_orders()
- clean_products()
- validate_emails()
- check_referential_integrity()

Cleaning operations include:

- Date format correction
- Missing value handling
- Product name normalization
- Email validation
- Referential integrity verification

---

# 📈 SQL Analysis

The project performs multiple business analyses including:

### Basic Analysis

- Revenue by Category
- Top Customers
- Monthly Orders

### Intermediate Analysis

- Customers with No Delivered Orders
- Returned Products Analysis
- Return Rate by Category

### Advanced SQL

- Window Functions
- Running Totals
- DENSE_RANK
- LAG Analysis
- Multiple CTEs
- NTILE Segmentation
- Year-over-Year Analysis
- Cohort Analysis
- First/Last Purchase Analysis
- Cumulative Revenue Distribution
- Products Frequently Bought Together

---

# 📊 Business Insights Generated

The system provides insights such as:

- Revenue by Product Category
- Customer Purchase Behavior
- Product Return Trends
- Monthly Sales Performance
- Customer Segmentation
- Revenue Distribution
- Cohort Retention
- Customer Ranking
- Product Ranking

---

# ⚠ Edge Case Testing

The project validates several edge cases:

- Invalid Order References
- Discount > 100%
- Zero Quantity Orders
- Future Order Dates

---

# 🚀 Project Workflow

```
Generate Data
        │
        ▼
Clean Data
        │
        ▼
Validate Data
        │
        ▼
Load into Spark SQL
        │
        ▼
Business Analysis
        │
        ▼
Generate Reports
```

---


# 📚 Learning Outcomes

Through this project, the following concepts were implemented:

- Data Generation
- Data Cleaning
- Data Validation
- SQL Analytics
- Spark SQL
- Window Functions
- Common Table Expressions (CTEs)
- Business Intelligence
- Data Engineering Workflow
