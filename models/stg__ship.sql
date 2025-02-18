WITH source AS (
WITH source AS (
    SELECT * FROM {{ source('raw', 'ship') }}
),

renamed AS (
    SELECT
        ship_id,
        order_id,
        shipping_fee,
        shipping_fee_1,
        ship_cost
    FROM source
)

SELECT * FROM renamed;
