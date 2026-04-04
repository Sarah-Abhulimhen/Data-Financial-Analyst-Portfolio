### Monthly Sales Trend Analysis
-- Business Question:
-- How do sales vary across months, and is there evidence of seasonality?

SELECT 
    MONTHNAME(order_date) AS month,
    SUM(sales) AS total_sales
FROM sales
GROUP BY MONTH(order_date), MONTHNAME(order_date)
ORDER BY MONTH(order_date);

-- Result:
-- January   | 94,924.87
-- February  | 59,751.26  
-- March     | 205,005.51
-- April     | 137,762.16
-- May       | 155,028.83
-- June      | 152,718.72
-- July      | 147,238.11
-- August    | 159,043.99
-- September | 307,649.96
-- October   | 200,323.03
-- November  | 352,461.09  
-- December  | 325,293.54

-- Insight:
-- - Sales are weakest early in the year, with February as the lowest-performing month
-- - Performance stabilizes mid-year and accelerates from September onwards
-- - A clear spike occurs in Q4 (October–December), indicating strong seasonal demand

-- Key Takeaway:
-- - The business is highly seasonal, with peak revenue concentrated in Q4
-- - November stands out as the top-performing month, likely driven by promotions and holiday demand
-- - Planning for inventory, staffing, and marketing should be aligned with this Q4 surge

### Profit Margin by Category
-- Business Question:
-- Which product category is the most profitable relative to its sales?

SELECT category,
    SUM(profit) / SUM(sales) AS profit_margin
FROM sales
GROUP BY category
ORDER BY profit_margin DESC;

-- Result:
-- Technology      | 0.173958  (17.4%)
-- Office Supplies | 0.170352  (17.0%)
-- Furniture       | 0.024867  (2.5%)

-- Insight:
-- - Technology is the most profitable category (17.4% margin)
-- - Office Supplies follows closely (17.0%)
-- - Furniture has a very low profit margin (2.5%)

-- Key Takeaway:
-- - Furniture generates sales but is significantly less profitable
-- - Business should investigate high costs or heavy discounting in Furniture
-- - Technology and Office Supplies are strong, high-margin categories worth scaling

### Top 10 Loss-Making Products
-- Business Question:
-- Which products are generating the highest losses and negatively impacting profitability?

SELECT 
    product_name,
    SUM(profit) AS total_loss
FROM sales
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_loss ASC
LIMIT 10;

-- Result:
-- Cubify CubeX 3D Printer Double Head Print       | -8,879.97 
-- Lexmark MX611dhe Monochrome Laser Printer       | -4,589.97
-- Cubify CubeX 3D Printer Triple Head Print       | -3,839.99
-- Chromcraft Bull-Nose Wood Oval Conference Table | -2,876.11
-- Bush Advantage Collection Racetrack Table       | -1,934.40
-- GBC DocuBind P400 Electric Binding System       | -1,878.17
-- Cisco TelePresence System EX90                  | -1,811.08
-- Martin Yale Chadless Letter Opener              | -1,299.19
-- Balt Solid Wood Round Tables                    | -1,201.06
-- BoxOffice By Design Conference Table            | -1,148.44

-- Insight:
-- - A small number of products are responsible for significant financial losses
-- - High-value or specialized products (e.g., printers, conference systems) appear frequently among the loss-makers
-- - This may indicate issues such as high costs, heavy discounting, or low sales volume

-- Key Takeaway:
-- - The business should investigate pricing, cost structure, and discount strategies for these products
-- - Consider discontinuing, repricing, or renegotiating supplier costs for consistently unprofitable items
-- - Addressing these losses could significantly improve overall profitability

### Year-over-Year Sales Growth Analysis
-- Business Question:
-- How has total sales changed over time, and what is the year-over-year growth rate?

SELECT 
    year,
    total_sales,
    LAG(total_sales) OVER (ORDER BY year) AS prev_year_sales,
    (total_sales - LAG(total_sales) OVER (ORDER BY year)) 
        / LAG(total_sales) OVER (ORDER BY year) AS growth_rate
FROM (
    SELECT 
        YEAR(order_date) AS year,
        SUM(sales) AS total_sales
    FROM sales
    GROUP BY YEAR(order_date)
) t;

-- Result:
-- 2014 | 484,247.56 | NULL        | NULL
-- 2015 | 470,532.46 | 484,247.56  | -0.0283  
-- 2016 | 609,205.86 | 470,532.46  | 0.2947   
-- 2017 | 733,215.19 | 609,205.86  | 0.2036   

