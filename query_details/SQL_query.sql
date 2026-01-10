/*Problem #1*/
/* What stocks have historically had a higher than average opening, closing and high*/

select si.symbol, /*the data we would like to extract*/
    round((open/(select avg(open) from STOCK_HISTORY))*100,2) || '%'  "Percent of average opening price",   /*dividing each opening price by average opening price*/
    round((close/(select avg(close) from STOCK_HISTORY))*100,2) || '%'  "Percent of average closing price", /*dividing each closing price by average closing price*/
    round((high/(select avg(high) from STOCK_HISTORY))*100,2) || '%'  "Percent of average high price",      /*dividing each high price by average high price*/
    case                                                                                                    /*adding a label for each type of stock with anything below B grade being risk*/
         when   round((open/(select avg(open) from STOCK_HISTORY))*100,2) > 90 and 
                round((close/(select avg(close) from STOCK_HISTORY))*100,2) > 90 and 
                round((high/(select avg(high) from STOCK_HISTORY))*100,2) > 90 then 'A'
         when   round((open/(select avg(open) from STOCK_HISTORY))*100,2) > 50 and 
                round((close/(select avg(close) from STOCK_HISTORY))*100,2) > 50 and 
                round((high/(select avg(high) from STOCK_HISTORY))*100,2) > 50 then 'B'
                else 'Greater risk'
    end "Stock grade"
from stock_information si join stock_history sh on sh.symbol = si.symbol                                     /*join between two tables*/



/*Problem #2*/
/*Most popular shares by quantity sold*/
with num_stocks as                                                                                            /*Common table expression (CTE) for the number of transactions that have a certain stock symbol*/
    (select count(unique symbol) total_stocks from transactions)
select country,                                                                                               /* regular selection of necessary countries that each stock was bought/ sold in*/
        listagg( unique symbol, ',') within group (order by symbol) "Stocks of companies traded in country",  /*adding each stock symbol that is present in a transaction for each country code*/
        count( unique symbol) "Number of companies traded",                                                   /*counting the number of traded symbols*/
        round((count(unique symbol)/ ns.total_stocks)*100, 2) || '%' "Percentage of total number of companies traded", /*calculating the percentage of total stocks sold each transaction represents*/
        sum(quantity)  "Number of stocks sold"    
from address a join transactions t on t.profile_id = a.profile_id                                             /*joining on between two tables*/
               cross join num_stocks  ns                                                                      /*cross joining to add each transactions from CTE*/
group by country, ns.total_stocks                                                                             /*categorising each row by country in our CTE and by country 
order by 4 desc ,5 desc                                                                                       /*ordering query by "Percentage of total number of companies traded" and "Number of stocks sold"*/

