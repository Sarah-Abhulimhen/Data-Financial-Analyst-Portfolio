# Sales Performance & Profitability Analysis | SQL + Power BI

This project simulates a real-world business scenario and demonstrates how data-driven insights can improve profitability and decision-making.

##  Overview

This project analyzes sales performance using SQL and Power BI to uncover key business insights around revenue trends, profitability, customer behavior, and operational efficiency.

The goal is to simulate a real-world data analyst workflow:

- Data cleaning & preparation  
- SQL-based analysis  
- Business insight generation  
- Interactive dashboard creation  

## Business Questions

This analysis answers the following key questions:

1. How do sales trends change over time?  
2. Which product categories are most profitable?  
3. Which products are generating losses?  
4. How do discounts impact profitability?  
5. Who are the top customers by revenue?  
6. How does performance vary across customer segments?  
7. What are the shipping performance patterns?  

## Tools & Technologies

- **SQL (MySQL)** → Data analysis  
- **Power BI** → Dashboard & visualization  
- **Excel** → Initial data cleaning  
- **GitHub** → Project documentation  

## Methodology

### 1. Data Preparation

- Cleaned dataset in Excel  
- Removed formatting issues (currency symbols)  
- Imported dataset into MySQL  
- Ensured correct data types (especially numeric fields)  

### 2. SQL Analysis

Key SQL techniques used:

- Aggregations (`SUM`, `AVG`, `COUNT`)  
- Grouping (`GROUP BY`)  
- Filtering (`HAVING`)  
- Window functions (`LAG`) for year-over-year growth  
- Date functions (`MONTHNAME`, `YEAR`)  

## Key Insights

### Sales Trends
- Sales show strong seasonality with a major spike in Q4  
- November recorded the highest sales, indicating peak demand  
- Early months (especially February) show weaker performance  

Insight: Business is highly seasonal  

### Profitability by Category
- **Technology** is the most profitable category  
- **Furniture** has significantly lower profit margins  

Insight: Not all revenue translates to profit equally  

### Loss-Making Products
- Several products consistently generate losses  
- High-ticket items (e.g., printers, furniture) appear frequently in loss list  

Insight: Pricing or discount strategy may be flawed  

### Discount Impact on Profit
- Clear negative relationship between discount and profit
- Discounts above 30-40% often lead to losses 
- Some categories (e.g., Furniture) are more sensitive to discounts  

Insight: Aggressive discounting is hurting profitability  

### Customer Segmentation
- **Consumer segment** generates the highest revenue  
- Corporate and Home Office segments contribute less  

Insight: Business relies heavily on individual consumers  

### Top Customers
- A small number of customers contribute disproportionately to revenue  

Insight: High-value customers should be prioritized  

### Shipping Performance
- **Same Day & First Class** - fastest delivery  
- **Standard Class** -slowest (over 5 days on average)  

Insight: Trade-off between cost and delivery speed  

## Power BI Dashboard

The dashboard provides a one-page interactive view including:

### KPI Cards
- Total Sales  
- Total Profit  
- Number of Orders 
- Profit Margin

### Visuals
- Sales trend over time  
- Profit by category  
- Sales by segment  
- Discount vs Profit (scatter plot)  
- Shipping performance by mode  

## Business Recommendations

### 1. Optimize Discount Strategy
- Avoid discounts above 30%  
- Implement category-specific discount policies  

### 2. Focus on High-Margin Categories
- Invest more in Technology products  
- Reassess pricing for Furniture  

### 3. Improve Loss-Making Products
- Review pricing and cost structure  
- Consider discontinuing underperforming items  

### 4. Leverage Seasonal Trends
- Increase inventory and marketing in Q4  
- Plan campaigns around peak periods  

### 5. Target High-Value Customers
- Implement loyalty programs  
- Personalize offers for top customers  

### 6. Optimize Shipping Strategy
- Improve Standard Class delivery time  
- Promote faster shipping for premium customers  
