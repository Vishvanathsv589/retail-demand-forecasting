USE retail_analytics;

-- 1. Total sales by store
SELECT
    store,
    SUM(sales) AS total_sales
FROM retail_sales
GROUP BY store
ORDER BY total_sales DESC;

-- 2. Top 10 items by total sales
SELECT
    item,
    SUM(sales) AS total_sales
FROM retail_sales
GROUP BY item
ORDER BY total_sales DESC
LIMIT 10;

-- 3. Yearly sales analysis
SELECT
    YEAR(sale_date) AS year,
    SUM(sales) AS total_sales
FROM retail_sales
GROUP BY YEAR(sale_date)
ORDER BY year;

-- 4. Monthly sales analysis
SELECT
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    SUM(sales) AS total_sales
FROM retail_sales
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY year, month;

-- 5. Top store-item combinations
SELECT
    store,
    item,
    SUM(sales) AS total_sales
FROM retail_sales
GROUP BY store, item
ORDER BY total_sales DESC
LIMIT 20;
