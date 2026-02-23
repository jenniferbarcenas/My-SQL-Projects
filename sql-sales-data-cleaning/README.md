SQL Sales Data Cleaning Project

 --Project Overview
This project demonstrates a complete SQL data cleaning workflow using a raw sales dataset.  
The goal was to transform messy, inconsistent data into a clean, analysis-ready table and validate key business metrics such as total revenue.

This project showcases foundational data analyst skills including data validation, transformation, and aggregation using SQL.


---Dataset
The dataset contains raw sales transaction records with fields such as:
- Order ID
- Product
5. Verified results using validation queries  


---SQL Techniques Used
- SELECT and filtering
- Data type conversions
- Calculated columns
- Aggregate functions (SUM)
- Data validation checks


---Key Validation Query
```sql
SELECT SUM(total_revenue) 
FROM sales_clean;
