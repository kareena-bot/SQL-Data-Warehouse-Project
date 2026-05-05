## 🏷️ Naming Conventions

### 📌 Overview
This project follows consistent naming conventions to ensure:
- Readability and clarity  
- Ease of use for analysts and developers  
- Alignment with data warehousing best practices  

---

## 🧱 Schema Naming

| Layer  | Schema Name | Description |
|--------|------------|------------|
| Bronze | `bronze`   | Raw, ingested data from source systems |
| Silver | `silver`   | Cleaned and transformed data |
| Gold   | `gold`     | Business-ready star schema for analytics |

---

## 📊 Table Naming

### Fact Tables
- Prefix: `fact_`
- Example: `gold.fact_sales`

👉 Represents measurable business events

---

### Dimension Tables
- Prefix: `dim_`
- Example: `gold.dim_customers`, `gold.dim_products`

👉 Stores descriptive attributes used for filtering and grouping

---

## 🔑 Key Naming

| Key Type        | Naming Pattern      | Example |
|----------------|-------------------|---------|
| Primary Key    | `<entity>_key`     | `customer_key`, `product_key` |
| Foreign Key    | `<entity>_key`     | `customer_key`, `product_key` |
| Business Key   | `<entity>_id`      | `customer_id`, `product_id` |

### Notes
- Surrogate keys (`*_key`) are system-generated  
- Business keys (`*_id`) come from source systems  
- Fact tables store only foreign keys (not descriptive fields)

---

## 🧾 Column Naming

### General Rules
- Use **snake_case** (lowercase with underscores)
- Avoid spaces and special characters
- Use clear, descriptive names

### Examples
| Good Naming        | Avoid |
|------------------|------|
| `first_name`      | `FirstName` |
| `sales_amount`    | `salesAmount` |
| `order_date`      | `Order Date` |

---

## 📅 Date Columns
- Suffix: `_date`
- Examples:
  - `order_date`
  - `shipping_date`
  - `due_date`

👉 Clearly indicates date-type fields

---

## 📊 Measure Naming (Fact Table)

| Column           | Description |
|------------------|------------|
| `sales_amount`   | Total revenue |
| `sales_quantity` | Number of units sold |
| `sales_price`    | Price per unit |

👉 Measures are:
- Numeric  
- Additive (can be aggregated)

---

## 🧩 Dimension Attribute Naming

- Use business-friendly names  
- Avoid abbreviations where possible  

### Examples:
- `country` → `USA`, `Canada`  
- `gender` → `Male`, `Female`  
- `marital_status` → `Single`, `Married`  

---

## 🚫 What We Avoid

- ❌ Mixed naming styles (`camelCase`, `PascalCase`)  
- ❌ Abbreviations that reduce clarity (`cust_nm`)  
- ❌ Spaces in column names  
- ❌ Storing descriptive attributes in fact tables  

---

## ✅ Summary
These conventions ensure the data model is:
- Consistent  
- Easy to understand  
- Scalable for future development  
