{{ config(
  materialized='table'
) }}

SELECT DISTINCT
    ship_city,
    ship_state,
    ship_postal_code,
    ship_country
FROM {{ source('amazon_sales', 'amazon_sales_report') }}
