{{ config(
  materialized='table'
) }}

SELECT 
    ROW_NUMBER() OVER (ORDER BY ship_postal_code) AS shipping_key,
    ship_city,
    ship_state,
    ship_postal_code,
    ship_country
FROM {{ ref('stg_shipping_dimension') }}
