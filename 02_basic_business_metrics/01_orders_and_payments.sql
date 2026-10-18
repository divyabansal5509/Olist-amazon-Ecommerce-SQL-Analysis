--Q3. Which payment method do customers use the most, and
--what is the average order value for each payment type?
WITH order_totals AS
    (SELECT order_id,
            SUM(payment_value) order_value
     FROM order_payments
     GROUP BY order_id),
     order_payment_types AS
    (SELECT DISTINCT order_id,
                     payment_type
     FROM order_payments)
SELECT opt.payment_type,
       COUNT(*) AS orders_count,
       ROUND(AVG(ot.order_value)::NUMERIC, 2) AS avg_order_value
FROM order_payment_types opt
INNER JOIN order_totals ot ON opt.order_id = ot.order_id
GROUP BY opt.payment_type
ORDER BY orders_count DESC;

--Q14. Find the month with the highest number of orders placed across the entire platform.
 --Approach 1

SELECT DATE_TRUNC('month', order_purchase_timestamp) monthz,
       COUNT(order_id) as total_orders
FROM orders
GROUP BY DATE_TRUNC('month', order_purchase_timestamp)
ORDER BY total_orders DESC
LIMIT 1;

--Approach 2
WITH monthly_orders AS
    (SELECT DATE_TRUNC('month', order_purchase_timestamp) AS month_start,
            COUNT(*) AS total_orders
     FROM orders
     WHERE order_purchase_timestamp IS NOT NULL
     GROUP BY DATE_TRUNC('month', order_purchase_timestamp))
SELECT TO_CHAR(month_start, 'Month YYYY') AS month_name,
       total_orders
FROM monthly_orders
ORDER BY total_orders DESC
LIMIT 1;