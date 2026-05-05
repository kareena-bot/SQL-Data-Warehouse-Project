# 📘 GOLD Layer Data Catalog

## 📌 Overview
The **GOLD layer** represents a business-ready data model designed for analytics and reporting using a **star schema**.

### Key Features:
- ⭐ Star schema (Fact + Dimensions)
- ⚡ Optimized for BI tools (Power BI, Tableau)
- 🧹 Cleaned and curated data from SILVER layer
- 📊 Supports analytical queries and reporting

---

## 📊 Fact Table: `gold.fact_sales`

### 🧾 Description
Stores transactional sales data at the order level.

### 📏 Grain
> One row per **order line (per product, per customer, per order date)**

### 📋 Columns

| Column Name     | Data Type | Description | Example |
|----------------|----------|------------|---------|
| order_number   | string/int | Unique order identifier | `SO12345` |
| product_key    | int | Foreign key to `dim_products` | `101` |
| customer_key   | int | Foreign key to `dim_customers` | `205` |
| order_date     | date | Order placement date | `2024-01-15` |
| shipping_date  | date | Shipping date | `2024-01-17` |
| due_date       | date | Expected delivery date | `2024-01-25` |
| sales_amount   | decimal | Total sale value | `250.00` |
| sales_quantity | int | Units sold | `2` |
| sales_price    | decimal | Price per unit | `125.00` |

### 📝 Notes
- Contains **measurable metrics (facts)**
- All descriptive attributes are stored in dimension tables
- Supports aggregations (SUM, AVG, etc.)

---

## 🧩 Dimension Table: `gold.dim_customers`

### 🧾 Description
Stores customer attributes used for segmentation and analysis.

### 📋 Columns

| Column Name      | Data Type | Description | Example |
|-----------------|----------|------------|---------|
| customer_key    | int | Surrogate primary key | `205` |
| customer_id     | string/int | Source system ID | `CUST1001` |
| customer_number | string | Business identifier | `CN-00045` |
| first_name      | string | Customer first name | `John` |
| last_name       | string | Customer last name | `Doe` |
| country         | string | Customer country | `Australia`, `United Sates` |
| gender          | string | Customer gender | `Male`, `Female` |
| marital_status  | string | Marital status | `Single`, `Married` |
| birth_date      | date | Date of birth | `1990-06-15` |

### 📝 Notes
- Used for **customer segmentation**
- Enables analysis such as:
  - Sales by gender (Male vs Female)
  - Sales by country (USA vs Canada)

---

## 🧩 Dimension Table: `gold.dim_products`

### 🧾 Description
Stores product attributes and hierarchy.

### 📋 Columns

| Column Name    | Data Type | Description | Example |
|---------------|----------|------------|---------|
| product_key   | int | Surrogate primary key | `101` |
| product_id    | string/int | Source system ID | `P1001` |
| product_number| string | Business identifier | `PR-001` |
| product_name  | string | Product name | `Mountain Bike` |
| category_id   | string/int | Category ID | `10` |
| category      | string | Product category | `Bikes` |
| subcategory   | string | Product subcategory | `Mountain Bikes` |
| maintenance   | string | Maintenance classification | `High`, `Low` |
| product_cost  | decimal | Product cost | `80.00` |
| product_line  | string | Product line | `Premium`, `Standard` |
| start_date    | date | Availability start date | `2023-01-01` |

### 📝 Notes
- Supports:
  - Sales by category (Bikes vs Accessories)
  - Drill-down analysis (Category → Subcategory → Product)

---

## 🔗 Relationships

| From Table  | Column        | To Table        | Column        | Relationship |
|------------|--------------|----------------|--------------|-------------|
| fact_sales | customer_key | dim_customers  | customer_key | Many-to-One |
| fact_sales | product_key  | dim_products   | product_key  | Many-to-One |

---

## 🔑 Key Design
- Surrogate keys used (`*_key`)
- Fact table stores only:
  - Foreign keys
  - Measures
- Improves performance and consistency

---

## ⚠️ Design Considerations
- Consider adding a **Date Dimension (`dim_date`)**:
  - Example: `Year = 2024`, `Month = January`, `Quarter = Q1`
- Standardize categorical values:
  - Use consistent values like `Male` / `Female`

---

## 📊 Example Business Questions
- What is total revenue by product category?
- Which country generates the most sales?
- What are monthly sales trends?
- How does sales vary by customer demographics?

---

## 🚀 Architecture

```text
Bronze → Raw Data
Silver → Cleaned Data
Gold   → Star Schema (This Layer)
