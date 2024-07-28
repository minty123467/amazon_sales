{{ config(
  materialized='table'
) }}

SELECT 
    ROW_NUMBER() OVER (ORDER BY promotion_ids) AS promotion_key,
    promotion_ids
FROM {{ ref('stg_promotion_dimension') }}
