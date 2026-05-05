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

###
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

## 🏗️ Data Architecture Overview

This project follows a **modern layered data architecture** designed to transform raw data into analytics-ready insights.  
The architecture is structured into three main layers: **Bronze, Silver, and Gold**.

---

## 📊 Architecture Diagram
> The diagram below illustrates the flow of data across layers.

![Data Architecture](diagrams/data_architecture.png)

---

## 🔄 Data Flow

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


