{{ config(
  materialized='table'
) }}

WITH sales_in_mumbai AS (
    SELECT 
        p.style,
        p.category,
        SUM(f.quantity) AS total_quantity
    FROM {{ ref('fact_sales') }} f
    JOIN {{ ref('dim_product') }} p ON f.product_key = p.product_key
    JOIN {{ ref('dim_shipping') }} s ON f.shipping_key = s.shipping_key
    WHERE s.ship_city = 'Mumbai'
    GROUP BY p.style, p.category
)

SELECT
    style,
    category,
    total_quantity
FROM sales_in_mumbai
ORDER BY total_quantity DESC
