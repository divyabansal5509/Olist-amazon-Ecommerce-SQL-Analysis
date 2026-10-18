--Q10. Find all products that have never been ordered.

SELECT product_id,
       product_category_name
FROM products
WHERE NOT EXISTS
        (SELECT 1
         FROM order_items
         WHERE products.product_id = order_items.product_id)
ORDER BY products.product_id;