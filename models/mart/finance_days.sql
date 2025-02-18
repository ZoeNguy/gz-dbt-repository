WITH orders_operational AS (
    SELECT * FROM {{ ref('int_orders_operational') }}
),

aggregated_data AS (
    SELECT
        date_date,
        COUNT(DISTINCT orders_id) AS nb_transactions,
        SUM(total_revenue) AS total_revenue,
        ROUND(SUM(total_revenue) / COUNT(DISTINCT orders_id), 2) AS average_basket,
        SUM(total_margin) AS margin,
        SUM(operational_margin) AS operational_margin,
        SUM(total_purchase_cost) AS total_purchase_cost,
        SUM(shipping_fee) AS total_shipping_fees,
        SUM(log_cost) AS total_log_costs,
        SUM(total_quantity) AS total_quantity
    FROM orders_operational
    GROUP BY date_date
)

SELECT * FROM aggregated_data;
