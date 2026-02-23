/* 
SQL Sales Data Cleaning Project
Author: Jenn Barcenas
Description: Cleaning raw sales data and creating an analysis-ready table
*/

-- =========================================
-- 1. Create Raw Sales Table
-- =========================================
IF OBJECT_ID('sales_raw', 'U') IS NOT NULL
    DROP TABLE sales_raw;

CREATE TABLE sales_raw (
    order_id INT,
    product VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    order_date VARCHAR(20)  -- intentionally messy format
);

-- =========================================
-- 2. Insert Sample Raw Data
-- (Simulates messy real-world dataset)
-- =========================================
INSERT INTO sales_raw (order_id, product, quantity, price, order_date) VALUES
(1, 'Laptop', 1, 1200.00, '2026-01-01'),
(2, 'Mouse', 2, 25.00, '01/02/2026'),
(3, 'Keyboard', 1, 75.00, '2026/01/03'),
(4, 'Monitor', 2, 300.00, '2026-01-04'),
(5, 'Mouse', NULL, 25.00, '2026-01-05');  -- contains NULL quantity

-- =========================================
-- 3. Create Clean Table
-- =========================================
IF OBJECT_ID('sales_clean', 'U') IS NOT NULL
    DROP TABLE sales_clean;

SELECT
    order_id,
    product,
    
    -- Handle NULL quantities
    ISNULL(quantity, 0) AS quantity,
    
    price,
    
    -- Standardize date format
    TRY_CONVERT(DATE, order_date) AS order_date_clean,
    
    -- Create calculated revenue column
    ISNULL(quantity, 0) * price AS total_revenue

INTO sales_clean
FROM sales_raw;

-- =========================================
-- 4. Validation Checks
-- =========================================

-- Check for NULL dates after cleaning
SELECT *
FROM sales_clean
WHERE order_date_clean IS NULL;

-- Check for zero or negative quantities
SELECT *
FROM sales_clean
WHERE quantity <= 0;

-- Validate total revenue
SELECT SUM(total_revenue) AS total_revenue
FROM sales_clean;

-- =========================================
-- 5. Preview Cleaned Data
-- =========================================
SELECT *
FROM sales_clean;
