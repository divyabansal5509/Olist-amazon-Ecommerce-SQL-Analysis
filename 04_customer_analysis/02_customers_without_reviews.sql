--Q13. Identify customers who have placed orders but never left a review.

SELECT DISTINCT c.customer_unique_id
FROM customers c
INNER JOIN orders o USING(customer_id)
WHERE NOT EXISTS
                (SELECT 1
                 FROM customers c1
                 INNER JOIN orders o2 USING (customer_id)
                 INNER JOIN order_reviews ore USING (order_id)
                 WHERE c1.customer_unique_id = c.customer_unique_id) ;

                 