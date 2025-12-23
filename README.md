# Online Retail Analysis

SQL queries for analyzing e-commerce transaction data and generating business insights.

## Overview

This repository contains analysis queries for the online retail dataset. The queries extract key business metrics including total revenue, product performance, geographic trends, and sales patterns over time.

## Database Schema

The analysis uses an `online_retail` table:

| Column | Type | Description |
|--------|------|-------------|
| `invoice_no` | TEXT | Unique invoice identifier |
| `stock_code` | TEXT | Product stock code |
| `description` | TEXT | Product description |
| `quantity` | INT | Quantity purchased |
| `unit_price` | NUMERIC | Price per unit |
| `customer_id` | TEXT | Unique customer identifier |
| `country` | TEXT | Customer's country |

## Queries

### Total Revenue
Calculates the sum of all transaction revenues by multiplying quantity by unit price across the entire dataset.

```sql
SELECT SUM(quantity * unit_price) AS total_revenue
FROM online_retail;
```

**Output:** Single row with total revenue figure.

**Insights:** Provides the baseline metric for overall business performance and serves as a reference point for profitability analysis and year-over-year growth calculations.

### Top 10 Products
Identifies the 10 best-selling products by quantity sold, grouped by product description and ordered in descending order.

```sql
SELECT description, SUM(quantity) AS total_sold
FROM online_retail
GROUP BY description
ORDER BY total_sold DESC
LIMIT 10;
```

**Output:** Product description and total quantity sold for each of the top 10 products.

**Insights:** Reveals which products drive the highest demand and sales volume. This helps with inventory planning, marketing focus, and identifying customer preferences. Top products may have higher margins or represent core business offerings.

### Country Performance
Ranks all countries by their total revenue generated, showing which geographic markets are the most valuable.

```sql
SELECT country, SUM(quantity * unit_price) AS revenue
FROM online_retail
GROUP BY country
ORDER BY revenue DESC;
```

**Output:** Country name and total revenue, ordered from highest to lowest revenue.

**Insights:** Identifies which geographic markets are most profitable and represent the largest revenue opportunities. Helps prioritize international expansion, localization efforts, and regional marketing strategies. Can reveal untapped or underperforming markets.

### Monthly Sales Trend
Aggregates revenue by month to show sales performance over time. Useful for identifying seasonal patterns, growth trends, and revenue fluctuations.

```sql
SELECT 
    DATE_TRUNC('month', TO_TIMESTAMP(invoice_date, 'DD/MM/YYYY HH24:MI')) AS month,
    SUM(quantity * unit_price) AS revenue
FROM online_retail
GROUP BY month
ORDER BY month;
```

**Output:** Month and corresponding revenue, ordered chronologically.

**Insights:** Reveals sales patterns across time periods, helping identify seasonal trends, growth trajectories, and potential declining periods. Essential for forecasting, inventory management, and timing promotional campaigns. Can indicate the impact of business changes or external factors on revenue.

## Notes

- Invoice dates are formatted as `DD/MM/YYYY HH24:MI`
- Revenue is calculated as `quantity * unit_price`