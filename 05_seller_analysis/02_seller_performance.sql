--Q7. Identify sellers who registered on the platform but have never fulfilled a single order.

SELECT s.seller_id,
       s.seller_state
FROM sellers s
WHERE NOT EXISTS
        (SELECT 1
         FROM order_items oi
         INNER JOIN orders o USING(order_id)
         WHERE oi.seller_id = s.seller_id
             AND o.order_status = 'delivered')
ORDER BY s.seller_state;

--Q11. Find sellers who have fulfilled more orders than the average seller on the platform.
 WITH sellers_orders AS
    (SELECT s.seller_id,
            COUNT(DISTINCT o.order_id) AS delivered_orders
     FROM sellers s
     LEFT JOIN order_items oi ON s.seller_id = oi.seller_id
     LEFT JOIN orders o ON oi.order_id = o.order_id
     AND o.order_status = 'delivered'
     GROUP BY s.seller_id),
      avg_orders AS
    (SELECT AVG(delivered_orders) AS avg_delivered_orders
     FROM sellers_orders)
SELECT seller_id,
       delivered_orders,
       ROUND(avg_delivered_orders, 2) avg_delivered_orders
FROM sellers_orders
CROSS JOIN avg_orders ao
WHERE delivered_orders > avg_delivered_orders
ORDER BY delivered_orders DESC;