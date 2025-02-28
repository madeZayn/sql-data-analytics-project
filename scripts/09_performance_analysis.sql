/*Performance Analysis - Comparing the current value to a target value

Task - Analyze the yearly performance of products by comparing each
products sales to both its average sales performance and the previous
years sales
*/
with yearly_product_sales as(
select
YEAR(s.order_date) as order_year,
p.product_name product,
SUM(s.sales_amount) AS total_sales
from 
gold.fact_sales s
left join gold.dim_products p
on s.product_key = p.product_key
where order_date is not null
group by YEAR(s.order_date), p.product_name
)

select order_year,
product,
total_sales,
avg(total_sales) over(partition by product) as avg_sales,
total_sales - avg(total_sales) over(partition by product) as diff_in_avg,
case when total_sales - avg(total_sales) over(partition by product) > 0 then 'Above Avg'
	 when total_sales - avg(total_sales) over(partition by product) < 0 then 'Below Avg'
	 ELSE 'Avg'
	 END as sales_performance,
	 lag(total_sales) over(partition by product order by order_year) as previous_year_sales,
	 total_sales - lag(total_sales) over(partition by product order by order_year) as diff_from_prev_year
from
yearly_product_sales
