{{ config(
  materialized='table'
) }}

SELECT DISTINCT
    fulfilment AS fulfillment,
    fulfilled_by,
    sales_channel,
    ship_service_level
FROM {{ source('amazon_sales', 'amazon_sales_report') }}
