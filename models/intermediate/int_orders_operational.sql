WITH orders_margin AS (
    SELECT * FROM {{ ref('int_orders_margin') }}
),

shipping AS (
    SELECT * FROM {{ ref('stg__ship') }}
)

SELECT 
    orders_margin.orders_id,
    orders_margin.date_date,
    orders_margin.total_margin,
    shipping.shipping_fee,
    CAST(shipping.ship_cost AS FLOAT64) AS ship_cost,
    CAST(shipping.log_cost AS FLOAT64) AS log_cost,
    CAST(orders_margin.total_margin + shipping.shipping_fee - shipping.log_cost - shipping.ship_cost AS FLOAT64) AS operational_margin
FROM orders_margin
LEFT JOIN shipping
ON orders_margin.orders_id = shipping.order_id;
