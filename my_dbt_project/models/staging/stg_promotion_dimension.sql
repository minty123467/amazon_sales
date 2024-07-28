{{ config(
  materialized='table'
) }}

SELECT DISTINCT
    promotion_ids
FROM {{ source('amazon_sales', 'amazon_sales_report') }}
