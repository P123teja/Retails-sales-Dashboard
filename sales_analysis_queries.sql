-- Retail Sales Performance Analysis SQL Queries
-- Import retail_sales_data.csv into a table named retail_sales.

-- 1. Overall KPI summary
SELECT
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    COUNT(DISTINCT Order_ID) AS total_orders,
    ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS profit_margin_percent
FROM retail_sales;

-- 2. Region-wise sales and profit
SELECT
    Region,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS profit_margin_percent
FROM retail_sales
GROUP BY Region
ORDER BY total_sales DESC;

-- 3. Category-wise performance
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    SUM(Quantity) AS total_quantity
FROM retail_sales
GROUP BY Category
ORDER BY total_sales DESC;

-- 4. Monthly sales trend
SELECT
    Month,
    ROUND(SUM(Sales), 2) AS monthly_sales,
    ROUND(SUM(Profit), 2) AS monthly_profit
FROM retail_sales
GROUP BY Month
ORDER BY Month;

-- 5. Top 10 states by sales
SELECT
    State,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM retail_sales
GROUP BY State
ORDER BY total_sales DESC
LIMIT 10;

-- 6. Underperforming regions by profit margin
SELECT
    Region,
    ROUND(SUM(Profit) * 100.0 / SUM(Sales), 2) AS profit_margin_percent
FROM retail_sales
GROUP BY Region
ORDER BY profit_margin_percent ASC;
