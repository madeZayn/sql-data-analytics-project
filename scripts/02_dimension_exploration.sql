--Explore all countries our customers come from.
select distinct country
from gold.dim_customers
order by 1

--Explore all the categories
select distinct category, 
subcategory, product_name 
from gold.dim_products
