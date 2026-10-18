--Q5. Find the average review score for each product category.
With DISTINCT_order AS
    (SELECT DISTINCT o.order_id,
                     pc.product_category_name_english AS product_category,
                     ore.review_score
     FROM products p
     INNER JOIN product_category_name_translation pc ON pc.product_category_name = p.product_category_name
     INNER JOIN order_items oi ON oi.product_id = p.product_id
     INNER JOIN orders o ON o.order_id = oi.order_id
     INNER JOIN order_reviews ore ON ore.order_id = o.order_id)
SELECT product_category,
       ROUND(AVG(review_score), 2) as avg_review_score
FROM DISTINCT_order
GROUP BY product_category
ORDER BY avg_review_score DESC;