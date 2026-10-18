# Olist E-Commerce SQL Analysis

## Project Overview

This project explores Brazilian e-commerce data from Olist using SQL to answer business questions and identify insights related to orders, customers, sellers, products, and payments.

The goal is to practice SQL-based data analysis by working with multiple related tables, validating data, and translating business questions into structured queries.

## Dataset

- **Source:** [Brazilian E-Commerce Public Dataset by Olist — Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- **Domain:** E-commerce
- **Database:** PostgreSQL
- **Language:** SQL

## Tools & Skills

- PostgreSQL
- SQL joins and aggregations
- Common Table Expressions (CTEs)
- Window functions
- Data validation and quality checks
- Business-oriented data analysis

## Project Workflow & Analysis

The project is organized into seven phases, moving from understanding the dataset to analyzing business performance and customer experience.

### 1. Schema & Database Exploration
- `01_create_database_tables.sql` — Database and table setup
- `02_insert_data.sql` — Data loading
- `03_database_exploration.sql` — Initial database exploration

### 2. Basic Business Metrics
- `01_orders_and_payments.sql` — Order and payment analysis
- `02_customer_spending.sql` — Customer spending analysis

### 3. Sales & Revenue Analysis
- `01_category_revenue.sql` — Revenue by product category
- `02_cumulative_category_revenue_.sql` — Cumulative category revenue analysis

### 4. Customer Analysis
- `01_customer_orders_by_state.sql` — Customer order analysis by state
- `02_customers_without_reviews.sql` — Customers without reviews

### 5. Seller Analysis
- `01_seller_order_volume_by_state_.sql` — Seller order volume by state
- `02_seller_performance.sql` — Seller performance analysis

### 6. Product Analysis
- `01_products_never_ordered.sql` — Products that have never been ordered

### 7. Customer Experience
- `01_category_review_scores_.sql` — Review scores by category
- `02_state_review_scores.sql` — Review scores by state
- `03_delivery_time_analysis_.sql` — Delivery-time analysis

## Technical Skills Demonstrated

- PostgreSQL and relational database exploration
- Multi-table joins
- Aggregations and grouping
- Revenue and customer spending analysis
- Cumulative analysis
- Data quality and missing-review checks
- Seller, product, and customer experience analysis

## Key Findings

### Product Category Revenue Analysis

The SQL analysis identified the following top five product categories by reported revenue:

1. **Health & Beauty** — 1,233,131.72
2. **Watches & Gifts** — 1,166,176.98
3. **Bed, Bath & Table** — 1,023,434.76
4. **Sports & Leisure** — 954,852.55
5. **Computers & Accessories** — 888,724.61

**Business takeaway:** Health & Beauty recorded the highest revenue among the categories returned by the query, followed by Watches & Gifts. These results provide a starting point for deeper analysis of category performance and revenue trends.

*Note: Revenue units and calculation should be interpreted according to the SQL query used.*

### Cumulative Revenue Analysis

Used a Common Table Expression (CTE) to aggregate delivered-order item revenue by product category and purchase timestamp, then applied a window function to calculate cumulative revenue over time.

**SQL concepts practiced:**
- Multi-table joins
- Aggregate functions and grouping
- CTEs
- Window functions with `PARTITION BY` and `ORDER BY`
- Running totals using `ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW`

**Business purpose:** Understand how product-category revenue accumulates as delivered orders are recorded over time.

**Revenue definition:** This analysis sums item prices and excludes freight charges, using only orders with a `delivered` status.

### Seller Order Volume by State

Analyzed delivered orders by seller state using joins across the `sellers`, `order_items`, and `orders` tables.

**Top results:**
1. **SP:** 68,641 delivered orders
2. **MG:** 7,735 delivered orders
3. **PR:** 7,512 delivered orders
4. **RJ:** 4,227 delivered orders
5. **SC:** 3,603 delivered orders

**Business takeaway:** SP accounts for the highest seller-associated delivered-order volume in this analysis. Further analysis of seller counts and order distribution could help explain this concentration.

**SQL concepts practiced:** Multi-table joins, `COUNT(DISTINCT ...)`, filtering, grouping, and sorting aggregated results.

### Sellers Without Delivered Orders

Used a correlated subquery with `NOT EXISTS` to identify registered sellers who have no associated order items belonging to delivered orders.

**Result:** The query returned 125 sellers.

**Business takeaway:** These sellers may warrant further investigation to understand whether they have received orders, whether their orders were canceled or remain unfulfilled, or whether they are inactive on the platform.

**SQL concepts practiced:** Correlated subqueries, `NOT EXISTS`, joins, and filtering by order status.

*Note: The result identifies sellers without delivered orders, not necessarily sellers who have never received an order.*

### Products Never Ordered

Used a correlated subquery with `NOT EXISTS` to identify products in the catalog that have no matching records in `order_items`.

**Result:** The query returned 0 rows, meaning every product in the current dataset has at least one matching order-item record.

**Business takeaway:** No never-ordered products were identified in this dataset. Further analysis of order frequency and sales volume would be needed to identify low-demand products.

**SQL concepts practiced:** Correlated subqueries, `NOT EXISTS`, and product catalog analysis.

### Product Category Review Score Analysis

Analyzed average customer review scores across product categories using joins between products, category translations, order items, orders, and order reviews.

**Top results:**
- **CDs & DVDs:** 4.67
- **Fashion — Children's Clothes:** 4.50
- **Books — General Interest:** 4.46
- **Construction Tools:** 4.43
- **Technical Books:** 4.40

**Business takeaway:** CDs & DVDs recorded the highest average review score among the categories displayed. Comparing review scores alongside review counts and sales volume could help distinguish consistently strong customer experiences from categories with fewer reviews.

**SQL concepts practiced:** Multi-table joins, CTEs, `DISTINCT`, aggregate functions, `ROUND()`, `GROUP BY`, and sorting aggregated results.

### Customer Review Scores by State

Calculated average customer review scores for delivered orders, grouped by customer state. Null review scores were excluded from the analysis.

**Top results shown:**
- **AP:** 4.19
- **PR:** 4.18
- **AM:** 4.18
- **SP:** 4.17
- **MG:** 4.14
- **RS:** 4.13

**Business takeaway:** AP recorded the highest average review score among the states shown. Review counts and delivery performance could be examined alongside these averages to better understand differences in customer experience.

**SQL concepts practiced:** Multi-table joins, filtering null values, `AVG()`, `ROUND()`, `GROUP BY`, and sorting aggregated results.

## Repository Contents

- **Analysis folders:** Seven organized phases of SQL analysis
- **CSV datasets:** Nine Olist dataset files
- **ER diagram:** Visual representation of database relationships
- **Data dictionary:** Dataset reference
- **Project report:** PDF documentation
- **SQL scripts:** Database setup, exploration, and business analysis

## Learning Objective

This project supports my journey toward a Data Analyst role by helping me practice translating e-commerce business questions into SQL queries and organizing the analysis into a reproducible workflow.

---

**Author:** Divya Bansal  
**Focus:** Data Analytics | SQL | PostgreSQL
