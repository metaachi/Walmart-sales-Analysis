-- Identify unique cities in the dataset
SELECT DISTINCT city
FROM sales;

-- Determine branch locations by city
SELECT DISTINCT city, branch
FROM sales;

-- Find unique product lines
SELECT DISTINCT product_line
FROM sales;

-- Calculate total quantity sold per product line
SELECT SUM(quantity) AS total_quantity, product_line
FROM sales
GROUP BY product_line
ORDER BY total_quantity DESC;

-- Calculate total revenue by month
SELECT month_name AS month, SUM(total) AS total_revenue
FROM sales
GROUP BY month_name 
ORDER BY total_revenue;

-- Identify month with the highest Cost of Goods Sold (COGS)
SELECT month_name AS month, SUM(cogs) AS cogs
FROM sales
GROUP BY month_name 
ORDER BY cogs DESC;

-- Determine product line with the highest revenue
SELECT product_line, SUM(total) as total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;

-- Identify city with the highest revenue
SELECT branch, city, SUM(total) AS total_revenue
FROM sales
GROUP BY city, branch 
ORDER BY total_revenue;

-- Determine product line with the highest Value Added Tax (VAT)
SELECT product_line, AVG(tax_pct) as avg_tax
FROM sales
GROUP BY product_line
ORDER BY avg_tax DESC;

-- Determine if each product line is performing above or below average
SELECT 
    product_line,
    CASE
        WHEN AVG(quantity) > 6 THEN "Good"
        ELSE "Bad"
    END AS remark
FROM sales
GROUP BY product_line;

-- Identify branches with sales above the average quantity
SELECT 
    branch, 
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM sales);

-- Determine most popular product line by gender
SELECT
    gender,
    product_line,
    COUNT(gender) AS total_count
FROM sales
GROUP BY gender, product_line
ORDER BY total_count DESC;

-- Calculate average rating for each product line
SELECT
    ROUND(AVG(rating), 2) as avg_rating,
    product_line
FROM sales
GROUP BY product_line
ORDER BY avg_rating DESC;

-- Identify unique customer types
SELECT DISTINCT customer_type
FROM sales;

-- Identify unique payment methods
SELECT DISTINCT payment
FROM sales;

-- Determine most common customer type
SELECT
    customer_type,
    count(*) as count
FROM sales
GROUP BY customer_type
ORDER BY count DESC;

-- Identify gender distribution of customers
SELECT
    gender,
    COUNT(*) as gender_count
FROM sales
GROUP BY gender
ORDER BY gender_count DESC;

-- Determine gender distribution per branch
SELECT
    gender,
    COUNT(*) as gender_count
FROM sales
WHERE branch = "C"
GROUP BY gender
ORDER BY gender_count DESC;

-- Identify time of day with highest average ratings
SELECT
    time_of_day,
    AVG(rating) AS avg_rating
FROM sales
GROUP BY time_of_day
ORDER BY avg_rating DESC;

-- Determine time of day with highest average ratings per branch
SELECT
    time_of_day,
    AVG(rating) AS avg_rating
FROM sales
WHERE branch = "A"
GROUP BY time_of_day
ORDER BY avg_rating DESC;

-- Identify day of the week with the best average ratings
SELECT
    day_name,
    AVG(rating) AS avg_rating
FROM sales
GROUP BY day_name 
ORDER BY avg_rating DESC;

-- Determine day of the week with the best average ratings per branch
SELECT 
    day_name,
    COUNT(day_name) total_sales
FROM sales
WHERE branch = "C"
GROUP BY day_name
ORDER BY total_sales DESC;

-- Determine number of sales made in each time of the day per weekday 
SELECT
    time_of_day,
    COUNT(*) AS total_sales
FROM sales
WHERE day_name = "Sunday"
GROUP BY time_of_day 
ORDER BY total_sales DESC;

-- Determine which customer type brings the most revenue
SELECT
    customer_type,
    SUM(total) AS total_revenue
FROM sales
GROUP BY customer_type
ORDER BY total_revenue;

-- Identify city with the largest tax/VAT percent
SELECT
    city,
    ROUND(AVG(tax_pct), 2) AS avg_tax_pct
FROM sales
GROUP BY city 
ORDER BY avg_tax_pct DESC;

-- Determine which customer type pays the most in VAT
SELECT
    customer_type,
    AVG(tax_pct) AS total_tax
FROM sales
GROUP BY customer_type
ORDER BY total_tax;
