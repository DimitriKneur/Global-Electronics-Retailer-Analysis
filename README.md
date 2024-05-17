# Global-Electronics-Retailer-Analysis

<br>

<p align="center">
<img width="792px" src='https://github.com/DimitriKneur/Global-Electronics-Retailer-Analysis/blob/main/3_PowerBI_Dashboard/Retail_Dashboard_Snapshot.gif' />
</p>

<br>

## Main objective

Analyze the sales by individual store of a global electronics retailer, and make an interactive sales dashboard.

The questions we will answer through this analysis are the following :

- Design a sales overview to compare sales and order numbers in 2019 vs in 2018

- Identify top countries, product categories and brands with the highest sales amounts

- Calculate the online sales part among total sales

- Highlight the relationship hetween sales, profit, number of orders and quantity sold

- Make a detailed sales report allowing to see all the main data for each specific store with extended filtering possibilities

- Split the total number of customers by age category, gender and geographic area

<br>

## Data sources

The data source can be found on kaggle website at [this link](https://www.kaggle.com/datasets/bhavikjikadara/global-electronics-retailers).

It consists in 6 csv files :

| Table | Description |
|-------|-------------|
| Data_Dictionary.csv | In this table, you will find a description of every single column of the other tables. This is probably where you should start in order to have a better comprehension of the data. |
| Customers.csv | The customers Dataset. It consists in information about the customers, including their gender, geographic location and birth date. |
| Exchange_Rates.csv | A table of exchange rates for 5 currencies vs USD from Jan. 2015 to Feb. 2021. These 5 currencies are the onesin which the sales are expressed. |
| Products.csv | The products table. Here, you will find the brand, category, subcategory, color and unit price for each product. |
| Sales.csv | The sales dataset, where you will find the order date, the product key associated with the sale, the quantity sold and the store key for each sale. |
| Stores.csv | The stores dataset. Here you will find the location, surface and opening date of each store. |

<br>

## Methodology and tools used

<br>

| Step | Used Tools |
|------|-------------|
| First Exploratory Data Analysis & Joining Tables | <img style="padding:2px" style="padding:2px" src="https://img.shields.io/badge/mysql-4479A1.svg?style=for-the-badge&logo=mysql&logoColor=black"/> |   
| Data Cleaning, Advanced Exploratory Data Analysis & First Visualizations | <img style="padding:2px" src="https://img.shields.io/badge/python-3776AB.svg?style=for-the-badge&logo=python&logoColor=black"/> <img style="padding:2px" src="https://img.shields.io/badge/pandas-150458.svg?style=for-the-badge&logo=pandas&logoColor=black"/> <img style="padding:2px" src="https://img.shields.io/badge/plotly-3F4F75.svg?style=for-the-badge&logo=plotly&logoColor=black"/> |
| Advanced Data Visualizations & Dashboard | <img style="padding:2px" src="https://img.shields.io/badge/Power%20BI-F2C811.svg?style=for-the-badge&logo=powerbi&logoColor=black"/> | 

<br>

## Results

<br>

The final dashboard made with Power BI can be found [here](https://github.com/DimitriKneur/Global-Electronics-Retailer-Analysis/blob/main/3_PowerBI_Dashboard/Global_Electronics_Retailer_Analysis_Dashboard.pbix).

If you don't have the Power BI software, you can still have a look at [this animation](https://github.com/DimitriKneur/Global-Electronics-Retailer-Analysis/blob/main/3_PowerBI_Dashboard/Retail_Dashboard_Snapshot.gif) to see how does the dashboard looks like.
