show databases;
use superstore;
show tables;
select * from superstore_sales;
desc superstore_sales;
Q1. Shows which region generates the most revenue.
select region,
sum(sales) as Total_sales
from superstore_sales
group by region 
order by Total_sales Desc;

Q2. Helps identify which product category is most profitable.

select category, 
sum(profit)as total_profit
from superstore_sales
group by category
order by total_profit Desc;

Q3. Shows most valuable customers.

select customer_Name, 
sum(sales) AS Total_Sales
FROM superstore_sales
GROUP BY customer_Name
ORDER BY total_Sales DESC
LIMIT 10;

Q6 Shows sales growth over time

month(Order_Date) as Month,
sum(sales) AS Total_Sales
FROM superstore_sales
GROUP BY month
ORDER BY month;

Q7. Find the top 3 products with highest sales in each category.

select category, product_name, total_sales
from(
	 select
      category,
      product_name,
      sum(sales) as total_sales,
      rank() over (partition by category order by sum(sales)DESC) as rnk
      from superstore_sales
      group by category, product_name
) ranked 
where rnk<=3
