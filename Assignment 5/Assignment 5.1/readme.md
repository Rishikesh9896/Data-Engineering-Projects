# Data Cleaning and Transformation using PySpark

## 📌 Project Overview

This project demonstrates basic data cleaning and transformation operations using Apache Spark (PySpark). A sample employee dataset containing duplicate records and missing values was processed to improve data quality and generate useful insights.

The assignment focuses on understanding Spark DataFrames and applying common preprocessing techniques used in real-world data engineering workflows.

---

## 🚀 Objectives

- Create a Spark DataFrame
- Display and inspect the dataset
- Handle missing (null) values
- Remove duplicate records
- Filter data based on conditions
- Perform aggregation using `groupBy()`
- Calculate average, total, and count values
- Create derived columns
- Rename columns
- Sort records
- Export the cleaned dataset

---

## 🛠️ Technologies Used

- Python
- Apache Spark (PySpark)
- Google Colab
- Jupyter Notebook

---

## 📂 Dataset

A sample employee dataset was created containing the following fields:

- ID
- Name
- Age
- Department
- Salary

The dataset intentionally includes duplicate records and null values to demonstrate data cleaning techniques.

---

## ⚙️ Operations Performed

- Created a Spark DataFrame
- Displayed the dataset using `show()`
- Printed schema using `printSchema()`
- Counted null values
- Replaced null values using `fillna()`
- Removed duplicate records using `dropDuplicates()`
- Filtered records based on conditions
- Calculated average salary by department
- Calculated total salary by department
- Counted employees by department
- Created a derived `Bonus` column
- Renamed `Salary` to `Monthly_Salary`
- Sorted data based on salary
- Exported the cleaned dataset as CSV

