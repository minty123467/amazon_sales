{{ config(
  materialized='table'
) }}

SELECT 
    ROW_NUMBER() OVER (ORDER BY sku) AS product_key,
    sku,
    asin,
    style,
    category,
    size
FROM {{ ref('stg_product_dimension') }}
