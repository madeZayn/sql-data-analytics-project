--Data Segmentation - Group the data based on a specific range

with cost_range_cte as(
select
product_key,
product_name,
cost,
case when cost < 100 then 'Below 100'
	 when cost between 101 and 500 then '100 - 500'
	 when cost between 501 and 1000 then '500 - 1000'
	 else 'Above 1000'
	 end as cost_range
from gold.dim_products
)

select cost_range,
count(cost) as total_products
from cost_range_cte
group by cost_range
order by count(cost) desc


/*
Group Customers into three segments based on their spending behaviour:
VIP: Customers with at least 12 mths and Spening more than 5000
Regular: atlease 12 mths and less than 5000
New: customers with lifespan of less than 12 mths
*/
with customer_spending as (
select
c.customer_key,
sum(f.sales_amount) as total_spending,
min(f.order_date) as first_order,
max(f.order_date) as last_order,
datediff(month, min(f.order_date), max(f.order_date)) as life_span
from gold.fact_sales f
left join gold.dim_customers c
on f.customer_key = c.customer_key
group by c.customer_key
)
select customer_segment, count(customer_key) as total_customers from(
select
customer_key,
case when life_span >= 12 and total_spending > 5000 then 'VIP'
	 when life_span >= 12 and total_spending <= 5000 then 'Regular'
	 else 'New'
	 end as customer_segment
from customer_spending
) t
group by customer_segment

