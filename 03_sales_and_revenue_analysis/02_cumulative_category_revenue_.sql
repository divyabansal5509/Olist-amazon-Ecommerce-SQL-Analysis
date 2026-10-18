--Q2. For each product category, calculate the cumulative revenue generated as orders come in over time.
 WITH revenue AS
    (SELECT pc.product_category_name_english AS product_category,
            o.order_purchase_timestamp,
            sum(oi.price) as rev
     FROM products p
     INNER JOIN product_category_name_translation pc ON pc.product_category_name = p.product_category_name
     INNER JOIN order_items oi ON oi.product_id = p.product_id
     INNER JOIN orders o ON o.order_id = oi.order_id
     WHERE o.order_status = 'delivered'
     GROUP BY pc.product_category_name_english,
              o.order_purchase_timestamp)
SELECT product_category,
       order_purchase_timestamp,
       SUM(rev) OVER(PARTITION BY product_category
                     ORDER BY order_purchase_timestamp ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) cumulative_revenue
FROM revenue
ORDER BY product_category,
         order_purchase_timestamp;