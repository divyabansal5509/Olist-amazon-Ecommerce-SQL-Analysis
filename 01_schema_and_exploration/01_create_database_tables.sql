
-- Create/connect to your PostgreSQL database first, for example:
-- CREATE DATABASE amazon;
--DROP DATABASE amazon;
-- Table: customers
-- ----------------------------
DROP TABLE IF EXISTS "customers";
CREATE TABLE "customers" (
  "customer_id" VARCHAR(255) DEFAULT NULL,
  "customer_unique_id" VARCHAR(255) DEFAULT NULL,
  "customer_zip_code_prefix" INT DEFAULT NULL,
  "customer_city" VARCHAR(255) DEFAULT NULL,
  "customer_state" VARCHAR(255) DEFAULT NULL
);
-- ----------------------------
-- Table: geolocation
-- ----------------------------

DROP TABLE IF EXISTS "geolocation";

CREATE TABLE "geolocation" (
  "geolocation_zip_code_prefix" INT DEFAULT NULL,
  "geolocation_lat" DOUBLE PRECISION DEFAULT NULL,
  "geolocation_lng" DOUBLE PRECISION DEFAULT NULL,
  "geolocation_city" VARCHAR(255) DEFAULT NULL,
  "geolocation_state" VARCHAR(255) DEFAULT NULL
);



-- ----------------------------
-- Table: order_items
-- ----------------------------
DROP TABLE IF EXISTS "order_items";

CREATE TABLE "order_items" (
  "order_id" VARCHAR(255) DEFAULT NULL,
  "order_item_id" INT DEFAULT NULL,
  "product_id" VARCHAR(255) DEFAULT NULL,
  "seller_id" VARCHAR(255) DEFAULT NULL,
  "shipping_limit_date" TIMESTAMP DEFAULT NULL,
  "price" DOUBLE PRECISION DEFAULT NULL,
  "freight_value" DOUBLE PRECISION DEFAULT NULL
);


-- ----------------------------
-- Table: order_payments
-- ----------------------------

DROP TABLE IF EXISTS "order_payments";
CREATE TABLE "order_payments" (
  "order_id" VARCHAR(255) DEFAULT NULL,
  "payment_sequential" INT DEFAULT NULL,
  "payment_type" VARCHAR(255) DEFAULT NULL,
  "payment_installments" INT DEFAULT NULL,
  "payment_value" DOUBLE PRECISION DEFAULT NULL
);


-- ----------------------------
-- Table: order_reviews
-- ----------------------------
DROP TABLE IF EXISTS "order_reviews";
CREATE TABLE "order_reviews" (
  "review_id" VARCHAR(255) DEFAULT NULL,
  "order_id" VARCHAR(255) DEFAULT NULL,
  "review_score" INT DEFAULT NULL,
  "review_comment_title" VARCHAR(255) DEFAULT NULL,
  "review_comment_message" VARCHAR(255) DEFAULT NULL,
  "review_creation_date" TIMESTAMP DEFAULT NULL,
  "review_answer_timestamp" TIMESTAMP DEFAULT NULL
);

-- ----------------------------
-- Table: orders
-- ----------------------------
DROP TABLE IF EXISTS "orders";
CREATE TABLE "orders" (
  "order_id" VARCHAR(255) DEFAULT NULL,
  "customer_id" VARCHAR(255) DEFAULT NULL,
  "order_status" VARCHAR(255) DEFAULT NULL,
  "order_purchase_timestamp" TIMESTAMP DEFAULT NULL,
  "order_approved_at" TIMESTAMP DEFAULT NULL,
  "order_delivered_carrier_date" TIMESTAMP DEFAULT NULL,
  "order_delivered_customer_date" TIMESTAMP DEFAULT NULL,
  "order_estimated_delivery_date" TIMESTAMP DEFAULT NULL
);

-- ----------------------------
-- Table: product_category_name_translation
-- ----------------------------
DROP TABLE IF EXISTS "product_category_name_translation";
CREATE TABLE "product_category_name_translation" (
  "product_category_name" VARCHAR(255) DEFAULT NULL,
  "product_category_name_english" VARCHAR(255) DEFAULT NULL
);


-- ----------------------------
-- Table: products
-- ----------------------------
DROP TABLE IF EXISTS "products";
CREATE TABLE "products" (
  "product_id" VARCHAR(255) DEFAULT NULL,
  "product_category_name" VARCHAR(255) DEFAULT NULL,
  "product_name_lenght" DOUBLE PRECISION DEFAULT NULL,
  "product_description_lenght" DOUBLE PRECISION DEFAULT NULL,
  "product_photos_qty" DOUBLE PRECISION DEFAULT NULL,
  "product_weight_g" DOUBLE PRECISION DEFAULT NULL,
  "product_length_cm" DOUBLE PRECISION DEFAULT NULL,
  "product_height_cm" DOUBLE PRECISION DEFAULT NULL,
  "product_width_cm" DOUBLE PRECISION DEFAULT NULL
);


-- ----------------------------
-- Table: sellers
-- ----------------------------
DROP TABLE IF EXISTS "sellers";
CREATE TABLE "sellers" (
  "seller_id" VARCHAR(255) DEFAULT NULL,
  "seller_zip_code_prefix" INT DEFAULT NULL,
  "seller_city" VARCHAR(255) DEFAULT NULL,
  "seller_state" VARCHAR(255) DEFAULT NULL
);

