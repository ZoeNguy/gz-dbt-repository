WITH sales_margin AS (
    SELECT * FROM {{ ref('int_sales_margin') }}
)

SELECT 
    orders_id,
    date_date,
    SUM(revenue) AS total_revenue,
    SUM(quantity) AS total_quantity,
    SUM(purchase_cost) AS total_purchase_cost,
    SUM(margin) AS total_margin
FROM sales_margin
GROUP BY orders_id, date_date;
