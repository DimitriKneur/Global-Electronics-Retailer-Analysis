-- Explore stores --

-- Snapshot of the stores table --
SELECT * FROM stores;

-- StoreKey 0 not imported, we have to add it manually --
INSERT INTO stores
(`StoreKey`, `Country`, `State`, `Square Meters`, `Open Date`)
VALUES
(0, 'Online', 'Online', 0, '1/1/2010');

-- Snapshot of the stores table after addition of the online store--
SELECT * FROM stores;

-- Number of stores by country --
SELECT COUNT(DISTINCT `StoreKey`) AS NumberOfStores, `Country`
FROM stores
GROUP BY `Country`
ORDER BY NumberOfStores DESC
LIMIT 5;

-- Number of stores by state in the US --
SELECT COUNT(DISTINCT `StoreKey`) AS NumberOfStores, `State`
FROM stores
WHERE `Country` = 'United States'
GROUP BY `State`
ORDER BY NumberOfStores DESC;