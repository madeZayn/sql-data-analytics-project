USE DataWarehouseAnalytics;

--Changes over Month
select 
MONTH(order_date) as order_month,
SUM(sales_amount) sales_amount,
COUNT(DISTINCT customer_key) as total_customers,
SUM(quantity) as total_quantity
from gold.fact_sales
where order_date is not null
group by month(order_date)
order by month(order_date) 

--Changes over Year
select 
YEAR(order_date) as order_month,
SUM(sales_amount) sales_amount,
COUNT(DISTINCT customer_key) as total_customers,
SUM(quantity) as total_quantity
from gold.fact_sales
where order_date is not null
group by year(order_date)
order by year(order_date)

--Formatting the date
select 
FORMAT(order_date, 'yyyy-MMM') as order_month,
SUM(sales_amount) sales_amount,
COUNT(DISTINCT customer_key) as total_customers,
SUM(quantity) as total_quantity
from gold.fact_sales
where order_date is not null
group by FORMAT(order_date, 'yyyy-MMM')
order by FORMAT(order_date, 'yyyy-MMM')
