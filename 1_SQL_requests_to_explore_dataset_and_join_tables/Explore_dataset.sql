-- Explore Dataset --

-- Explore customers table --

-- Snaphsot of the table / see the result of the query in "sql_requests_snapshots/explore_customers_1.png" --
SELECT * FROM customers
LIMIT 100;

-- Number of rows in the table / see the result of the query in "sql_requests_snapshots/explore_customers_2.png" --
SELECT COUNT(*) AS NumberOfCustomers FROM customers;

-- Number of people by gender / see the result of the query in "sql_requests_snapshots/explore_customers_3.png" --
SELECT COUNT(*) AS  `NumberOfPeople`, `Gender` FROM customers
GROUP BY `Gender`
ORDER BY `Gender` DESC;

-- Compute total number of people by gender with their corresponding proportions with CTE / see the result of the query in "sql_requests_snapshots/explore_customers_5.png" --
WITH group_by_gender AS (SELECT COUNT(*) AS  `NumberOfPeople`, `Gender` FROM customers
                         GROUP BY `Gender`
                         ORDER BY `NumberOfPeople` DESC)
SELECT `NumberOfPeople`,
       `Gender`,
       (`NumberOfPeople` / (SELECT SUM(`NumberOfPeople`) FROM group_by_gender)) AS `Proportion`
FROM group_by_gender
GROUP BY `Gender`
ORDER BY `NumberOfPeople` DESC;

-- Compute total number of people by country with their corresponding proportions with CTE / see the result of the query in "sql_requests_snapshots/explore_customers_6.png" --
WITH group_by_gender AS (SELECT COUNT(*) AS  `NumberOfPeople`, `Country` FROM customers
GROUP BY `Country`
ORDER BY `NumberOfPeople` DESC)
SELECT `NumberOfPeople`, `Country`, (`NumberOfPeople` / (SELECT SUM(`NumberOfPeople`) FROM group_by_gender)) AS `Proportion` FROM group_by_gender
GROUP BY `Country`
ORDER BY `NumberOfPeople` DESC;

-- Compute total number of people by continent with their corresponding proportions with CTE / see the result of the query in "sql_requests_snapshots/explore_customers_7.png" --
WITH group_by_gender AS (SELECT COUNT(*) AS  `NumberOfPeople`, `Continent` FROM customers
GROUP BY `Continent`
ORDER BY `NumberOfPeople` DESC)
SELECT `NumberOfPeople`, `Continent`, (`NumberOfPeople` / (SELECT SUM(`NumberOfPeople`) FROM group_by_gender)) AS `Proportion` FROM group_by_gender
GROUP BY `Continent`
ORDER BY `NumberOfPeople` DESC;

-- Compute the number of customers by State in the USA / see the result of the query in "sql_requests_snapshots/explore_customers_8.png" --
SELECT `State`, COUNT(*) AS `NumberOfPeople` FROM customers
WHERE `Country` = 'United States'
GROUP BY `State`
ORDER BY `NumberOfPeople` DESC;

-- Explore data_dictionary table --

-- See the table content / see the result of the query in "sql_requests_snapshots/explore_data_dictionary.png" --
SELECT * FROM data_dictionary
LIMIT 100;

-- Explore exchange_rates table --

-- See the table content / see the result of the query in "sql_requests_snapshots/explore_exchange_rates.png" --
SELECT * FROM exchange_rates
LIMIT 100;

-- Explore products table --

-- Snaphshot of the products table / see the result of the query in "sql_requests_snapshots/explore_products_1.png" --
SELECT * FROM products
LIMIT 100;

-- Display the number of products in the table / see the result of the query in "sql_requests_snapshots/explore_products_2.png" --
SELECT COUNT(*) AS NumberOfProducts FROM products;

-- Display the number of products in the table by brand / see the result of the query in "sql_requests_snapshots/explore_products_3.png" --
SELECT `Brand`, COUNT(*) AS `NumberOfProducts`
FROM products
GROUP BY `Brand`
ORDER BY `NumberOfProducts` DESC;

