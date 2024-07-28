{{ config(
  materialized='table'
) }}

SELECT 
    date_key,
    date,
    year,
    quarter,
    month,
    day
FROM {{ ref('stg_date_dimension') }}
