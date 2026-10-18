--Q12. Find which Brazilian states have the highest average customer review score for orders delivered there.

SELECT c.customer_state,
       ROUND(AVG(ore.review_score), 2) as avg_customer_review
FROM customers c
INNER JOIN orders o USING(customer_id)
INNER JOIN order_reviews ore USING(order_id)
WHERE ore.review_score IS NOT NULL
and o.order_status = 'delivered'
GROUP BY c.customer_state
ORDER BY avg_customer_review DESC;