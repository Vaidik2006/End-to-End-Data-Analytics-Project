-- TOTAL SALES, PROFITS AND ORDER
select 
    count(distinct order_id) as total_orders,
    round(sum(sales), 2) as total_sales,
    round(sum(profit), 2) as total_profit
from superstore;
-- What this tells us:
-- How many orders were placed
-- Total revenue generated
-- Overall profit/loss

-- AVG ORDER VALUE
select 
    round(sum(sales) / count(distinct order_id), 2) as avg_order_value
from superstore;

-- DATE RANGE OF BUSINESS DATA
select 
    min(order_date) as first_order_date,
    max(order_date) as last_order_date
from superstore;

-- SALES AND PROFIT BY CATEGORY
select 
    category,
    round(sum(sales), 2) as total_sales,
    round(sum(profit), 2) as total_profit
from superstore
group by category
order by total_sales desc;
-- What this tells
-- Which category sells the most
-- Which category is most profitable
-- Helps management focus on high-performing categories

-- SALES AND PROFIT BY SUB-CATEGORY
select 
    sub_category,
    round(sum(sales), 2) as total_sales,
    round(sum(profit), 2) as total_profit
from superstore
group by sub_category
order by total_sales desc;
-- Why this is important
-- Identifies top-selling products
-- Reveals loss-making sub-categories
-- Very useful for inventory & pricing decisions

-- LOSS MAKING SUB-CATEGORIES
select 
    sub_category,
    round(sum(sales), 2) as total_sales,
    round(sum(profit), 2) as total_profit
from superstore
group by sub_category
having sum(profit) < 0
order by total_profit;

-- SALES AND PROFIT BY REGION
select 
    region,
    round(sum(sales), 2) as total_sales,
    round(sum(profit), 2) as total_profit
from superstore
group by region
order by total_sales desc;

-- TOP 5 STATES BY SALES
select 
    state,
    round(sum(sales), 2) as total_sales
from superstore
group by state
order by total_sales desc
limit 5;

-- BOTTOM 5 STATES BY PROFIT
select 
    state,
    round(sum(profit), 2) as total_profit
from superstore
group by state
order by total_profit
limit 5;

-- STATES WITH HIGH SALES BUT LOW PROFIT MARGINS
select 
    state,
    round(sum(sales), 2) as total_sales,
    round(sum(profit), 2) as total_profit
from superstore
group by state
having sum(sales) > 50000 AND sum(profit) < 0
order by total_sales desc;

-- SALES AND PROFIT BY CUSTOMER SEGMENT
select 
    segment,
    round(sum(sales), 2) as total_sales,
    round(sum(profit), 2) as total_profit
from superstore
group by segment
order by total_sales desc;

-- AVG ORDER VALUE BY SEGMENT
select 
    segment,
    round(sum(sales) / count(DISTINCT order_id), 2) as avg_order_value
from superstore
group by segment;

-- TOP 5 CUSTOMERS BY TOTAL SALES
select 
    customer_name,
    round(sum(sales), 2) as total_sales
from superstore
group by customer_name
order by total_sales desc
limit 5;

-- TOP 5 CUSTOMERS BY TOTAL PROFIT
select 
    customer_name,
    round(sum(profit), 2) as total_profit
from superstore
group by customer_name
order by total_profit desc
limit 5;

-- CUSTOMERS WITH HIGH SALES BUT LOW PROFIT MARGINS
select 
    customer_name,
    count(distinct order_id) as total_orders,
    round(sum(profit), 2) as total_profit
from superstore
group by customer_name
having total_orders > 10 AND total_profit < 0
order by total_orders desc;

-- year WISE SALES TREND
select 
    year(order_date) as year,
    round(sum(sales), 2) as total_sales,
    round(sum(profit), 2) as total_profit
from superstore
group by year(order_date)
order by year;

-- monthWISE SALES TREND
select 
    year(order_date) as year,
    month(order_date) as month,
    round(sum(sales), 2) as total_sales
from superstore
group by year(order_date), month(order_date)
order by year, month;

-- BEST month BY SALES
select 
    year(order_date) as year,
    month(order_date) as month,
    round(sum(sales), 2) as total_sales
from superstore
group by year(order_date), month(order_date)
order by total_sales desc
limit 1;

-- PROFIT TREND OVER TIME
select 
    year(order_date) as year,
    month(order_date) as month,
    round(sum(profit), 2) as total_profit
from superstore
group by year(order_date), month(order_date)
order by year, month;

-- ORDER COUNT OVER TIME
select 
    year(order_date) as year,
    month(order_date) as month,
    coun(distinct order_id) as total_orders
from superstore
group by year(order_date), month(order_date)
order by year, month;

-- DISCOUNT VS PROFIT ANALYSIS
select 
    discount,
    round(sum(sales), 2) as total_sales,
    round(sum(profit), 2) as total_profit
from superstore
group by discount
order by discount;

-- AVG PROFIT BY DISCOUNT LEVEL
select 
    discount,
    round(avg(profit), 2) as avg_profit
from superstore
group by discount
order by discount;

-- HIGH DISCOUNT BUT LOSS MAKING ORDERS
select 
    order_id,
    product_name,
    discount,
    sales,
    profit
from superstore
where discount >= 0.3 and profit < 0
limit 10;

-- CATEGORY WISE DISCOUNT IMPACT ON PROFIT
select 
    category,
    round(avg(discount), 2) as avg_discount,
    round(sum(profit), 2) as total_profit
from superstore
group by category;

-- DISCOUNT BUCKETS
select 
    Case 
        when discount = 0 then 'No Discount'
        when discount <= 0.2 then 'Low Discount'
        when discount <= 0.4 then 'Medium Discount'
        else 'High Discount'
    end as discount_bucket,
    round(sum(sales), 2) as total_sales,
    round(sum(profit), 2) as total_profit
from superstore
group by discount_bucket
order by total_sales desc;
