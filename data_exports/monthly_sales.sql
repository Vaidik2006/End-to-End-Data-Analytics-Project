select 
    year(order_date) as year,
    month(order_date) as month,
    round(sum(sales), 2) as total_sales
from superstore
group by year(order_date), month(order_date)
order by year, month;