-- Explore customers table --

-- Snaphsot of the table --
SELECT * FROM customers
LIMIT 100;

-- Number of rows in the table --
SELECT COUNT(*) FROM customers;

-- Number of people by gender --
SELECT COUNT(*) AS  `NumberOfPeople`, `Gender` FROM customers
GROUP BY `Gender`
ORDER BY `Gender` DESC;

-- Compute total number of rows with CTE --
WITH group_by_gender AS (SELECT COUNT(*) AS  `NumberOfPeople`, `Gender` FROM customers
GROUP BY `Gender`
ORDER BY `Gender` DESC)
SELECT SUM(`NumberOfPeople`) FROM group_by_gender;

-- Compute total number of people by gender with their corresponding proportions with CTE --
WITH group_by_gender AS (SELECT COUNT(*) AS  `NumberOfPeople`, `Gender` FROM customers
GROUP BY `Gender`
ORDER BY `NumberOfPeople` DESC)
SELECT `NumberOfPeople`, `Gender`, (`NumberOfPeople` / (SELECT SUM(`NumberOfPeople`) FROM group_by_gender)) AS `Proportion` FROM group_by_gender
GROUP BY `Gender`
ORDER BY `NumberOfPeople` DESC;

-- Compute total number of people by country with their corresponding proportions with CTE --
WITH group_by_gender AS (SELECT COUNT(*) AS  `NumberOfPeople`, `Country` FROM customers
GROUP BY `Country`
ORDER BY `NumberOfPeople` DESC)
SELECT `NumberOfPeople`, `Country`, (`NumberOfPeople` / (SELECT SUM(`NumberOfPeople`) FROM group_by_gender)) AS `Proportion` FROM group_by_gender
GROUP BY `Country`
ORDER BY `NumberOfPeople` DESC;

-- Compute total number of people by continent with their corresponding proportions with CTE --
WITH group_by_gender AS (SELECT COUNT(*) AS  `NumberOfPeople`, `Continent` FROM customers
GROUP BY `Continent`
ORDER BY `NumberOfPeople` DESC)
SELECT `NumberOfPeople`, `Continent`, (`NumberOfPeople` / (SELECT SUM(`NumberOfPeople`) FROM group_by_gender)) AS `Proportion` FROM group_by_gender
GROUP BY `Continent`
ORDER BY `NumberOfPeople` DESC;

-- Compute the number of customers by State in the USA --
SELECT COUNT(*) AS `NumberOfPeople`, `State` FROM customers
WHERE `Country` = 'United States'
GROUP BY `State`
ORDER BY `NumberOfPeople` DESC;