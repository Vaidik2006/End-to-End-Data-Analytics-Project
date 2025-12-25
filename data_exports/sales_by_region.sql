select 
    region,
    round(sum(sales), 2) as total_sales,
    round(sum(profit), 2) as total_profit
from superstore
group by region