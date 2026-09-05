CREATE DATABASE retail_db;
USE retail_db;

SELECT * FROM retail_db.train
LIMIT 10;


-- Retrieve all order details where the City is 'Henderson'.
SELECT * FROM train
where CITY = "Henderson";

-- Find all orders where the 'Ship Mode' is either 'First Class' or 'Same Day'.
SELECT * FROM train 
WHERE `Ship Mode` in ("Same Day" , "First Class");


-- Get a distinct list of all product Categories and Sub-Categories.
SELECT distinct Category , `Sub-Category`
FROM train;




-- LEVEL 2: AGGREGATION & BUSINESS INSIGHTS

-- Calculate the total sales generated across the entire dataset.
SELECT SUM(Sales) as total_sale 
FROM train;

-- Calculate total sales for each Category and order them from highest to lowest.
SELECT Category , SUM(Sales) as total_sales 
FROM train 
GROUP BY Category
order by total_sales DESC;

-- Find the top 5 customers based on their total purchasing amount.

select `Customer Name`, SUM(Sales) as total_sale 
FROM train 
group by `Customer Name`
order by sum(Sales) DESC limit 5;

-- Count the total number of unique orders placed in each Region.
SELECT orders COUNT(DISTINCT `Order ID`)
FROM train
group by Region;

SELECT Region, count(distinct `Order ID`)
as total_orders 
from train 
group by Region;


-- ----ADVANCED ANALYSIS & DATA INSIGHTS----


-- Find all States where the total sales exceed $50,000.
SELECT State, SUM(Sales) AS total_sale 
FROM train 
GROUP BY State 
HAVING SUM(Sales) > 100
ORDER BY total_sale DESC;

-- Calculate the average sales for each Sub-Category and sort by highest average sales.
SELECT `Sub-Category`, AVG(Sales) AS avg_sales 
FROM train 
GROUP BY `Sub-Category` 
ORDER BY avg_sales DESC;





