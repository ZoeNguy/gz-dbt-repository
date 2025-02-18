WITH source AS (
    SELECT * FROM {{ source('raw', 'product') }}
),

renamed AS (
    SELECT
        product_id,
        product_name,
        category,
        purchase_price 
    FROM source
)

SELECT * FROM renamed; 
