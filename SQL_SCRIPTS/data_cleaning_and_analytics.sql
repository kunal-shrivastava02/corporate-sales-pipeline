-- Step A: Create a clean staging table to hold our initial historical records
CREATE TABLE staging_sales (
    transaction_id VARCHAR(50) PRIMARY KEY,
    order_date DATE,
    customer_id VARCHAR(50),
    product_category VARCHAR(100),
    product_name VARCHAR(150),
    quantity INT,
    unit_price NUMERIC(10, 2),
    region VARCHAR(50),
    payment_status VARCHAR(50)
);

SELECT * FROM staging_sales;

-- Query 1: Strip out accidental leading and trailing spaces from text
UPDATE staging_sales
SET payment_status = TRIM(payment_status);

-- Query 2: Standardize text capitalization (e.g., converts 'unpaid' to 'Unpaid')
UPDATE staging_sales
SET payment_status = INITCAP(payment_status);

-- Query 3: Create a clean Production Table ('Fact Table') and filter out refunded items
CREATE TABLE fact_sales AS 
SELECT 
    transaction_id,
    order_date,
    customer_id,
    product_category,
    product_name,
    quantity,
    unit_price,
    (quantity * unit_price) AS total_revenue, -- Adding a calculated column for ease of reporting
    region,
    payment_status
FROM staging_sales
WHERE payment_status != 'Refunded';

SELECT * FROM fact_sales;

SELECT 
    product_category,
    SUM(quantity) AS total_units_sold,
    SUM(total_revenue) AS global_revenue
FROM fact_sales
GROUP BY product_category
ORDER BY global_revenue DESC;

SELECT 
    EXTRACT(YEAR FROM order_date) AS sales_year,
    SUM(total_revenue) AS annual_revenue,
    COUNT(transaction_id) AS total_orders
FROM fact_sales
GROUP BY sales_year    
ORDER BY sales_year ASC;
