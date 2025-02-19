WITH sales AS (
    SELECT * FROM `smart-ratio-449109-f5`.`dbt_znguy`.`stg_raw__sales`
),

products AS (
    SELECT * FROM `smart-ratio-449109-f5`.`dbt_znguy`.`stg__product`
)

SELECT 
    sales.orders_id,
    sales.date_date,
    sales.pdt_id, 
    sales.quantity,
    sales.revenue,
    COALESCE(products.purchase_price, 0) AS purchase_price,
    SAFE_CAST(sales.quantity * COALESCE(products.purchase_price, 0) AS FLOAT64) AS purchase_cost,
    SAFE_CAST(sales.revenue - (sales.quantity * COALESCE(products.purchase_price, 0)) AS FLOAT64) AS margin
FROM sales
LEFT JOIN products
ON sales.pdt_id = products.products_id;