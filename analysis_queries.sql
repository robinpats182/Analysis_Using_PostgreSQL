-- Total Revenue
SELECT SUM(quantity * unit_price) AS total_revenue
FROM online_retail;

-- Top 10 Products
SELECT description, SUM(quantity) AS total_sold
FROM online_retail
GROUP BY description
ORDER BY total_sold DESC
LIMIT 10;

-- Country with highest revenue
SELECT country, SUM(quantity * unit_price) AS revenue
FROM online_retail
GROUP BY country
ORDER BY revenue DESC;


-- Monthly sales trend
SELECT 
    DATE_TRUNC('month', TO_TIMESTAMP(invoice_date, 'DD/MM/YYYY HH24:MI')) AS month,
    SUM(quantity * unit_price) AS revenue
FROM online_retail
GROUP BY month
ORDER BY month;
