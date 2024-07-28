{{ config(
  materialized='table'
) }}

SELECT
    s.order_id,
    d.date_key,
    p.product_key,
    sh.shipping_key,
    pr.promotion_key,
    f.fulfillment_key,
    s.order_status,
    s.quantity,
    s.currency,
    s.amount
FROM {{ ref('stg_sales_data') }} s
JOIN {{ ref('dim_date') }} d ON s.order_date = d.date
JOIN {{ ref('dim_product') }} p ON s.sku = p.sku
JOIN {{ ref('dim_shipping') }} sh ON s.ship_postal_code = sh.ship_postal_code
JOIN {{ ref('dim_promotion') }} pr ON s.promotion_ids = pr.promotion_ids
JOIN {{ ref('dim_fulfillment') }} f ON s.fulfillment_status = f.fulfillment
