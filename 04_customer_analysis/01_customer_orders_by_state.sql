--Q6. Find the total number of orders placed by each customer, broken down by the state they live in.

SELECT c.customer_unique_id,
       c.customer_state,
       COUNT(DISTINCT o.order_id) as total_no_of_orders
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_unique_id,
         c.customer_state
ORDER BY total_no_of_orders DESC,
         c.customer_state;