-- Display the number of products in the table by category / see the result of the query in "sql_requests_snapshots/explore_products_5.png" --
SELECT `Category`, COUNT(*) AS `NumberOfProducts`
FROM products
GROUP BY `Category`
ORDER BY `NumberOfProducts` DESC;

/* Display the number of products in the table by category with their respective proportions, having a proportion > 0.1 
See the result of the query in "sql_requests_snapshots/explore_products_6.png" */
WITH group_by_category AS (SELECT COUNT(*) AS `NumberOfProducts`, `Category`
FROM products
GROUP BY `Category`
ORDER BY `NumberOfProducts` DESC)
SELECT  `Category`, `NumberOfProducts`, ( `NumberOfProducts` / (SELECT SUM(`NumberOfProducts`) AS `NumberOfProducts` FROM group_by_category)) AS `Proportion`
FROM group_by_category
HAVING `Proportion` > 0.1
ORDER BY `NumberOfProducts` DESC;

/* Display the number of products in the table by subcategory where the category is home appliances 
See the result of the query in "sql_requests_snapshots/explore_products_7.png" */
SELECT `Subcategory`, COUNT(*) AS `NumberOfProducts`
FROM products
WHERE `Category` = 'Home Appliances'
GROUP BY `Subcategory`
ORDER BY `NumberOfProducts` DESC;

-- Explore sales--

-- Snapshot of the sales table / see the result of the query in "sql_requests_snapshots/explore_sales_1.png"--
SELECT * FROM sales
LIMIT 100;

-- Count of the number of records  / see the result of the query in "sql_requests_snapshots/explore_sales_2.png"--
SELECT COUNT(*) AS NumberOfRecords FROM sales;

-- Count of the number of distinct orders / see the result of the query in "sql_requests_snapshots/explore_sales_3.png"--
SELECT COUNT(DISTINCT `Order Number`) AS NumberOfDistinctOrders FROM sales;

-- Count of the number of orders by store / see the result of the query in "sql_requests_snapshots/explore_sales_4.png"--
SELECT sal.`StoreKey`, sto.`Country`, COUNT(DISTINCT sal.`Order Number`) AS NumberOfDistinctOrders
FROM sales AS sal
JOIN stores AS sto ON sal.`StoreKey` = sto.`StoreKey`
GROUP BY sal.`StoreKey`, sto.`Country`
ORDER BY NumberOfDistinctOrders DESC;

-- Quantity sold by store / see the result of the query in "sql_requests_snapshots/explore_sales_5.png"--
SELECT `StoreKey`, SUM(`Quantity`) AS SumQuantity
FROM sales
GROUP BY `StoreKey`
ORDER BY SumQuantity DESC
LIMIT 10;

-- Distinct number of customer keys by store / see the result of the query in "sql_requests_snapshots/explore_sales_6.png"--
SELECT `StoreKey`, COUNT(DISTINCT `CustomerKey`) AS NbCustomerKeys
FROM sales
GROUP BY `StoreKey`
ORDER BY NbCustomerKeys DESC
LIMIT 10;

-- Explore stores --

-- Snapshot of the stores table / see the result of the query in "sql_requests_snapshots/explore_stores_1.png"--
SELECT * FROM stores
LIMIT 10;

-- StoreKey 0 not imported, we have to add it manually --
INSERT INTO stores
(`StoreKey`, `Country`, `State`, `Square Meters`, `Open Date`)
VALUES
(0, 'Online', 'Online', 0, '1/1/2010');

-- Snapshot of the stores table after addition of the online store--
SELECT * FROM stores;

-- Number of stores by country / see the result of the query in "sql_requests_snapshots/explore_stores_2.png"--
SELECT `Country`, COUNT(DISTINCT `StoreKey`) AS NumberOfStores
FROM stores
GROUP BY `Country`
ORDER BY NumberOfStores DESC
LIMIT 5;

-- Number of stores by state in the US / see the result of the query in "sql_requests_snapshots/explore_stores_3.png"--
SELECT `State`, COUNT(DISTINCT `StoreKey`) AS NumberOfStores 
FROM stores
WHERE `Country` = 'United States'
GROUP BY `State`
ORDER BY NumberOfStores DESC
LIMIT 10;