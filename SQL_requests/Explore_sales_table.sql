-- Explore sales--

-- Snapshot of the sales table --
SELECT * FROM sales
LIMIT 100;

-- Count of the number of records --
SELECT COUNT(*) AS NumberOfRecords FROM sales;

-- Count of the number of distinct orders --
SELECT COUNT(DISTINCT `Order Number`) AS NumberOfDistinctOrders FROM sales;

-- Count of the number of orders by store --
SELECT COUNT(DISTINCT `Order Number`) AS NumberOfDistinctOrders, `StoreKey`
FROM sales
GROUP BY `StoreKey`
ORDER BY NumberOfDistinctOrders DESC;

-- Quantity sold by store --
SELECT SUM(`Quantity`) AS SumQuantity, `StoreKey`
FROM sales
GROUP BY `StoreKey`
ORDER BY SumQuantity DESC;

-- Distinct number of customer keys by store --
SELECT COUNT(DISTINCT `CustomerKey`) AS NbCustomerKeys, `StoreKey`
FROM sales
GROUP BY `StoreKey`
ORDER BY NbCustomerKeys DESC;

-- Distinct number of currency codes --
SELECT COUNT(DISTINCT `Currency Code`) FROM sales;