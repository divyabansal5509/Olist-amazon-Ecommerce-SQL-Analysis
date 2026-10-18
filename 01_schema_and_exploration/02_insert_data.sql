
------Inserted the data in tables by using psql


-- CSV data loading commands for the Olist E-Commerce project
-- Run this file using psql.
-- Update the folder path to match your computer.

\copy customers FROM 'C:/YOUR/PROJECT/PATH/csv_files_data/01_customers_dataset.csv' WITH (FORMAT CSV, HEADER TRUE, ENCODING 'UTF8');

\copy orders FROM 'C:/YOUR/PROJECT/PATH/csv_files_data/02_orders_dataset.csv' WITH (FORMAT CSV, HEADER TRUE, ENCODING 'UTF8');

\copy order_items FROM 'C:/YOUR/PROJECT/PATH/csv_files_data/03_order_items_dataset.csv' WITH (FORMAT CSV, HEADER TRUE, ENCODING 'UTF8');

\copy products FROM 'C:/YOUR/PROJECT/PATH/csv_files_data/04_products_dataset.csv' WITH (FORMAT CSV, HEADER TRUE, ENCODING 'UTF8');

\copy order_payments FROM 'C:/YOUR/PROJECT/PATH/csv_files_data/05_order_payments_dataset.csv' WITH (FORMAT CSV, HEADER TRUE, ENCODING 'UTF8');

\copy sellers FROM 'C:/YOUR/PROJECT/PATH/csv_files_data/06_sellers_dataset.csv' WITH (FORMAT CSV, HEADER TRUE, ENCODING 'UTF8');

\copy order_reviews FROM 'C:/YOUR/PROJECT/PATH/csv_files_data/07_order_reviews_dataset.csv' WITH (FORMAT CSV, HEADER TRUE, ENCODING 'UTF8');

\copy product_category_name_translation FROM 'C:/YOUR/PROJECT/PATH/csv_files_data/08_product_category_name_translation.csv' WITH (FORMAT CSV, HEADER TRUE, ENCODING 'UTF8');

\copy geolocation FROM 'C:/YOUR/PROJECT/PATH/csv_files_data/09_geolocation_dataset.csv' WITH (FORMAT CSV, HEADER TRUE, ENCODING 'UTF8');
