{{ config(
  materialized='table'
) }}

WITH sales_by_season AS (
    SELECT
        d.year as year,
        d.quarter as quarter,
        SUM(f.amount) AS total_sales
    FROM {{ ref('fact_sales') }} f
    JOIN {{ ref('dim_date') }} d ON f.date_key = d.date_key
    where order_status in ('Shipped - Delivered to Buyer','Shipped') 
    GROUP BY d.year, d.quarter
)

SELECT
    year,
    quarter,
    total_sales
FROM sales_by_season

