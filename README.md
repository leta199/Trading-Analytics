# SQL-Trading-Analytics  
In the world of stock holdings, tracking information about these holders is off paramount importance. We can keep track of all of the trasnactions, current holdings, ratings etc in connected databases and we can xtract useful information from them using SQL queries. We will aim to answer the following business questions using  SQL queries to gain insight into our customers. 

This repository aims to:

1) Provide key business insights into stock information and user profiles
2) Understand underlying database structure 
3) Analyse queries to gain deeper understanding of each line

## HOW IT'S MADE 
Languages used: R (version 4.5.1)    
Environement: RStudio  

[![Language: R](https://img.shields.io/badge/Language-R-276DC3.svg?style=flat-square)](https://www.r-project.org/)
[![Built with RStudio](https://img.shields.io/badge/IDE-RStudio-75AADB?style=for‐the‐badge&logo=rstudio&logoColor=white)](https://www.rstudio.com/)
![Status](https://img.shields.io/badge/Status-Completed-lightgrey)

## METHODS AND TECHNIQUES    
The key questions we would like to answer are: 
1) What stocks have historically had a higher than average opening, closing and high?
2) What are the most popular shares by quantity sold?

**QUERY #1**

For this query  portfolio managers for the various customers served by our stock trading website would like to make the most amount of returns possible to maximize ROI for their clients. Many of their customers are also risk averse and therefore would like to be able to look closely at individual stock prices throughout the history of each stock and have a good way of knowing what stocks are riskier than other based on the opening, closing and high of each stock in comparison to all the stocks we offer on our trading platform. Therefore, they require that we make a Stock grade that indicates how each stock performs considering the opening, closing and high of each stock. This means that any stock that performs well below the average across all three metrics (opening, closing and high) will be greater risk and should be marked as such for clients to discuss whether to invest in the stock with their portfolio managers. 

<img width="657" height="262" alt="Image" src="https://github.com/user-attachments/assets/4feabd91-9b5f-42ff-8cff-bc41f97f6e33" />

*Code analysis*  
We begin by selecting the fiels we would like to appear in our query.  
In this query we selected `si.symbol` as our query has a join within it. 

`Percentage of average openng price` - rounds to 2 decimal places how much each opening price of stock is of the average opening stock price concatanated with a % sign.  
`Percentage of average closing price` - rounds to 2 decimal places how much each closing price of stock is of the average opening stock price concatanated with a % sign.  
`Percentage of average high price`-rounds to 2 decimal places how much each high price of stock is of the average high stock price concatanated with a % sign.   
`Case statement` - when our percentage of  opening, closing and high prices are above 90% of the average we will have a stock grade of "A". When our percentage of  opening, closing and high prices are above 50% but less than 90% of the average we will have a stcok grade of "B". Any other value of stock grade (less than 50%) is labelled "Greater risk".  
`Join on` - we then join on between the two tables we extract the information from.

**QUERY #2**
Management would like to investigate what countries have the most trading activity in the database of most recent transactions. They want to know which countries contribute most to our business’s operations in terms of number of stocks traded. This will help with initiatives in the future that will give priority sales to the customers in these countries to appreciate their frequent purchases and keep good customer relationships with the most active communities of people. 

<img width="654" height="182" alt="Image" src="https://github.com/user-attachments/assets/1405c3ee-c898-4526-9c6a-d1298e52bfda" />

*Code Analysis*   
For this query we begin by defining a common table expression (CTE) this allows us to use another named query as a reference in our main query.  
`Common table expression` - is called `num_stocks` and has the count of unique stocks from thetrasnactions table. we will reference it in our main query.  

We select the fields we want to to list and begin with the field `country`.  
`Stocks of companies traded in` - using the `listaff` function allows us to list in 1 row each stock symbol traded in each country separted by a "," and oreder by symbol.  
`Number of companies traded` -  the number of stocks traded for each country.  
`Percentage of 



## PROJECT STRUCTURE           
|[SQL Trading Analytics](https://github.com/leta199/Monte-Carlo-Integration/blob/main/Monte%20Carlo%20Integration.r)  
|├──[database files](https://github.com/leta199/SQL-Trading-Analytics/tree/main/database_files)  
│  ├──[]()   
│  └──[]()      
│    
|├──[query details](https://github.com/leta199/SQL-Trading-Analytics/tree/main/query_details)      
│  ├──[query #1 result](https://github.com/leta199/SQL-Trading-Analytics/blob/main/query_details/Query%20%231%20result.xlsx)   
│  └──[query #2 result](https://github.com/leta199/SQL-Trading-Analytics/blob/main/query_details/Query%20%232%20result.xlsx)      
|  
|└──[README](https://github.com/leta199/SQL-Trading-Analytics/blob/main/README.md)
  
## AUTHORS   
[leta199](https://github.com/leta199)
