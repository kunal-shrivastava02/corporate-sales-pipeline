# corporate-sales-pipeline
An end-to-end data analytics project using PostgreSQL and Power BI to analyze B2B electronics sales (2023-2026).
# Automated B2B Sales Intelligence Pipeline (2023 - 2026)

## 📌 Project Overview
An end-to-end data pipeline processing transactional records across multiple operational years. Designed a structural staging-to-production database architecture using PostgreSQL and deployed a dynamic multi-file folder ingestion pipeline in Power BI to completely automate annual corporate performance updates.

## 🛠️ Technology Stack
- **Database Engine:** PostgreSQL (Data Extraction, Cleaning, and Table Mutation)
- **ETL Architecture:** Power Query (Multi-source folder consolidation pipeline)
- **Data Modeling:** Star Schema Optimization ($1:\infty$ relationships with a dedicated DAX Dim_Calendar)
- **Business Intelligence:** Power BI Desktop (Advanced DAX row-iterators like `SUMX` and Time-Intelligence `TOTALYTD`)

## ⚙️ Core Deliverables & Architecture
1. **SQL Scripts:** Built relational staging tables, standardized mixed-case user records using text functions (`TRIM`, `INITCAP`), and maintained strict margin integrity by isolating canceled operations.
2. **Data Pipeline Optimization:** Configured a seamless architecture where dropping the latest `current_sales_2026.csv` into the local data directory automatically updates all executive metrics across the reporting landscape via a single refresh trigger.

## 👔 Interview Discussion Points
- **Row-Level Iteration vs Column Aggregation:** Ready to explain the performance advantages of utilizing contextual iterators like `SUMX` over basic columnar calculations in large relational arrays.
- **Star Schema Design:** Deployed standard dimension-to-fact data models to optimize operational processing speed and preserve reporting filtering bandwidth.
