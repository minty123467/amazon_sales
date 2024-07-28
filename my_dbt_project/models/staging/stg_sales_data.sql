{{ config(
  materialized='table'
) }}

SELECT
    order_id,
    date AS order_date,
    status AS order_status,
    fulfilment AS fulfillment_status,
    sales_channel,
    ship_service_level,
    style,
    sku,
    category,
    size,
    asin,
    courier_status,
    qty AS quantity,
    currency,
    amount,
    ship_city,
    ship_state,
    ship_postal_code,
    ship_country,
    promotion_ids,
    b2b,
    fulfilled_by
FROM {{ source('amazon_sales', 'amazon_sales_report') }}
