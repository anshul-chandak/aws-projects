-- Redshift SQL Queries: Table + Views for Walmart BI Project

-- Create Table: walmart_sales
CREATE TABLE walmart_sales (
    Customer_ID VARCHAR(50),
    Age INT,
    Gender VARCHAR(20),
    City VARCHAR(100),
    Category VARCHAR(50),
    Product_Name VARCHAR(100),
    Purchase_Date DATE,
    Month VARCHAR(7),
    Purchase_Amount FLOAT,
    Payment_Method VARCHAR(50),
    Discount_Applied VARCHAR(10),
    Rating INT,
    Repeat_Customer VARCHAR(10),
    Age_Group VARCHAR(10)
);

-- View 1: Category Revenue
CREATE VIEW vw_category_revenue AS
SELECT category, SUM(purchase_amount) AS total_revenue
FROM walmart_sales
GROUP BY category;

-- View 2: Monthly Revenue by Category
CREATE VIEW vw_monthly_revenue_by_category AS
SELECT category, month, SUM(purchase_amount) AS monthly_revenue
FROM walmart_sales
GROUP BY category, month;

-- View 3: Repeat Customer Comparison
CREATE VIEW vw_repeat_customer_comparison AS
SELECT repeat_customer, 
       SUM(purchase_amount) AS total_revenue,
       COUNT(customer_id) AS number_of_purchases,
       AVG(purchase_amount) AS average_order_value
FROM walmart_sales
GROUP BY repeat_customer;

-- View 4: Discount Behavior
CREATE VIEW vw_discount_behavior AS
SELECT discount_applied, 
       COUNT(customer_id) AS number_of_orders,
       SUM(purchase_amount) AS total_revenue,
       AVG(purchase_amount) AS average_order_value
FROM walmart_sales
GROUP BY discount_applied;

-- View 5: Payment Method Summary
CREATE VIEW vw_payment_method_summary AS
SELECT payment_method,
       COUNT(customer_id) AS num_orders,
       SUM(purchase_amount) AS total_revenue,
       AVG(purchase_amount) AS average_order_value
FROM walmart_sales
GROUP BY payment_method;

-- View 6: City Revenue
CREATE VIEW vw_city_revenue AS
SELECT city, 
       COUNT(customer_id) AS total_orders,
       SUM(purchase_amount) AS total_revenue,
       AVG(purchase_amount) AS average_order_value
FROM walmart_sales
GROUP BY city;
