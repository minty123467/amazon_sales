{{ config(
  materialized='table'
) }}

WITH date_data AS (
    SELECT DISTINCT
        CAST(date AS DATE) AS date,
        YEAR(CAST(date AS DATE)) AS year,
        MONTH(CAST(date AS DATE)) AS month,
        DAY(CAST(date AS DATE)) AS day,
        DATEPART(QUARTER, CAST(date AS DATE)) AS quarter
    FROM {{ source('amazon_sales', 'amazon_sales_report') }}
)

SELECT 
    ROW_NUMBER() OVER (order by date) AS date_key,
    date,
    year,
    quarter,
    month,
    day
FROM date_data
