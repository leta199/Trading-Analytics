# Trading-Analytics  
In the world of stock holdings, tracking information about these holders is of paramount importance. We can keep track of all of the transactions, current holdings, ratings etc in connected databases and we can extract useful information from them using SQL queries. As owners of this hypothetical stock trading platform, it is our job to deliver useful insights from our database to drive business decisions. 

This repository aims to:

1) Provide key business insights into stock information and user profiles.
2) Understand underlying database structure. 
3) Analyse queries to gain deeper understanding of each line of code.

## HOW IT'S MADE  
Language used: SQL  
Database: Oracle Autonomous Database  

[![Language: SQL](https://img.shields.io/badge/Language-SQL-blue.svg?style=flat-square)]()
[![Database: Oracle](https://img.shields.io/badge/Database-Oracle%20Autonomous%20DB-F80000.svg?style=flat-square&logo=oracle&logoColor=white)]()
![Status](https://img.shields.io/badge/Status-Completed-lightgrey)

## METHODS AND TECHNIQUES    
The key questions we would like to answer are: 

1) What stocks have historically had a higher than average opening, closing and high ?
2) What are the most popular shares by quantity sold and in which countries ?

### DATA 
For this query we began by defining the requirements to keep track of our stock information and based our tables on these business requirements.  
This information is broken into the following tables:  

Address - The physical adddress of the profile holders including citizenship status, and if their mailing  is different from their physical address.  
Profile - Profile information for each account holder including profile ID, full name, and email.  
Rating types - What the rating of each stock is including: buy, sell or hold.  
Analyst opinion - What each analyst states about a stock such as date of opinion, rating code and price. 
Portfolio - Portfolio ID and profile ID.  
Stock information - Information on all of the stock we buy/ sell and that are held in portfolios.  
Insider trading - Information on the traders like shares traded, price, type (buy/ sell), and symbol.  
Currencies - Currency code.  
Dividend schedule - Schedule of the disperment of dividends for stock holders including stock symbol, dividend amount, yield and currency.  
Stock history - History of the stock prices such as gistroy date, open, close, volume, high. 

<img width="1402" height="832" alt="Image" src="https://github.com/user-attachments/assets/f6511e06-6a23-407c-86e3-1022f84a4049" />

<img width="1324" height="865" alt="Image" src="https://github.com/user-attachments/assets/8961474c-8e85-403a-a90c-f01cc0cc8dc9" />

The ddl can be found in the "database files" part of the repository: [ddl file](https://github.com/leta199/Trading-Analytics/blob/main/database_files/stock_database.ddl)

### **QUERY #1**

For this query, portfolio managers for the various customers served by our stock trading website would like to make the most amount of returns possible to maximize ROI for their clients. Many of their customers are also risk averse and therefore would like to be able to look closely at individual stock prices throughout the history of each stock and have a good way of knowing what stocks are riskier than other based on the opening, closing and high of each stock in comparison to all the stocks we offer on our trading platform. 

Therefore, they require that we make a Stock grade that indicates how each stock performs considering the opening, closing and high of each stock. This means that any stock that performs well below the average across all three metrics (opening, closing and high) will be greater risk and should be marked as such for clients to discuss whether to invest in the stock with their portfolio managers. 

<img width="657" height="262" alt="Image" src="https://github.com/user-attachments/assets/4feabd91-9b5f-42ff-8cff-bc41f97f6e33" />

*Code analysis*   
We begin by selecting the fiels we would like to appear in our query.  
In this query we selected `si.symbol` as our query has a join within it. 

`Percentage of average openng price` -Rounds to 2 decimal places how much each opening price of stock is of the average opening stock price concatanated with a % sign.  
`Percentage of average closing price` - Rounds to 2 decimal places how much each closing price of stock is of the average opening stock price concatanated with a % sign.  
`Percentage of average high price`- Rounds to 2 decimal places how much each high price of stock is of the average high stock price concatanated with a % sign.   
`Case statement` - When our percentage of  opening, closing and high prices are above 90% of the average we will have a stock grade of "A". When our percentage of  opening, closing and high prices are above 50% but less than 90% of the average we will have a stcok grade of "B". Any other value of stock grade (less than 50%) is labelled "Greater risk".  
`Join on` - We then join on between the two tables we extract the information from.

FINAL INSIGHTS 

<img width="881" height="378" alt="Image" src="https://github.com/user-attachments/assets/e5e4cdfa-b558-4b8e-b7c1-ae3934d23d7b" />  

Given the available stock histories when comparing these stocks against the overall opening, closing and high we can see that:
- 3 out of 10 stocks we offer are of a higher risk i.e the opening, closing and high where 50 or below the average in 1 or more categories.
- Customers will be unlikely to want to pick these stocks since they serially underperform compared to the other 7 stocks.
- As a result, they would rather stick to stocks of a higher grade such as A or B when selecting what stocks to but to improve their portfolio. 

Additionally, as a stock trading tool company, we may want to investigate the variability in the stocks that we trade. 
- We only offer 3 stocks of the highest grade  (A) therefore, we must look into offering stocks that have a higher grade and trade at higher prices closer the average.
- Although acquiring stocks with higher opening, closing and highs will boost the average opening closing and high, stocks that have similar prices at opening, closing and high will mean that they will all be close to the same average and all get a high grade.
- As a result, our overall product offerings are less risky to customers and picking any stocks will guarantee high ROI when its time to sell regardless of what stocks the customer buys. 


### **QUERY #2**
Management would like to investigate what countries have the most trading activity in the database of most recent transactions. They want to know which countries contribute most to our business’s operations in terms of number of stocks traded. This will help with initiatives in the future that will give priority sales to the customers in these countries to appreciate their frequent purchases and keep good customer relationships with the most active communities of people. 

<img width="654" height="182" alt="Image" src="https://github.com/user-attachments/assets/1405c3ee-c898-4526-9c6a-d1298e52bfda" />

*Code Analysis*     
For this query we begin by defining a common table expression (CTE) this allows us to use another named query as a reference in our main query.  
`Common table expression` - is called `num_stocks` and has the count of unique stocks from thetrasnactions table. we will reference it in our main query.  

We select the fields we want to to list and begin with the field `country`.  
`Stocks of companies traded in` - using the `listaff` function allows us to list in 1 row each stock symbol traded in each country separted by a "," and oreder by symbol.  
`Number of companies traded` -  the number of stocks traded for each country.  
`Percentage of total number of companies traded` - divides the count of indicual stocks by the total stocks from our CTE converting into a percentage by multiplying by 100 and rounding to 2 decimal places and concatenating the percentage symbol "%".   
`Number of stocks sold` - sums the quantity of stocks traded.  
We then use a `join` on for the tables address and transactions and a `cross join` with our CTE num_stocks. 

FINAL INSIGHTS 
<img width="899" height="215" alt="Image" src="https://github.com/user-attachments/assets/acc17049-dfcd-42fb-b83e-8b0878087ccf" />

Based on the query we have carried out:
- South Africa (SA) has the greater number of shares traded as well as the largest proportion companies traded  (57.14%).
- This indicates that South African clients are the most valuable and generate the greatest amount of traffic and revenue through our trading platform.
- As a result, we will provide priority trading to South African our clients to keep their high number of transactions. This will build customer loyalty since they get first picks on stocks at the fairest prices in the market. 

This query gives greater insight into the trading habits of people across countries. 
- We can see that South Africa and Botswana trade the largest variety of companies and greatest quantity followed by Namibia in quantity.
- We will want to create initiatives that encourage customers from Egypt and Uganda to trade a greater number of stocks and more companies than just Google and Microsoft.
- This could be through initiatives such as better marketing to inform these customers of other stock options that fit their current portfolio through notifications and tailored advertisements. 

## PROJECT STRUCTURE           
|[SQL Trading Analytics](https://github.com/leta199/Monte-Carlo-Integration/blob/main/Monte%20Carlo%20Integration.r)  
|├──[database files](https://github.com/leta199/SQL-Trading-Analytics/tree/main/database_files)  
│  ├──[countries](https://github.com/leta199/Trading-Analytics/blob/main/database_files/COUNTRIES_DATA_TABLE.xlsx)   
│  ├──[currencies](https://github.com/leta199/Trading-Analytics/blob/main/database_files/CURRENCIES_DATA_TABLE.xlsx)      
│  ├──[dividend schedule](https://github.com/leta199/Trading-Analytics/blob/main/database_files/DIVIDEND_SCHEDULE_DATA_TABLE.xlsx)  
│  ├──[countries](https://github.com/leta199/Trading-Analytics/blob/main/database_files/COUNTRIES_DATA_TABLE.xlsx)   
│  ├──[currencies](https://github.com/leta199/Trading-Analytics/blob/main/database_files/CURRENCIES_DATA_TABLE.xlsx)      
│  ├──[dividend schedule](https://github.com/leta199/Trading-Analytics/blob/main/database_files/DIVIDEND_SCHEDULE_DATA_TABLE.xlsx)    
│  ├──[insider trading](https://github.com/leta199/Trading-Analytics/blob/main/database_files/INSIDER_TRADING_DATA_TABLE.xlsx)   
│  ├──[portfolio](https://github.com/leta199/Trading-Analytics/blob/main/database_files/PORTFOLIO_DATA_TABLE.xlsx)      
│  ├──[profile](https://github.com/leta199/Trading-Analytics/blob/main/database_files/PROFILE_DATA_TABLE.xlsx)    
│  ├──[rating types](https://github.com/leta199/Trading-Analytics/blob/main/database_files/RATING_TYPES_DATA_TABLE.xlsx)   
│  ├──[stock history](https://github.com/leta199/Trading-Analytics/blob/main/database_files/STOCK_HISTORY_DATA_TABLE.xlsx)      
│  ├──[stcok information ](https://github.com/leta199/Trading-Analytics/blob/main/database_files/STOCK_INFORMATION_DATA_TABLE.xlsx)    
│  ├──[transactions ](https://github.com/leta199/Trading-Analytics/blob/main/database_files/TRANSACTIONS_DATA_TABLE.xlsx)        
│  └──[database ddl](https://github.com/leta199/Trading-Analytics/blob/main/database_files/stock_database.ddl)  
│    
|├──[query details](https://github.com/leta199/SQL-Trading-Analytics/tree/main/query_details)      
│  ├──[query #1 result](https://github.com/leta199/SQL-Trading-Analytics/blob/main/query_details/Query%20%231%20result.xlsx)    
│  ├──[query #1 result](https://github.com/leta199/SQL-Trading-Analytics/blob/main/query_details/Query%20%231%20result.xlsx)   
│  └──[sql query](https://github.com/leta199/Trading-Analytics/blob/main/query_details/SQL_query.sql)     
│  ├──[.gitattributes](https://github.com/leta199/Trading-Analytics/blob/main/query_details/.gitattributes)   
|  
|└──[README](https://github.com/leta199/SQL-Trading-Analytics/blob/main/README.md)

# ACKNOWLEDGEMENT   
Thank you to Dr Jean Nonnemaker for helping with the project in the creation of the database and necessary ddl. 

## AUTHORS   
[leta199](https://github.com/leta199)
