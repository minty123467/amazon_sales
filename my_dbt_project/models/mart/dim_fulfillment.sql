{{ config(
  materialized='table'
) }}

SELECT 
    ROW_NUMBER() OVER (order by fulfillment) AS fulfillment_key,
    fulfillment,
    fulfilled_by,
    sales_channel,
    ship_service_level
FROM {{ ref('stg_fulfillment_dimension') }}
