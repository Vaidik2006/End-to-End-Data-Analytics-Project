# End-to-End Retail Data Analytics Project
This project demonstrates a complete end-to-end data analytics workflow for retail sales data, covering data ingestion, SQL-based analysis, and business insight visualization using Power BI.

## Problem Statement
Retail businesses often struggle to understand which products, regions, and customer segments drive profitability. This project aims to analyze retail sales data to identify performance trends, loss-making areas, and factors affecting profit, enabling better data-driven business decisions.

## Dataset Definition
- **Dataset Name:** Sample Superstore Dataset  
- **Domain:** Retail Sales Analytics  
- **Format:** CSV  
- **Encoding Type:** Latin1  
- **Total Records:** ~9,994  
- **Total Columns:** 21  
- **Data Type:** Structured transactional data  

## Tech Stack
- **Database:** MySQL  
- **Query Language:** SQL  
- **Visualization:** Power BI  
- **Data Format:** CSV  

## Phase 1: SQL Data Setup and Preparation

### Objective
Prepare the retail dataset for analysis by creating a structured database, handling encoding issues, and converting fields to appropriate data types.

### Tasks Performed
- Created MySQL database and defined table schema  
- Imported CSV data while handling Latin1 encoding issues  
- Converted date columns to SQL `DATE` format  
- Validated data integrity and defined a primary key  

### Outcome
- Clean and structured dataset ready for analytical queries  
- No data loss or encoding errors  
- Enabled reliable time-based analysis  

## Phase 2: Business Analysis and Insights

### Objective
Analyze retail sales data using SQL to identify performance trends and generate actionable business insights.

### Tasks Performed
- Performed category and sub-category level sales and profit analysis  
- Analyzed region-wise and state-wise performance  
- Studied customer segment behavior  
- Conducted time-based trend analysis  
- Analyzed the impact of discounts on profitability  

### Outcome
- Identified high-performing and loss-making categories  
- Revealed negative impact of excessive discounts on profit  
- Generated insights useful for pricing and sales strategy decisions  

## Phase 3: Power BI Dashboard

### Objective
Visualize SQL-based retail analysis using Power BI to clearly present key business insights.

### Tasks Performed
- Exported aggregated SQL query results for visualization  
- Built KPI cards for total sales, profit, order count, and average order value  
- Created category-wise, region-wise, and time-based visualizations  
- Analyzed discount impact through interactive visuals  

### Outcome
- Delivered a clean, business-ready Power BI dashboard  
- Enabled quick understanding of overall sales performance  
- Completed an end-to-end analytics workflow  

## Key Insights
- High discounts increased sales volume but negatively affected profitability  
- Certain product categories generated high revenue but low profit  
- Specific regions consistently outperformed others in terms of profit  
- Corporate customer segment showed higher average order value  

## Future Improvements
- Automate data ingestion pipeline  
- Integrate Python-based advanced analytics and forecasting  
- Enhance dashboard with real-time data updates  
- Expand analysis to customer lifetime value and demand prediction  

