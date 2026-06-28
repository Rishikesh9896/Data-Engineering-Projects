# Week 6 - Apache Spark Assignment

## Overview

This repository contains the complete solution for Week 6 Apache Spark Assignment developed using PySpark. The assignment focuses on understanding Spark Architecture, DataFrame operations, transformations, actions, schema handling, performance optimization, and working with CSV and Parquet file formats.

The project is divided into two parts:

- Part 1 – Employee Data Processing using PySpark
- Part 2 – Spark Concepts and Advanced DataFrame Operations

Both practical implementations and theoretical concepts are included to provide a complete understanding of Apache Spark.

---

# Objectives

- Understand Apache Spark Architecture
- Learn Driver, Cluster Manager, and Executor roles
- Understand Lazy Evaluation and DAG (Lineage Graph)
- Read CSV files with schema inference
- Perform DataFrame transformations
- Filter and select required records
- Rename columns
- Cast data types
- Add new calculated columns
- Handle NULL values
- Build Spark Data Processing Pipelines
- Compare CSV and Parquet formats
- Understand Predicate Pushdown
- Learn Transformations vs Actions
- Save DataFrames in CSV and Parquet
- Follow Spark performance best practices

---

# Technologies Used

- Python 3
- Apache Spark (PySpark)
- Google Colab
- Jupyter Notebook
- CSV
- Parquet

---

# Assignment Structure

## Part 1 – Employee Data Processing

Topics Covered

- Creating SparkSession
- Reading CSV Dataset
- Schema Inference
- Viewing Data
- Printing Schema
- Selecting Columns
- Filtering Data
- Renaming Columns
- Changing Data Types
- Creating New Columns
- Handling NULL Values
- Data Processing Pipeline
- Saving Data as CSV
- Saving Data as Parquet

---

## Part 2 – Spark Concepts

Topics Covered

- Spark Architecture
- Driver
- Cluster Manager
- Executors
- Lazy Evaluation
- DAG (Lineage Graph)
- Predicate Pushdown
- CSV vs Parquet
- Transformations vs Actions
- Product DataFrame Operations
- Order DataFrame Operations
- Filtering Records
- Column Renaming
- Data Type Casting
- Performance Optimization
- Spark Best Practices


# Performance Insights

- Spark uses Lazy Evaluation to optimize execution.
- DAG (Directed Acyclic Graph) helps Spark recover from failures.
- Predicate Pushdown minimizes unnecessary disk reads.
- Parquet significantly improves query performance compared to CSV.
- Avoid using collect() on large datasets because it transfers all records to the Driver.
- show() is preferred for previewing data.
- Selecting only required columns reduces execution time.
- Columnar storage in Parquet improves analytical workloads.

---

# Learning Outcomes

After completing this assignment, the following concepts were understood:

- Apache Spark Architecture
- Distributed Computing
- Spark DataFrames
- Schema Management
- Data Transformations
- Spark Actions
- Data Pipelines
- Performance Optimization
- Fault Tolerance using DAG
- Predicate Pushdown
- CSV vs Parquet Comparison
- Best Practices for Large Scale Data Processing

---

# Conclusion

This assignment demonstrates the practical implementation of Apache Spark using PySpark for efficient data processing. The project covers fundamental and advanced Spark concepts including DataFrame operations, transformations, lazy evaluation, DAG execution, schema handling, data pipelines, and optimized storage using Parquet. These concepts form the foundation for scalable Big Data processing and real-world data engineering applications.