-- Insight:
-- - Sales declined slightly in 2015 compared to 2014
-- - A strong recovery occurred in 2016 with nearly 30% growth
-- - Growth continued in 2017, though at a slower rate (~20%)
-- - Overall trend shows a positive upward trajectory after 2015

-- Key Takeaway:
-- - The business experienced a temporary dip in 2015 but successfully recovered
-- - Sustained growth in 2016–2017 indicates improved performance and scalability
-- - Future strategy should focus on maintaining growth momentum while investigating the cause of the 2015 decline

### Customer Segmentation Analysis
-- Business Question:
-- How do different customer segments contribute to overall sales and customer base?

SELECT 
    segment,
    COUNT(DISTINCT customer_id) AS customers,
    SUM(sales) AS total_sales
FROM sales
GROUP BY segment;

-- Result:
-- Consumer     | 409 customers |  1,161,401.34
-- Corporate    | 236 customers |   706,146.44
-- Home Office  | 148 customers |   429,653.29

-- Insight:
-- - The Consumer segment has the largest customer base and generates the highest total sales
-- - Corporate customers contribute significantly despite having fewer customers than Consumers
-- - Home Office segment has the smallest customer base and lowest sales contribution

-- Key Takeaway:
-- - Consumer segment is the primary revenue driver and should remain a key focus
-- - Corporate segment shows strong value per customer → opportunity for targeted B2B strategies
-- - Home Office segment may require marketing efforts or product adjustments to boost engagement

### Discount Impact on Profitability
-- Business Question:
-- How do different discount levels affect average profit?

SELECT 
    discount,
    AVG(profit) AS avg_profit
FROM sales
GROUP BY discount
ORDER BY discount;

-- Result:
-- 0.00 |  66.90
-- 0.10 |  96.06  
-- 0.15 |  27.29
-- 0.20 |  24.70
-- 0.30 | -45.68  
-- 0.32 | -88.56
-- 0.40 | -111.93
-- 0.45 | -226.65
-- 0.50 | -310.70  
-- 0.60 | -43.08
-- 0.70 | -95.87
-- 0.80 | -101.80

-- Insight:
-- - Low discounts (0–10%) generate the highest profits
-- - Profitability declines sharply as discounts increase beyond 20%
-- - Discounts above 30% consistently result in losses
-- - The most severe losses occur at 50% discount

-- Key Takeaway:
-- - Discounting strategy is critically impacting profitability
-- - Optimal discount range appears to be between 0%–10%
-- - High discounts should be limited or carefully controlled, as they erode margins significantly

### Top 10 Customers by Revenue
-- Business Question:
-- Who are the highest-value customers based on total spending?

SELECT 
    customer_name,
    SUM(sales) AS total_spent
FROM sales
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 10;

-- Result:
-- Sean Miller        | 25,043.07  
-- Tamara Chand       | 19,052.22
-- Raymond Buch       | 15,117.35
-- Tom Ashbrook       | 14,595.62
-- Adrian Barton      | 14,473.57
-- Ken Lonsdale       | 14,175.23
-- Sanjit Chand       | 14,142.34
-- Hunter Lopez       | 12,873.30
-- Sanjit Engle       | 12,209.44
-- Christopher Conant | 12,129.08

-- Insight:
-- - A small group of customers contributes significantly to total revenue
-- - The top customer alone generates over 25,000 in sales
-- - There is a noticeable drop between the top few customers and the rest

-- Key Takeaway:
-- - High-value customers should be prioritised for retention strategies
-- - Opportunities exist for loyalty programs, personalised offers, and upselling
-- - Losing top customers could significantly impact overall revenue

### Shipping Performance Analysis
-- Business Question:
-- How long does shipping take on average for each shipping mode?

SELECT 
    ship_mode,
    AVG(DATEDIFF(ship_date, order_date)) AS avg_shipping_days
FROM sales
GROUP BY ship_mode;

-- Result:
-- Same Day      | 0.04 days  
-- First Class   | 2.18 days
-- Second Class  | 3.24 days
-- Standard Class| 5.01 days  

-- Insight:
-- - Same Day shipping is nearly instantaneous, as expected
-- - First Class and Second Class provide relatively fast delivery within 2–3 days
-- - Standard Class has the longest delivery time, averaging around 5 days