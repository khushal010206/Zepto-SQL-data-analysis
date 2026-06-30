DROP TABLE IF EXISTS zepto;
CREATE TABLE zepto(
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
avalableQuantity INT,
discounted_shelling_price NUMERIC(8,2),
weights_in_gms INT,
out_of_stock BOOLEAN,
quantity INT
);

-- data exploration

--count rows
SELECT * FROM zepto;

SELECT COUNT(*) FROM zepto;


-- Sample data

SELECT * FROM zepto
LIMIT 10;

-- null values
SELECT * FROM zepto
WHERE name IS  NULL
OR
mrp IS  NULL
OR 
discountpercent IS  NULL
OR 
avalablequantity IS  NULL
OR 
discountedSellingPrice IS  NULL
OR 
weightsInGms IS  NULL
OR 
outOfStock IS  NULL
OR
quantity IS  NULL;


-- diffrent product categoryies

SELECT DISTINCT category
FROM zepto
ORDER BY category;


-- product in stock vs out stock 


SELECT outOfStock  ,COUNT(sku_id)
FROM zepto
GROUP BY outOfStock;

-- product name present multiple times

SELECT name, COUNT(sku_id) AS "Number of SKUs"
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY COUNT(sku_id) DESC;


-- data cleaning
-- product with price = 0

SELECT * FROM zepto
WHERE mrp = 0 OR discountedSellingPrice = 0;

DELETE FROM zepto
WHERE mrp = 0;


-- paise to rupees

UPDATE zepto
SET mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

SELECT mrp,discountedSellingPrice FROM zepto;


-- Q1. Find the top 10 best - value products based on the discount percentage.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;

-- Q2. What are the product with High MRP but Out of stock
SELECT DISTINCT name, mrp
FROM zepto 
WHERE outOfStock = TRUE and mrp > 300
ORDER BY mrp DESC;
-- Q3. Calculate estimated revenue for each category 
SELECT category, 
SUM(discountedSellingPrice * avalableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;
-- Q4. Find all products where MRP is geater than ₹500 and discount is less than 10%
SELECT DISTINCT name, mrp, discountPercent
FROM zepto
WHERE mrp>500 AND  discountPercent < 10
																																																																			
ORDER BY mrp DESC , discountPercent DESC;

--Q5. Identify th etop 5 categories  offring the highest avarage discount percentage.

SELECT category,
ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;
--Q6.Fint the price per gram for product above 100g and sort by best value
SELECT DISTINCT name, weightsInGms, discountedSellingPrice,
ROUND(discountedSellingPrice/weightsInGms,2) AS price_per_gram
FROM zepto
WHERE weightsInGms >= 100
ORDER BY price_per_gram;

--Q7.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightsInGms,
CASE WHEN weightsInGms < 1000 THEN 'Low'
	WHEN weightsInGms < 5000 THEN 'Medium'
	ELSE 'Bulk'
	END AS weight_category
FROM zepto;

--Q8.What is the Total Inventory Weight Per Category 
SELECT category,
SUM(weightsInGms * avalableQuantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;