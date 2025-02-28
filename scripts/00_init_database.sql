USE master;

CREATE DATABASE DataWarehouseAnalytics;
GO

USE DataWarehouseAnalytics;
GO

CREATE SCHEMA gold;
GO

CREATE TABLE gold.dim_customers(
	customer_key int,
	customer_id int,
	customer_number nvarchar(50),
	first_name nvarchar(50),
	last_name nvarchar(50),
	country nvarchar(50),
	marital_status nvarchar(50),
	gender nvarchar(50),
	birthdate date,
	created_date date
);

CREATE TABLE gold.dim_products(
	product_key int,
	product_id int,
	product_number nvarchar(50),
	product_name nvarchar(50),
	category_id nvarchar(50),
	category nvarchar(50),
	subcategory nvarchar(50),
	maintenance nvarchar(50),
	cost int,
	product_line nvarchar(50),
	start_date date
);

create table gold.fact_sales(
order_number nvarchar(50),
product_key int,
customer_key int,
order_date date,
shipping_date date,
due_date date,
sales_amount int,
quantity tinyint,
price int
);

TRUNCATE TABLE gold.dim_customers;

BULK INSERT gold.dim_customers
FROM 'C:\Users\sivasu\OneDrive - Korcomptenz Inc\Documents\SQL_Analytics_Project\datasets\gold.dim_customers.csv'
WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK);

TRUNCATE TABLE gold.dim_products;

BULK INSERT gold.dim_products
FROM 'C:\Users\sivasu\OneDrive - Korcomptenz Inc\Documents\SQL_Analytics_Project\datasets\gold.dim_products.csv'
WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK);

TRUNCATE TABLE gold.fact_sales;

BULK INSERT gold.fact_sales
FROM 'C:\Users\sivasu\OneDrive - Korcomptenz Inc\Documents\SQL_Analytics_Project\datasets\gold.fact_sales.csv'
WITH(
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK);
