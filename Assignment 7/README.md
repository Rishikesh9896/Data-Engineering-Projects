# Week 7 - Delta Lake MERGE Implementation

## Objective
Perform incremental data processing using Delta Lake MERGE on the Superstore dataset.

## Tools Used
- Databricks Community Edition
- Apache Spark (PySpark)
- Delta Lake

## Steps Performed
1. Uploaded the Superstore CSV dataset.
2. Loaded the dataset into a Spark DataFrame.
3. Stored the dataset as a Delta Table.
4. Performed data cleaning by handling null values and removing duplicates.
5. Created an incremental dataset to simulate updates and new records.
6. Applied the Delta Lake MERGE operation.
7. Updated existing records and inserted new records.
8. Validated the final row count and checked for duplicate records.
9. Displayed summary statistics of the final dataset.

## Results
- Initial Rows: 9994
- Final Rows after MERGE: 9996
- Existing Records Updated: 2
- New Records Inserted: 2
- Duplicate Records: 0

## Conclusion
The Delta Lake MERGE operation successfully demonstrated UPSERT functionality by updating existing records and inserting new records efficiently.