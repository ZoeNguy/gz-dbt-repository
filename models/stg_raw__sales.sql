version: 2

sources:
  - name: raw
    database: smart-ratio-449109-f5 
    schema: gz_raw_data
    tables:
      - name: sales
        identifier: raw_gz_sales
      - name: product
        identifier: raw_gz_product
      - name: ship
        identifier: raw_gz_ship
