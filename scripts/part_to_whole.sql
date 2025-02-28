/* Part to Whole / Propertional Analysis: */

--Which product contribute most to the overall sales
with total_sales as(
select
category,
sum(sales_amount) as total_sales
from gold.fact_sales f
left join gold.dim_products p
on p.product_key = f.product_key
group by category
)

select
category,
total_sales,
sum(total_sales) over() as overall_sales,
CONCAT(ROUND((cast(total_sales as float)/ sum(total_sales) over()) * 100, 2), '%') as contribution_percentage
from
total_sales
group by category, total_sales
order by total_sales desc
