--Q8. Find the top 5 product categories by total revenue. 

SELECT
        pc.product_category_name_english product_category,
        ROUND(SUM(oi.price)::NUMERIC,2)  total_revenue
FROM product_category_name_translation pc
INNER JOIN products 
        USING(product_category_name)
INNER JOIN order_items oi
        USING(product_id)
INNER JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY pc.product_category_name_english
ORDER BY total_revenue DESC, product_category
LIMIT 5;

