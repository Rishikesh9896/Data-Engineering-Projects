# Week 4 Assignment – Azure Cloud Fundamentals and Data Pipeline Implementation using Azure Data Factory

## Objective

The objective of this assignment is to understand Azure Cloud fundamentals and implement a complete data pipeline using Azure Blob Storage and Azure Data Factory (ADF).

## Technologies Used

- Microsoft Azure
- Azure Blob Storage
- Azure Data Factory (ADF)
- CSV File
- Azure IAM (Identity and Access Management)

##  Tasks Performed

### ✅ Task 1: Resource Group Creation
- Created a Resource Group (`rg-rishikesh`) in Azure Portal.

### ✅ Task 2: Storage Setup
- Created an Azure Storage Account.
- Created Blob Storage containers (`input` and `output`).
- Uploaded the `Sample - Superstore.csv` file.

### ✅ Task 3: Azure Data Factory Basics
- Created Azure Data Factory (`adf-rishikesh`).
- Explored Author, Monitor, and Manage sections.
- Created Linked Service (`LS_BlobStorage`).
- Created Source and Destination Datasets.
- Configured the Get Metadata activity.

### ✅ Task 4: Pipeline Development
- Created a pipeline using the Copy Data activity.
- Configured Source and Destination datasets.
- Connected activities for data movement.

### ✅ Task 5: Pipeline Execution
- Executed the pipeline using Debug.
- Successfully copied data from the `input` container to the `output` container.

### ✅ Task 6: IAM Roles
- Assigned the Reader role.
- Granted Azure Data Factory access to Azure Blob Storage using **Storage Blob Data Contributor**.


### Pipeline Flow

```
Source CSV File
        │
        ▼
Get Metadata Activity
        │
        ▼
Copy Data Activity
        │
        ▼
Destination (output.csv)
```

---

## ✅ Outcome

- Azure resources were successfully created.
- Blob Storage was configured.
- Linked Services and Datasets were created.
- Data pipeline executed successfully.
- Metadata validation completed.
- Output file generated in the destination container.
