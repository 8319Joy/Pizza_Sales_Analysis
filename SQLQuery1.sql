
select*from pizza_sales;
SELECT SUM(total_price) As Total_Revenue from pizza_sales;
SELECT SUM(total_price)/COUNT(DISTINCT order_id) as Avg_Order_Value from pizza_sales;
SELECT SUM(quantity)as Total_Pizza_Sold from pizza_sales;
SELECT COUNT(DISTINCT order_id) AS Total_orders from pizza_sales;
SELECT SUM (quantity)/COUNT(DISTINCT order_id) from pizza_sales;
SELECT CAST(SUM(quantity)As decimal(10,2))/
CAST(COUNT(Distinct order_id) As decimal(10,2))from pizza_sales;
SELECT CAST(CAST(SUM(quantity)As decimal(10,2))/
CAST(COUNT(Distinct order_id) As decimal(10,2))As decimal(10,2))AS Avg_Pizzas_Per_Order from pizza_sales;
--DAILY TREND
SELECT DATENAME(DW, order_date)as order_day, COUNT(DISTINCT order_id)AS Total_orders from pizza_sales
GROUP BY DATENAME(DW,order_date);
--HOURLY TREND
SELECT DATEPART(HOUR,order_time)AS order_hours, COUNT(DISTINCT order_id)AS Total_orders from pizza_sales
GROUP BY DATEPART (HOUR, order_time)
ORDER BY DATEPART (HOUR, order_time);
SELECT pizza_category , sum(total_price)*100/(SELECT sum(total_price)from pizza_sales)AS PCT from pizza_sales
GROUP BY pizza_category;
SELECT pizza_category,sum(total_price)as Total_Sales, sum(total_price)*100/(SELECT sum(total_price)from pizza_sales) As PCT from pizza_sales
GROUP BY pizza_category;
--In Case of January Month
SELECT pizza_category,sum(total_price)as Total_Sales, sum(total_price)*100/(SELECT sum(total_price)from pizza_sales WHERE month(order_date)=1) As PCT from pizza_sales
WHERE month(order_date)=1
GROUP BY pizza_category;
SELECT pizza_size,sum(total_price)as Total_Sales, sum(total_price)*100/(SELECT sum(total_price)from pizza_sales) As PCT from pizza_sales
GROUP BY pizza_size
ORDER BY PCT DESC;
SELECT pizza_size,CAST(sum(total_price) AS DECIMAL(10,2)) as Total_Sales, CAST(sum(total_price)*100/(SELECT sum(total_price)from pizza_sales)AS decimal(10,2)) As PCT from pizza_sales
GROUP BY pizza_size
ORDER BY PCT DESC;
SELECT pizza_size,CAST(sum(total_price) AS DECIMAL(10,2)) as Total_Sales, CAST(sum(total_price)*100/(SELECT sum(total_price)from pizza_sales WHERE DATEPART(quarter,order_date)=1)AS decimal(10,2)) As PCT from pizza_sales
WHERE DATEPART(quarter,order_date)=1
GROUP BY pizza_size
SELECT pizza_category, sum(quantity) as Total_Pizzas_Sold
from pizza_sales
GROUP by pizza_category;
SELECT pizza_name,sum(quantity) as Total_pizzas_Sold
from pizza_sales
GROUP BY pizza_name
ORDER BY sum(quantity)DESC;
SELECT TOP 5 pizza_name,sum(quantity) as Total_pizzas_Sold
from pizza_sales
GROUP BY pizza_name
ORDER BY sum(quantity)DESC;
SELECT pizza_name,sum(quantity) as Total_pizzas_Sold
from pizza_sales
GROUP BY pizza_name
ORDER BY sum(quantity)ASC;
SELECT TOP 5 pizza_name,sum(quantity) as Total_pizzas_Sold
from pizza_sales
GROUP BY pizza_name
ORDER BY sum(quantity)ASC;
SELECT TOP 5 pizza_name,sum(quantity) as Total_pizzas_Sold
from pizza_sales
WHERE MONTH(order_date)=1
GROUP BY pizza_name
ORDER BY sum(quantity)ASC;
SELECT TOP 5 pizza_name,sum(quantity) as Total_pizzas_Sold
from pizza_sales
WHERE MONTH(order_date)=8
GROUP BY pizza_name
ORDER BY sum(quantity)ASC;




