-- Cumulative Analysis - Aggregating data progressively over time - Helps to understand whether the business grows or declines

--Total sales per month & running total of sales over time

WITH totalsalescte 
as(
select
MONTH(order_date) as order_month,
sum(sales_amount) as total_sales
from 
gold.fact_sales
where MONTH(order_date) is not null
group by MONTH(order_date))

select *, SUM(total_sales) over(order by order_month) As running_total
from totalsalescte
