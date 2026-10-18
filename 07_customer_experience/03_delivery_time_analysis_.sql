--Q9. Find the median delivery time (in days) between order placement and actual delivery.
 With delivery_time AS
    (SELECT EXTRACT(EPOCH
                    FROM (order_delivered_customer_date - order_purchase_timestamp)) / 86400.0 AS delivery_days
     FROM orders
     WHERE order_status = 'delivered'
         AND order_delivered_customer_date IS NOT NULL
         AND order_purchase_timestamp IS NOT NULL)
SELECT ROUND(PERCENTILE_CONT(0.50) WITHIN GROUP (
                                                 ORDER BY delivery_days)::NUMERIC, 2) median_delivery_days
FROM delivery_time;