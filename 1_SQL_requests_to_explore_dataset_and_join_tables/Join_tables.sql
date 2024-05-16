/* Let's join the tables together
The obtained result has been exported as "global-electronics-retailer-analysis-raw-dataset.csv" at the root of this folder*/
SELECT stores.`StoreKey`,
	   stores.`State` as StoreState,
       stores.`Country` as StoreCountry,
       stores.`Open Date` as StoreOpenDate,
       stores.`Square Meters` as StoreSurfaceAsSquareMeters,
       sales.`Order Number`,
	   sales.`Order Date`, 
	   products.`ProductKey`,
       products.`Product Name`,
       products.`Brand`,
       products.`Category`,
       products.`Subcategory`,
       products.`Unit Cost USD`,
       products.`Unit Price USD`,
       sales.`Currency Code`,
       rates.`Exchange` AS ExchangeVsUSD,
	   sales.`Quantity`,
       customers.`CustomerKey`,
       customers.`Birthday`,
       customers.`Gender`,
       customers.`City` AS CustomerCity,
       customers.`State` AS CustomerState,
       customers.`Country` AS CustomerCountry,
       customers.`Continent` AS CustomerContinent
       FROM sales
JOIN exchange_rates AS rates ON sales.`Order Date` = rates.`Date` AND sales.`Currency Code` = rates.`Currency`
JOIN products ON sales.`ProductKey` = products.`ProductKey`
JOIN customers ON sales.`CustomerKey` = customers.`CustomerKey`
JOIN stores ON sales.`StoreKey` = stores.`StoreKey`;