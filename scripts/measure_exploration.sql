--Find the Total Sales
select SUM(sales_amount) as total_sales
from gold.fact_sales

--Find how many items are sold
select SUM(quantity) as total_quantity
from gold.fact_sales

--find the avg selling price
select AVG(price) as avg_selling_price
from gold.fact_sales

--find the total number of orders
select COUNT(DISTINCT order_number) As
total_number_of_orders
from gold.fact_sales

--find the total number of products
select count(distinct product_name) as total_products
from gold.dim_products

--find the total number of customers
select count(customer_key) as total_customers
from gold.dim_customers

--find the total number of customers that has placed an order
select customer_key customer, 
count(order_number) total_orders
from gold.fact_sales
group by customer_key
HAVING count(order_number) >= 1
order by count(order_number) DESC

--Generate a report that shows all the key metrics of the business
select 'Total Sales' as measure_name,
SUM(sales_amount) as measure_value
from gold.fact_sales
union all
select 'Total Quantity' as measure_name,
SUM(quantity) as measure_value
from gold.fact_sales
union all
select 'Average Price' as measure_name,
AVG(price) as measure_value
from gold.fact_sales
union all
select 'Total Products' as measure_name,
COUNT(product_name) as measure_value
from gold.dim_products
union all
select 'Total Customers' as measure_name,
COUNT(customer_key) as measure_value
from gold.dim_customers
