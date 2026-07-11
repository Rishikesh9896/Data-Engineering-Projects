# 🚖 Ride Sharing Driver Performance Analysis

## 📌 Project Overview

This project demonstrates an end-to-end Data Engineering pipeline using **PySpark** and the **Medallion Architecture (Bronze → Silver → Gold)**.

The pipeline processes raw ride-sharing datasets, performs data cleaning and transformations, generates business KPIs, and stores the processed data in Parquet format.

---

# 🏗️ Architecture

```
              Raw CSV Files
                    │
                    ▼
            Bronze Layer
         (Raw Parquet Files)
                    │
                    ▼
            Silver Layer
      (Cleaned & Joined Data)
                    │
                    ▼
             Gold Layer
      (Business KPIs & Analytics)
```

---

# 📂 Project Structure

```
Ride_Sharing_Driver_Performance
│
├── data
│   ├── drivers.csv
│   ├── trips.csv
│   └── trip_logs.csv
│
├── bronze
│   ├── drivers
│   ├── trips
│   └── trip_logs
│
├── silver
│   └── ride_data
│
├── gold
│   ├── driver_performance
│   ├── cancellation_rate
│   ├── pickup_analysis
│   ├── revenue_analysis
│   └── driver_ranking
│
├── notebooks
│   └── project.ipynb
│
├── outputs
│
├── requirements.txt
│
└── README.md
```

---

# 🛠️ Technologies Used

- Python 3.12
- PySpark 3.5.1
- Apache Spark
- Parquet
- Jupyter Notebook
- VS Code

---

# 🚀 Pipeline Workflow

## Step 1

Read CSV datasets using PySpark.

---

## Step 2

Store raw datasets in the Bronze Layer.

---

## Step 3

Join Drivers, Trips, and Trip Logs datasets.

---

## Step 4

Perform Data Quality Checks

- Null Values
- Duplicate Records
- Invalid Distance
- Invalid Ratings

---

## Step 5

Create Derived Columns

- Trip Duration
- Completion Flag

---

## Step 6

Filter Invalid Records

---

## Step 7

Store cleaned dataset into Silver Layer.

---

## Step 8

Generate Business KPIs.

---

# 📈 Business KPIs

The project generates:

- Driver Performance Metrics
- Cancellation Rate per Driver
- High Demand Pickup Locations
- Revenue Analysis
- Driver Ranking using Window Functions

---


# 📁 Gold Layer Outputs

- Driver Performance
- Cancellation Rate
- Pickup Analysis
- Revenue Analysis
- Driver Ranking

---


# ▶️ How to Run

Install dependencies

```bash
pip install -r requirements.txt
```

Run the notebook

```
notebooks/project.ipynb
```
