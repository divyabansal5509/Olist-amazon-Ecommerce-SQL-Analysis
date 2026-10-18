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
