{{ config(
  materialized='table'
) }}

SELECT DISTINCT
    sku,
    asin,
    style,
    category,
    size
FROM {{ source('amazon_sales', 'amazon_sales_report') }}
