-- DATABASE CREATION
create database retail_analysis;
use retail_analysis;

-- TABLE CREATION
create table superstore (
    row_id int,
    order_id varchar(20),
    order_date varchar(15),
    ship_date varchar(15),
    ship_mode varchar(20),
    customer_id varchar(20),
    customer_name varchar(100),
    segment varchar(20),
    country varchar(30),
    city varchar(50),
    state varchar(50),
    postal_code varchar(10),
    region varchar(20),
    product_id varchar(20),
    category varchar(30),
    sub_category varchar(30),
    product_name varchar(150),
    sales decimal(10,2),
    quantity int,
    discount decimal(4,2),
    profit decimal(10,2)
);

-- CSV DATA IMPORT
SHOW VARIABLES like 'local_infile';
set global local_infile = 1;
set NAMES latin1;
set character_set_database = latin1;

-- load DATA INTO table
load data INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Sample - Superstore.csv'
into table superstore
FIELDS TERMINATED by ','
ENCLOSED by '"'
LINES TERMINATED by '\n'
ignore 1 rows;

-- VERIFY DATA IMPORT
select COUNT(*) from superstore;
select * from superstore LIMIT 5;

-- DATA CONVERSION
alter table superstore
ADD order_date_new date,
ADD ship_date_new date;

UPdate superstore
set
order_date_new = STR_TO_date(order_date, '%m/%d/%Y'),
ship_date_new  = STR_TO_date(ship_date, '%m/%d/%Y');

set SQL_SAFE_UPdateS = 0;

select order_date, order_date_new
from superstore
limit 5;

-- DATA VALIDATION
select 
    COUNT(*) AS total_rows,
    SUM(order_date_new IS NULL) AS null_order_dates,
    SUM(ship_date_new IS NULL) AS null_ship_dates,
    SUM(sales IS NULL) AS null_sales,
    SUM(profit IS NULL) AS null_profit
from superstore;

select 
    min(sales) AS min_sales,
    max(sales) AS max_sales,
    min(profit) AS min_profit,
    max(profit) AS max_profit
from superstore;

-- FINAL CLEANUP
alter table superstore
add primary key (row_id);

alter table superstore
drop COLUMN order_date,
drop COLUMN ship_date;

alter table superstore
CHANGE order_date_new order_date date,
CHANGE ship_date_new ship_date date;

-- FINAL TABLE STRUCTURE
desc superstore;