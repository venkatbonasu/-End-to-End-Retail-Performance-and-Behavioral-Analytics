🛒 Retail Sales Analysis Project
🎯 Objective

This project focuses on analyzing a retail dataset to uncover customer behavior, product performance, store profitability, and return patterns.

The insights are aimed at helping stakeholders answer critical business questions such as:

Who are the most valuable customers?

Which products drive the highest profit and which ones have high return rates?

How profitable are stores compared to their operating costs?

What strategies can be implemented to improve customer retention and revenue?

🛠️ Tools & Technologies

📊 Excel → Initial data inspection & validation

🐍 Python (Pandas, Matplotlib, Seaborn) → Data cleaning, feature engineering, EDA

🗄️ MS SQL Server → Data modeling (ER diagram), queries, KPIs

📈 Power BI → Interactive dashboards, RFM segmentation, storytelling visuals

🧹 Data Cleaning & Feature Engineering

Performed in Python using Pandas:

Customers (df1):

Converted signup_date → datetime format

Filled missing age using median imputation

Derived age_group (Teen, Adult, Senior etc.)

Removed duplicate customer_id

Returns (df2):

Converted return_date → datetime

Removed null rows and duplicate return_id

Sales (df3):

Converted order_date → datetime

Filled missing store_id with "0" → represents online sales

Removed duplicate order_id

Stores (df4):

Dropped nulls and duplicate store_id

Products (df5):

Derived new metrics:

sold_units

return_quantity

return_rate (%)

profit = unit_price – cost_price

Filled missing brand with "Unknown"

🗃️ Business Questions Solved with SQL

✔ Top-selling products by revenue & quantity
✔ Return rate by product category
✔ Store-level profitability (revenue vs operating cost)
✔ Customer distribution by region & age group
✔ Top 5 customers by lifetime value (LTV)
✔ Monthly sales & profit trend across 2 years
✔ Channel profitability (Online vs Offline)

💡 10+ SQL queries were implemented to transform raw data into actionable insights.

📊 Power BI Dashboards

Interactive dashboards created in Power BI include:

Sales Overview → Revenue, profit, return trends

Customer Segmentation (RFM) → Loyal, high-value, at-risk, churned customers

Store Performance → Revenue vs Operating Cost by store

Product Analysis → High-margin vs high-return products

Trends → Monthly sales, customer growth, seasonality

📌 Example Dashboard Screenshot:

👉 *<img width="1161" height="656" alt="image" src="https://github.com/user-attachments/assets/8f5b2c12-e8a8-4a91-ac69-ba4767a09f53" />
*  

---

## 🔑 Key Business Insights  
- Customers in the **25–35 age group** generated the highest revenue.  
- **Top 10 customers** contributed disproportionately to overall sales.  
- Certain products had **high return rates (>12%)**, impacting profitability.  
- **Operating costs exceeded profit** in underperforming stores, suggesting cost optimization.  
- **RFM analysis** revealed high-value loyal customers and churn risk groups, enabling targeted marketing.  

---


👨‍💻 Author: *VENKAT BONASU*  
📧 Contact: *venkatbonasu1gmail.com*  
