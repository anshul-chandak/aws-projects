# 🏗️ AWS ETL Pipeline Architecture Setup (S3 → Lambda → Redshift → Tableau)

This document outlines the full architecture and step-by-step setup used to build the Walmart BI ETL pipeline using AWS services. The system automates data ingestion from local files to cloud storage, triggers Redshift loading via Lambda, and powers Tableau dashboards.

---

## 🌐 Architecture Overview

### 🔹 Components:
1. **Local Jupyter Notebook**  
   - Cleans raw CSV
   - Generates two files:
     - `walmart_customer_<Month-Year>.csv` (versioned)
     - `walmart_customer_latest.csv` (Tableau snapshot)
   - Uploads both to S3 using `boto3`

2. **Amazon S3**
   - Bucket: `walmart-sales-dashboard`
   - Folders:
     - `monthly_data/` – versioned ETL files (trigger Lambda)
     - `dashboard_data/` – latest file for Tableau
   - Settings:
     - Bucket versioning: OFF
     - Object ownership: Bucket owner preferred
     - Block public access: ON

3. **AWS Lambda**
   - Trigger: S3 PUT (on `monthly_data/`)
   - Runtime: Python 3.12
   - Timeout: 30s | Memory: 128 MB
   - IAM Role: `lambda-redshift-copy-trigger-role`
     - Permissions:
       - `AmazonS3ReadOnlyAccess`
       - `AmazonRedshiftDataFullAccess`
   - Logic:
     - Reads S3 event
     - Executes `COPY` command into Redshift using `redshift-data` API

4. **Amazon Redshift Serverless**
   - Workgroup: `walmart-bie-workgroup`
   - Namespace: `walmart-bie-namespace`
   - Database: `dev` | Admin: `admin`
   - IAM Role: `redshift-serverless-s3-execution-role`
     - Attached to **namespace**
     - Has `AmazonS3ReadOnlyAccess`
   - Security group:
     - Open PostgreSQL port 5439 to personal IP
     - Publicly accessible: ✅ ON
   - Table: `walmart_sales` (matches cleaned CSV)
     - `GRANT INSERT` to IAM role

5. **Tableau Public**
   - Connected via Redshift views (later exported as CSV)
   - Interactive dashboards for:
     - Revenue
     - Customer loyalty
     - Discounts
     - Payment behavior
     - City-level segmentation

---

## 🛠️ Step-by-Step Setup

### ✅ Step 1: Create S3 Bucket
- Name: `walmart-sales-dashboard`
- Object ownership: Bucket owner preferred
- Public access: Blocked (default)
- Folders created:
  - `monthly_data/`
  - `dashboard_data/`

### ✅ Step 2: Prepare Lambda
- Runtime: Python 3.12
- Memory: 128 MB
- Timeout: 30 seconds
- Trigger: S3 PUT for `monthly_data/*.csv`
- IAM Role: `lambda-redshift-copy-trigger-role`
  - Permissions:
    - `AmazonS3ReadOnlyAccess`
    - `AmazonRedshiftDataFullAccess`
- Copy paste the Lambda Function code for the COPY statement

### ✅ Step 3: Setup Redshift Serverless
- Workgroup: `walmart-bie-workgroup`
- Namespace: `walmart-bie-namespace`
- IAM Role: `redshift-serverless-s3-execution-role`
  - Attached to **namespace**
- PostgreSQL access:
  - Public access: ON
  - Port 5439 open to your IP
- Grant permissions to Lambda role:
  ```sql
  GRANT INSERT ON walmart_sales TO "IAMR:lambda-redshift-copy-trigger-role";
