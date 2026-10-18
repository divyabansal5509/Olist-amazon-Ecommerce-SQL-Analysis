-- Count of rows in each table

SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL
SELECT 'geolocation', COUNT(*) FROM geolocation
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'order_payments', COUNT(*) FROM order_payments
UNION ALL
SELECT 'order_reviews', COUNT(*) FROM order_reviews
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'product_category_name_translation', COUNT(*) FROM product_category_name_translation
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'sellers', COUNT(*) FROM sellers
ORDER BY table_name;


SELECT
    schemaname,
    relname AS table_name,
    n_live_tup AS estimated_rows
FROM pg_stat_user_tables
ORDER BY relname;


--  columns exist in each table and what their data types are
--- actual order defined in each table  -> ordinal_position
SELECT
    table_name,
    column_name,
    data_type
FROM information_schema.columns
WHERE table_schema = 'public'
ORDER BY table_name,ordinal_position;


--=====================================
--Profiling data for Orders table
--=====================================

--checking for nulls and duplicate
SELECT order_id,
    COUNT(order_id)
FROM orders
WHERE order_id IS NULL
GROUP BY order_id
HAVING COUNT(order_id)>1 ;

--find customer_id values in orders that do not exist in the customers table.

SELECT o.customer_id 
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
where c.customer_id is null;

--What order statuses actually exist in the dataset, and
-- how many orders are there for each status?

SELECT order_status, count(order_id) as Orders FROM orders
GROUP BY order_status;

--Check how many order_purchase_timestamp values are NULL.
--Modify your previous query to show the order_status and
--the number of orders with missing approval timestamps for each status.
SELECT order_status, COUNT(*)
FROM orders o
WHERE order_approved_at IS NULL 
GROUP BY order_status; --order_purchase_timestamp

--Now let's check how many orders have a missing carrier-delivery timestamp.
SELECT  order_status,COUNT(*)
FROM orders o
WHERE order_delivered_carrier_date IS NULL 
GROUP BY order_status;

--Now check how many orders have a missing customer-delivery timestamp.
SELECT  order_status,COUNT(*)
FROM orders o
WHERE order_delivered_customer_date IS NULL 
GROUP BY order_status;

SELECT COUNT(*)
FROM orders
WHERE order_estimated_delivery_date IS NULL;

--Find orders where order_approved_at is earlier than order_purchase_timestamp.

SELECT * FROM orders
    WHERE order_approved_at < order_purchase_timestamp;

--discuss it
SELECT order_id, order_approved_at, order_delivered_carrier_date FROM orders
    WHERE order_delivered_carrier_date < order_approved_at limit 10;

SELECT * FROM orders
    WHERE order_approved_at < order_purchase_timestamp;

SELECT COUNT(*) FROM orders
    WHERE order_delivered_customer_date < order_delivered_carrier_date;

SELECT COUNT(*) FROM orders
    WHERE
order_delivered_customer_date > order_estimated_delivery_date;

Select 
MIN(order_purchase_timestamp),
MAX(order_purchase_timestamp)
FROM orders;


--====================
--CHeck order-items
---===================

SELECT * 
FROM order_items;


--CHECK missing values in important columns
SELECT
    COUNT(*) FILTER (WHERE order_id IS NULL) AS missing_order_id,
    COUNT(*) FILTER (WHERE product_id IS NULL) AS missing_product_id,
    COUNT(*) FILTER (WHERE seller_id IS NULL) AS missing_seller_id,
    COUNT(*) FILTER (WHERE price IS NULL) AS missing_price,
    COUNT(*) FILTER (WHERE freight_value IS NULL) AS missing_freight
FROM order_items;

--Check whether prices or freight values are negative
SELECT
    COUNT(*) FILTER (WHERE price < 0) AS negative_prices,,
    COUNT(*) FILTER (WHERE freight_value < 0) AS negative_freight
FROM order_items;

--Let's check whether every order item connects to a valid order, product, and seller.

SELECT
    COUNT(*) FILTER (WHERE o.order_id IS NULL) AS unmatched_orders,
    COUNT(*) FILTER (WHERE p.product_id IS NULL) AS unmatched_products,
    COUNT(*) FILTER (WHERE s.seller_id IS NULL) AS unmatched_sellers
FROM order_items oi
LEFT JOIN orders o
    ON oi.order_id = o.order_id
LEFT JOIN products p
    ON oi.product_id = p.product_id
LEFT JOIN sellers s
    ON oi.seller_id = s.seller_id;


--=====================
--CHeck order_payments
---====================

SELECT
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (WHERE order_id IS NULL) AS missing_order_id,
    COUNT(*) FILTER (WHERE payment_type IS NULL) AS missing_payment_type,
    COUNT(*) FILTER (WHERE payment_value IS NULL) AS missing_payment_value,
    COUNT(*) FILTER (WHERE payment_value < 0) AS negative_payment_value
FROM order_payments;

--=====================
--CHeck order_reviews
---====================

SELECT
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (WHERE review_id IS NULL) AS missing_review_id,
    COUNT(*) FILTER (WHERE order_id IS NULL) AS missing_order_id,
    COUNT(*) FILTER (WHERE review_score IS NULL) AS missing_review_score,
    COUNT(*) FILTER (
        WHERE review_score NOT BETWEEN 1 AND 5
    ) AS invalid_review_score
FROM order_reviews;

--=====================
--CHeck products
---====================

SELECT
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (WHERE product_id IS NULL) AS missing_product_id,
    COUNT(DISTINCT product_id) AS unique_product_ids,
    COUNT(*) FILTER (WHERE product_category_name IS NULL) AS missing_category
FROM products;

--=====================
--CHeck sellers
---====================

SELECT
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (WHERE seller_id IS NULL) AS missing_seller_id,
    COUNT(DISTINCT seller_id) AS unique_seller_ids,
    COUNT(*) FILTER (WHERE seller_state IS NULL) AS missing_seller_state
FROM sellers;

--=====================
--CHeck Customers
---====================

SELECT
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (WHERE customer_id IS NULL) AS missing_customer_id,
    COUNT(DISTINCT customer_id) AS unique_customer_ids,
    COUNT(*) FILTER (WHERE customer_state IS NULL) AS missing_customer_state
FROM customers;


--=====================
--CHeck product_category_name_translation
---====================

SELECT
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (WHERE product_category_name IS NULL) AS missing_category_name,
    COUNT(*) FILTER (WHERE product_category_name_english IS NULL) AS missing_english_name,
    COUNT(DISTINCT product_category_name) AS unique_category_names
FROM product_category_name_translation;

--=====================
--CHeck Geolocation
---====================

SELECT
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (WHERE geolocation_zip_code_prefix IS NULL) AS missing_zip,
    COUNT(*) FILTER (WHERE geolocation_lat IS NULL) AS missing_latitude,
    COUNT(*) FILTER (WHERE geolocation_lng IS NULL) AS missing_longitude,
    COUNT(*) FILTER (WHERE geolocation_city IS NULL) AS missing_city,
    COUNT(*) FILTER (WHERE geolocation_state IS NULL) AS missing_state
FROM geolocation;
