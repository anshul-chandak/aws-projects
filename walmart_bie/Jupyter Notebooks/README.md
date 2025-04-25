# 🧠 Walmart ETL Automation Notebook | AWS-Powered BI Pipeline

This notebook is the heart of an automated BI pipeline that integrates Python with AWS to drive retail analytics. It transforms raw Walmart customer data, uploads it to Amazon S3, and triggers an AWS Lambda function to push data into Amazon Redshift — enabling a real-time Tableau dashboard.

Designed to demonstrate end-to-end cloud-based automation, this notebook is a showcase of Python, boto3, and AWS interoperability for business intelligence.

---

## 🛠️ Notebook Capabilities

### 🔹 1. Data Cleaning & Feature Engineering
- Imported a 50,000-row Walmart retail dataset
- Cleaned columns with string normalization, whitespace trimming
- Parsed `Purchase_Date` to extract month and created `Age_Group` bins using `pandas.cut()`

### 🔹 2. File Versioning + Smart Naming
- Automatically generates monthly filename
- Save a file on local machine

### 🔹 3. Upload to Amazon S3 (with boto3)
- Python `boto3.client("s3")` handles the S3 connection
- Uploads both files to separate folders in the bucket:
- `monthly_data/` for versioned pipeline triggers
- `dashboard_data/` for the latest Tableau snapshot
- Also stores run metadata (`last_run_metadata.json`) for auditability

### 🔹 4. Lambda & Redshift Integration (Automated Trigger)
- The `monthly_data/` upload **automatically triggers a Lambda function**
- Lambda executes a `COPY` command that loads the file into an existing Redshift table
- Redshift becomes the data source for a Tableau BI dashboard

### 🔹 5. Export Views from Redshift
- Notebook includes additional logic to connect to Redshift via `psycopg2` and export SQL-based views as `.csv`
- Enables offline analysis or local dashboarding without AWS access

---

## 🔧 AWS Setup Note (Important)

Since this project uses AWS services (S3, Lambda, Redshift), the notebook assumes that:

1. You have AWS CLI configured on your local machine
2. Your IAM user has `AmazonS3FullAccess` and `AmazonRedshiftDataFullAccess` policies
```bash
aws configure
You'll be prompted to enter:

AWS Access Key ID
AWS Secret Access Key
Default region (e.g., us-east-1)
Output format (optional)

⚠️ Important Note
This project was built using a free-tier AWS account, which is no longer active.
As a result, the S3 and Redshift-related commands will raise AccessDenied or EndpointNotFound errors unless run with valid AWS credentials.

The core logic remains fully functional and demonstrates strong familiarity with:

✅ Python scripting
✅ Cloud storage automation
✅ Redshift integration
✅ Scalable ETL workflows

