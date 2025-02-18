WITH sales AS (
    SELECT * FROM {{ ref('stg_raw__sales') }} 
),

products AS (
    SELECT * FROM {{ ref('stg__product') }} 
)

SELECT 
    sales.orders_id,
    sales.date_date,
    sales.pdt_id AS product_id,
    sales.quantity,
    sales.revenue,
    products.purchase_price,
    CAST(sales.quantity * products.purchase_price AS FLOAT64) AS purchase_cost,
    CAST(sales.revenue - (sales.quantity * products.purchase_price) AS FLOAT64) AS margin
FROM sales
LEFT JOIN products
ON sales.pdt_id = products.product_id;

