--Find the date of the first & last order
select 
MIN(order_date), MAX(order_date)
from gold.fact_sales

--Finding the youngest and oldest customer
select min(birthdate) oldest_customer,
DATEDIFF(YEAR, min(birthdate), GETDATE()) As oldest_age,
max(birthdate) youngest_customer,
DATEDIFF(YEAR, max(birthdate), GETDATE()) As youngest_age
from 
gold.dim_customers
