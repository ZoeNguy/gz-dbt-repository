WITH source AS (
    SELECT * FROM {{ source('raw', 'sales') }}
)

SELECT 
    date_date,
    orders_id,
    pdt_id AS products_id,
    revenue,
    quantity
FROM source
