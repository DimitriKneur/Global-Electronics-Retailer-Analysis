-- Explore products table --

-- Snaphshot of the products table --
SELECT * FROM products
LIMIT 100;

-- Display the number of products in the table --
SELECT COUNT(*) FROM products;

-- Display the number of products in the table by brand --
SELECT COUNT(*) AS `NumberOfProducts`, `Brand`
FROM products
GROUP BY `Brand`
ORDER BY `NumberOfProducts` DESC;

-- Display the number of products in the table by brand --
SELECT COUNT(*) AS `NumberOfProducts`, `Brand`
FROM products
GROUP BY `Brand`
ORDER BY `NumberOfProducts` DESC;

-- Display the number of products in the table by category --
SELECT COUNT(*) AS `NumberOfProducts`, `Category`
FROM products
GROUP BY `Category`
ORDER BY `NumberOfProducts` DESC;

-- Display the number of products in the table by category --
SELECT COUNT(*) AS `NumberOfProducts`, `Category`
FROM products
GROUP BY `Category`
ORDER BY `NumberOfProducts` DESC;

-- Display the number of products in the table by category with their respective proportions, having a proportion > 0.1 --
WITH group_by_category AS (SELECT COUNT(*) AS `NumberOfProducts`, `Category`
FROM products
GROUP BY `Category`
ORDER BY `NumberOfProducts` DESC)
SELECT `NumberOfProducts`, `Category`, ( `NumberOfProducts` / (SELECT SUM(`NumberOfProducts`) AS `NumberOfProducts` FROM group_by_category)) AS `Proportion`
FROM group_by_category
HAVING `Proportion` > 0.1
ORDER BY `NumberOfProducts` DESC;

-- Display the number of products in the table by subcategory where the category is home appliances --
SELECT COUNT(*) AS `NumberOfProducts`, `Subcategory`
FROM products
WHERE `Category` = 'Home Appliances'
GROUP BY `Subcategory`
ORDER BY `NumberOfProducts` DESC;