--Q1. Find the total number of orders fulfilled by each seller state.

SELECT sellers.seller_state,
       COUNT(DISTINCT orders.order_id) as delivered_orders
FROM sellers
INNER JOIN order_items 
    ON order_items.seller_id = sellers.seller_id
INNER JOIN orders 
    ON orders.order_id = order_items.order_id
WHERE orders.order_status = 'delivered'
GROUP BY sellers.seller_state,
         orders.order_status
ORDER BY delivered_orders DESC;
