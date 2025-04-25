# Walmart BI Project – AWS-Powered Retail Analytics Pipeline

This project simulates a real-world Business Intelligence Engineer workflow – from raw data to executive dashboards. It demonstrates not just technical proficiency in AWS, Python, and SQL, but also business acumen through persona-driven KPIs, stakeholder-focused insights, and automation-ready architecture.

---

## 🎯 Project Scope & Business Objective

The objective was to build an automated, scalable BI solution that:
- Transforms raw transactional data into analytics-ready form
- Automates data ingestion and pipeline execution using AWS
- Surfaces insights for different business roles through a story-driven Tableau dashboard

The dataset: 50,000+ Walmart-like retail transactions including customer demographics, product categories, discounts, payment methods, and timestamps.

---

## 👥 Personas & Business KPIs

We structured the analysis around **six personas**, each representing a department with unique KPIs:

| Persona               | KPI(s) Tracked                                              | Business Goal                                |
|-----------------------|-------------------------------------------------------------|-----------------------------------------------|
| Sales Manager         | Total Revenue, Revenue by Category & Month                 | Identify sales growth patterns & product focus |
| Regional Director     | Revenue by City, AOV vs Orders                             | Optimize local inventory & campaign focus     |
| Customer Experience   | Revenue from Repeat vs New Users, Average Order Value      | Retention insights & loyalty performance      |
| Marketing             | Revenue & AOV by Discount Applied                          | Measure campaign ROI & pricing strategy       |
| Finance               | Revenue & AOV by Payment Method                            | Payment preference & checkout optimization    |

Each persona’s dashboard is built to answer both **what is happening** and **why**, with clear visual cues and embedded insight boxes.

---

## 📊 KPIs & How They’re Calculated

- **Total Revenue**: `SUM(purchase_amount)`
- **AOV (Average Order Value)**: `AVG(purchase_amount)`
- **# of Orders**: `COUNT(customer_id)`
- **Segmented Revenue**: By `category`, `month`, `city`, `payment_method`, `discount_applied`, and `repeat_customer`
- All KPIs are calculated via **SQL Redshift views**, documented in [`architecture/redshift_queries.sql`](./architecture/redshift_queries.sql)

---

## ⚙️ AWS Architecture

This pipeline is fully cloud-native and serverless:

**1. Python Notebook (Local)**
- Cleans the dataset with `pandas`
- Generates versioned and latest files
- Uploads files to **Amazon S3** via `boto3`

**2. Amazon S3**
- `monthly_data/` folder triggers Lambda
- `dashboard_data/` stores Tableau snapshot

**3. AWS Lambda**
- Triggered by S3 PUT event
- Runs Redshift `COPY` command via `redshift-data` API

**4. Amazon Redshift Serverless**
- Hosts `walmart_sales` table
- Materialized KPIs using views

**5. Tableau (Public)**
- Connected to exported Redshift views
- Story points visualize each persona’s KPIs + insights

📁 Architecture & setup details are in [`architecture/README.md`](./architecture/README.md)

---

## 🐍 Python’s Role in the Pipeline

- Data Cleaning
- Feature Engineering: Extracting `month`, binning `age_group`
- S3 Integration via `boto3`
- Local file management + naming
- Exporting Redshift views using `psycopg2`

Notebook code is located at [`Jupyter Notebooks/Walmart Data Cleaning.ipynb`](./Jupyter Notebooks/Walmart%20Data%20Cleaning.ipynb)

---

## 💼 BI Engineer Mindset

This project was intentionally framed like a **BI engineer solving a stakeholder problem**:
- Started from the business question: “What does each team need to know?”
- Designed **KPIs that translate directly into business action**
- Built automation to simulate a production data flow
- Presented insights in **storytelling format** that non-technical users can understand

---

## 🔗 View the Published Dashboard

👉 [Walmart BI Dashboard on Tableau Public](https://public.tableau.com/app/profile/anshul.chandak/viz/WalmartBIDashboardAnshulChandak/Story1?publish=yes)

---


