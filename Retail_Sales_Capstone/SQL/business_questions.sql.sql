create database retails_sales_project
use retails_sales_project;

SELECT * FROM customers_cleaned1
select * from products_cleaned1
select * from returns_cleaned1
select * from sales_data_cleaned1
select * from stores_cleaned1



--deriving customer value metrics 
SELECT 
    customer_id,
    ROUND(SUM(quantity * unit_price),2) AS customer_value
FROM sales_data_cleaned1 
GROUP BY customer_id
ORDER BY customer_value DESC;

--Q1
SELECT 
    SUM(total_amount) AS total_revenue_last_12_months
FROM sales_data_cleaned1
WHERE order_date >= DATEADD(YEAR, -1, CAST(GETDATE() AS DATE));

--Q2
SELECT TOP 5
   P.PRODUCT_ID,
   PR.PRODUCT_NAME,
   SUM(P.QUANTITY) AS TOTAL_QUANTITY_SOLD
FROM sales_data_cleaned1  AS P
JOIN PRODUCTS_CLEANED1 AS PR
ON P.PRODUCT_ID = PR.PRODUCT_ID
GROUP BY P.PRODUCT_ID,PR.PRODUCT_NAME
ORDER BY TOTAL_QUANTITY_SOLD DESC

--Q3
SELECT REGION AS CUSTOMER_REGION,
COUNT(CUSTOMER_ID) as No_of_customers_from_each_region
FROM CUSTOMERS_CLEANED1
GROUP BY REGION 
ORDER BY No_of_customers_from_each_region DESC

--Q4
SELECT TOP 1
    s.store_id,
    SUM(s.quantity * p.profit) AS total_profit
FROM sales_data_cleaned1 s
JOIN products_cleaned1 p
    ON s.product_id = p.product_id
WHERE s.order_date >= DATEADD(YEAR, -1, GETDATE())  
GROUP BY s.store_id
ORDER BY total_profit DESC;

--Q5
SELECT 
    p.category,
    COUNT(DISTINCT s.order_id) AS total_orders,
    COUNT(DISTINCT r.return_id) AS total_returns,
    ROUND(
        (CAST(COUNT(DISTINCT r.return_id) AS FLOAT) / COUNT(DISTINCT s.order_id)) * 100, 
        2
    ) AS return_rate_percent
FROM sales_data_cleaned1 s
JOIN products_cleaned1 p 
    ON s.product_id = p.product_id
LEFT JOIN returns_cleaned1 r 
    ON s.order_id = r.order_id
GROUP BY p.category
ORDER BY return_rate_percent DESC;

--Q6
SELECT 
    c.Age_Group,
    AVG(s.Total_Amount) AS Avg_Revenue_Per_Customer
FROM Customers_Cleaned1 AS c
JOIN Sales_Data_Cleaned1 AS s
    ON c.Customer_ID = s.Customer_ID
GROUP BY c.Age_Group
ORDER BY Avg_Revenue_Per_Customer DESC;

--Q7
SELECT 
    sales_channel,
    AVG(total_amount) AS avg_revenue_per_order
FROM sales_data_cleaned1
GROUP BY sales_channel
ORDER BY avg_revenue_per_order DESC;

--Q8
SELECT  
    FORMAT(s.order_date, 'yyyy-MM') AS Month,   -- extract year and month
    c.region,                                  -- region column from customers table
    SUM(p.profit) AS Total_Profit              -- total profit in that month, region
FROM sales_data_cleaned1 s
JOIN customers_cleaned1 c 
    ON s.customer_id = c.customer_id
JOIN products_cleaned1 p
    ON s.product_id = p.product_id
WHERE s.order_date >= DATEADD(YEAR, -2, GETDATE())  -- last 2 years
GROUP BY FORMAT(s.order_date, 'yyyy-MM'), c.region
ORDER BY Month, c.region;


--Q9
SELECT 
    category, 
    product_id, 
    product_name,
    return_rate
FROM (
    SELECT 
        p.category,
        p.product_id,
        p.product_name,
        (SUM(p.return_quantity) * 100.0 / SUM(s.quantity)) AS return_rate,
        ROW_NUMBER() OVER (
            PARTITION BY p.category 
            ORDER BY (SUM(p.return_quantity) * 100.0 / SUM(s.quantity)) DESC
        ) AS rn
    FROM sales_data_cleaned1 s
    JOIN products_cleaned1 p 
        ON s.product_id = p.product_id
    GROUP BY p.category, p.product_id, p.product_name
) t
WHERE rn <= 3
ORDER BY category, return_rate DESC;


--Q10
SELECT TOP 5
    c.customer_id,
    (c.first_name + ' ' + c.last_name) AS customer_name,
    SUM(s.quantity * p.profit) AS total_profit,
    DATEDIFF(MONTH, c.signup_date, GETDATE()) AS tenure_months
FROM sales_data_cleaned1 s
JOIN products_cleaned1 p 
    ON s.product_id = p.product_id
JOIN customers_cleaned1 c 
    ON s.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.signup_date
ORDER BY total_profit DESC;





--

SELECT DISTINCT customer_id
FROM sales_data_cleaned1
WHERE customer_id NOT IN (SELECT customer_id FROM customers_cleaned1);

select count(*) from stores_cleaned1

select count(customer_id) from sales_data_cleaned1

SELECT DISTINCT s.store_id
FROM sales_data_cleaned1 s
LEFT JOIN stores_cleaned1 st ON s.store_id = st.store_id
WHERE st.store_id IS NULL;

INSERT INTO stores_cleaned1 (store_id, store_name, store_type, region, city, operating_cost)
VALUES (0, 'Online', 'Online', 'N/A', 'N/A', 0);
