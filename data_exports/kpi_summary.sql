select 
    count(distinct order_id) as total_orders,
    round(sum(sales), 2) as total_sales,
    round(sum(profit), 2) as total_profit,
    round(sum(sales) / count(distinct order_id), 2) as avg_order_value
from superstore;