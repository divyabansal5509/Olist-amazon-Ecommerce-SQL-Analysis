-- Q4. Find the customer who has spent the most money across all their orders. 

SELECT
    c.customer_unique_id,
    SUM(op.payment_value) total_amount
FROM customers c 
INNER JOIN 
orders o
ON c.customer_id = o.customer_id
INNER JOIN
order_payments op
ON op.order_id = o.order_id
GROUP BY 
c.customer_unique_id
ORDER BY total_amount DESC LIMIT 1 ;

