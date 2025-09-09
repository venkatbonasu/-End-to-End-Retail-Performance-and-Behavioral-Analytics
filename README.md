# 🛒 Retail Sales Analysis Project  

## 📖 Objective  
The objective of this project is to analyze a retail sales dataset to gain insights into customer behavior, product performance, store profitability, and return trends.  
The analysis helps answer key business questions such as:  
- Who are the most valuable customers?  
- Which products are most profitable and which have high return rates?  
- How do stores perform in terms of revenue vs. cost?  
- What strategies can improve customer retention and sales?  

---

## 🛠️ Tools & Technologies  
- **Excel** → Initial data inspection & error checking  
- **Python (Pandas, Matplotlib, Seaborn)** → Data cleaning, feature engineering & EDA  
- **MS SQL Server** → Data modeling (ER diagram), SQL queries, KPIs  
- **Power BI** → Dashboard creation, RFM segmentation, interactive visuals  

---

## 🧹 Data Cleaning Steps (Python)  
1. **Customers (df1):**  
   - Converted `signup_date` to datetime  
   - Filled missing `age` with median, derived `age_group`  
   - Removed duplicate `customer_id`  

2. **Returns (df2):**  
   - Converted `return_date` to datetime  
   - Dropped missing values, removed duplicate `return_id`  

3. **Sales (df3):**  
   - Converted `order_date` to datetime  
   - Filled missing `store_id` with “0” (online sales)  
   - Removed duplicate `order_id`    

4. **Stores (df4):**  
   - Dropped nulls and duplicate `store_id`  

5. **Products (df5):**  
   - Derived `sold_units`, `return_quantity`, `return_rate`, and `profit`  
   - Filled missing `brand` with “Unknown”   

---

## 🗃️ SQL Queries Solved  
1. What is the total revenue generated in the last 12 months? 
2. Which are the top 5 best-selling products by quantity? 
3. How many customers are from each region? 
4. Which store has the highest profit in the past year? 
5. What is the return rate by product category? 
6. What is the average revenue per customer by age group? 
7. Which sales channel (Online vs In-Store) is more profitable on average? 
8. How has monthly profit changed over the last 2 years by region? 
9. Identify the top 3 products with the highest return rate in each category. 
10. Which 5 customers have contributed the most to total profit, and what is their 
tenure with the company? 

---

## 📊 Power BI Dashboards  
- **Sales Overview:** Revenue, profit, return trends  
- **Customer Segmentation (RFM):** High-value, loyal, at-risk, churned customers  
- **Store Profitability:** Revenue vs. operating cost across stores  
- **Product Performance:** Bestsellers vs. high-return items  
- **Trends:** Monthly sales & customer growth 

👉 *<img width="1161" height="656" alt="image" src="https://github.com/user-attachments/assets/8f5b2c12-e8a8-4a91-ac69-ba4767a09f53" />
* 

•	Demonstrated an end-to-end data analytics pipeline: raw data → cleaning → database modeling → SQL queries → visualization → insights.

---


👨‍💻 Author: *VENKAT BONASU*  
📧 Contact: *venkatbonasu1gmail.com*  
