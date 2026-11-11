CREATE DATABASE customer_shopping_analysis;
USE customer_shopping_analysis;
USE customer_shopping_analysis;
SHOW TABLES;
USE customer_shopping_analysis;
SELECT *
FROM `customer_shopping_data.xlsx`
LIMIT 10;
SELECT COUNT(*) AS total_records
FROM `customer_shopping_data.xlsx`;
DESCRIBE `customer_shopping_data.xlsx`;
USE customer_shopping_analysis;

SELECT *
FROM `customer_shopping_data.xlsx`
LIMIT 10;
SELECT COUNT(*) AS total_records
FROM `customer_shopping_data.xlsx`;
SELECT
    COUNT(*) AS total_rows,
    COUNT(invoice_no) AS invoice_count,
    COUNT(customer_id) AS customer_count,
    COUNT(age) AS age_count,
    COUNT(price) AS price_count
FROM `customer_shopping_data.xlsx`;
SELECT
    COUNT(*) AS total_rows,
    SUM(invoice_no IS NULL) AS missing_invoice,
    SUM(customer_id IS NULL) AS missing_customer,
    SUM(gender IS NULL) AS missing_gender,
    SUM(age IS NULL) AS missing_age,
    SUM(category IS NULL) AS missing_category,
    SUM(quantity IS NULL) AS missing_quantity,
    SUM(price IS NULL) AS missing_price,
    SUM(payment_method IS NULL) AS missing_payment,
    SUM(invoice_date IS NULL) AS missing_date,
    SUM(shopping_mall IS NULL) AS missing_mall
FROM `customer_shopping_data.xlsx`;
SELECT
    invoice_no,
    COUNT(*) AS duplicate_count
FROM `customer_shopping_data.xlsx`
GROUP BY invoice_no
HAVING COUNT(*) > 1;
SELECT
    COUNT(DISTINCT customer_id) AS unique_customers
FROM `customer_shopping_data.xlsx`;
SELECT
    category,
    COUNT(*) AS total_orders,
    SUM(quantity) AS total_quantity,
    SUM(quantity * price) AS total_sales
FROM `customer_shopping_data.xlsx`
GROUP BY category
ORDER BY total_sales DESC;
SELECT
    gender,
    COUNT(*) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(quantity) AS total_quantity,
    SUM(quantity * price) AS total_sales
FROM `customer_shopping_data.xlsx`
GROUP BY gender
ORDER BY total_sales DESC;
SELECT
    CASE
        WHEN age < 20 THEN 'Below 20'
        WHEN age BETWEEN 20 AND 29 THEN '20-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50 and Above'
    END AS age_group,
    COUNT(DISTINCT customer_id) AS total_customers,
    COUNT(*) AS total_orders,
    SUM(quantity * price) AS total_sales
FROM `customer_shopping_data.xlsx`
GROUP BY age_group
ORDER BY total_sales DESC;
SELECT
    payment_method,
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(quantity * price) AS total_sales
FROM `customer_shopping_data.xlsx`
GROUP BY payment_method
ORDER BY total_sales DESC;
SELECT
    shopping_mall,
    COUNT(*) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(quantity) AS total_quantity,
    SUM(quantity * price) AS total_sales
FROM `customer_shopping_data.xlsx`
GROUP BY shopping_mall
ORDER BY total_sales DESC;
SELECT
    MONTH(invoice_date) AS month_number,
    MONTHNAME(invoice_date) AS month_name,
    COUNT(*) AS total_orders,
    SUM(quantity * price) AS total_sales
FROM `customer_shopping_data.xlsx`
GROUP BY
    MONTH(invoice_date),
    MONTHNAME(invoice_date)
ORDER BY month_number;
SELECT
    customer_id,
    COUNT(*) AS total_orders,
    SUM(quantity) AS total_quantity,
    SUM(quantity * price) AS total_spent
FROM `customer_shopping_data.xlsx`
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT customer_id) AS total_customers,
    SUM(quantity) AS total_quantity_sold,
    SUM(quantity * price) AS total_revenue,
    AVG(price) AS average_price,
    MAX(price) AS highest_price,
    MIN(price) AS lowest_price
FROM `customer_shopping_data.xlsx`;