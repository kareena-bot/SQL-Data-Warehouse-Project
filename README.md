# 🏗️ Data Warehouse Project (Medallion Architecture)

---

## 📌 Project Overview

This project demonstrates the design and implementation of a modern data warehouse using **Medallion Architecture (Bronze, Silver, Gold layers)**.

It consolidates ERP and CRM data into a structured model for analytics and reporting.

Key focus areas:
- Data Engineering
- ETL Pipelines
- Data Modeling
- SQL Analytics

---

## 📊 Analytics & Reporting

SQL-based analytics were developed to generate insights on:

- Customer Behavior
- Product Performance
- Sales Trends

These insights support business decision-making and performance tracking.

---

## 🚀 Project Requirements

### Data Engineering Objective
Build a data warehouse using SQL Server to consolidate sales data for reporting and analysis.

### Specifications:
- Data Sources: ERP & CRM CSV files
- Data Cleaning: Remove inconsistencies and errors
- Integration: Unified analytical data model
- Scope: Latest dataset only (no historization)
- Documentation: Clear data model for stakeholders

## 🏗️ Data Architecture Overview

This project follows a **modern layered data architecture** designed to transform raw data into analytics-ready insights.  
The architecture is structured into three main layers: **Bronze, Silver, and Gold**.

---

### 📊 Architecture Diagram
> The diagram below illustrates the flow of data across layers.

![Data Architecture](diagrams/data_architecture.png)


Data is ingested from source systems into the Bronze layer
Cleaned and standardized in the Silver layer
Modeled into a star schema in the Gold layer
Consumed by BI tools for reporting and analysis
🥉 Bronze Layer (Raw Data)
Purpose:

Stores raw, unprocessed data exactly as received from source systems.

Characteristics:
Minimal or no transformations
Preserves original structure and data types
Acts as a historical record (data lineage)
Example:
CRM customer data
Product source data
Raw sales transactions
🥈 Silver Layer (Cleaned & Transformed)
Purpose:

Cleans, standardizes, and prepares data for modeling.

Transformations:
Data type casting
Handling nulls and duplicates
Standardizing formats (e.g., dates, gender values)
Joining and enriching datasets
Example:
Clean customer table (silver.crm_cust_info)
Clean product table (silver.crm_prd_info)
Refined sales data
🥇 Gold Layer (Business Model)
Purpose:

Provides a business-ready data model optimized for analytics.

Design:
Star schema (Fact + Dimension tables)
Denormalized dimensions for fast querying
Tables:
gold.fact_sales → transactional metrics
gold.dim_customers → customer attributes
gold.dim_products → product attributes
Benefits:
Simplifies complex queries
Improves performance for reporting
Easy for business users to understand
🔗 Data Modeling Approach
Uses a star schema design
Fact table stores:
Foreign keys
Measures (e.g., sales_amount, sales_quantity)
Dimension tables store:
Descriptive attributes (e.g., gender, country, category)
⚙️ Key Design Principles
Separation of concerns across layers
Use of surrogate keys for consistency
Consistent naming conventions (snake_case)
Optimized for read-heavy analytical workloads
📈 Data Consumption

The Gold layer is designed to be consumed by:

📊 BI tools (Power BI, Tableau)
📉 Dashboards and reports
📌 Ad-hoc SQL analysis

---

## 🔄 Data Flow

```text
Source Systems → Bronze → Silver → Gold → BI / Analytics

```text
Source Systems → Bronze → Silver → Gold → BI / Analytics

---

## 📁 Repository Structure

```text
data-warehouse-project/
│
├── datasets/              # Raw ERP & CRM data
├── docs/                  # Architecture & documentation
│   ├── etl.drawio
│   ├── data_architecture.drawio
│   ├── data_flow.drawio
│   ├── data_models.drawio
│   ├── data_catalog.md
│   └── naming-conventions.md
│
├── scripts/              # SQL scripts
│   ├── bronze/
│   ├── silver/
│   └── gold/
│
├── tests/                # Data validation scripts
├── README.md
├── LICENSE
├── .gitignore
└── requirements.txt


```
## 
🛡️ License

This project is licensed under the MIT License.

You are free to use, modify, and share this project with proper attribution.

🌟 About Me

Hi there! I'm Caren Chepng'eno Rutto (Kareena) 👋

I am an aspiring Data Analyst / Data Engineer passionate about building real-world data projects that turn raw data into meaningful insights.

I enjoy:

SQL & data analysis
Data engineering & pipelines
Building portfolio projects
Learning analytics tools and technologies

This project represents my journey into modern data engineering and analytics.
Social Media 
www.linkedin.com/in/caren-rutto-21899751

