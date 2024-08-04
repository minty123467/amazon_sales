{{ config(
  materialized='table'
) }}

WITH date_data AS (
    SELECT DISTINCT
        CASE 
        -- Handle 'MM-DD-YY' format
        WHEN LEN(date) = 8 THEN CONVERT(VARCHAR(10), CONVERT(DATE, date, 1), 23)
        -- Handle 'MM-DD-YYYY' format
        WHEN LEN(date) = 10 THEN CONVERT(VARCHAR(10), CONVERT(DATE, date, 110), 23)
        -- If the format doesn't match expected patterns, return NULL or handle accordingly
        ELSE NULL
    END AS date
        
    FROM {{ source('amazon_sales', 'amazon_sales_report') }}
)

SELECT 
    ROW_NUMBER() OVER (order by date) AS date_key,
    CAST(date AS DATE) AS date,
        YEAR(CAST(date AS DATE)) AS year,
        MONTH(CAST(date AS DATE)) AS month,
        DAY(CAST(date AS DATE)) AS day,
        DATEPART(QUARTER, CAST(date AS DATE)) AS quarter
FROM date_data
