-- Monthly sales KPIs. FactSales grain is one row per order line.
-- Apply the same valid-order and currency rules used by the BI semantic model.

SELECT
    DATE_TRUNC('month', CAST(order_date AS DATE)) AS sales_month,
    region,
    category,
    SUM(net_amount) AS net_sales,
    COUNT(DISTINCT order_id) AS orders,
    SUM(net_amount) / NULLIF(COUNT(DISTINCT order_id), 0) AS average_order_value
FROM analytics.sales_order_lines
WHERE order_status = 'COMPLETED'
GROUP BY 1, 2, 3
ORDER BY 1, 2, 3;

-- Data quality: duplicate order-line grain
SELECT order_line_id, COUNT(*) AS row_count
FROM analytics.sales_order_lines
GROUP BY order_line_id
HAVING COUNT(*) > 1;

-- Data quality: unresolved dimension references
SELECT f.*
FROM analytics.sales_order_lines f
LEFT JOIN analytics.dim_customer c ON c.customer_id = f.customer_id
WHERE c.customer_id IS NULL;
