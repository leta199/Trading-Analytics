/*Problem #1*/
/* What stocks have historically had a higher than average opening, closing and high*/

select si.symbol, 
    round((open/(select avg(open) from STOCK_HISTORY))*100,2) || '%'  "Percent of average opening price",
    round((close/(select avg(close) from STOCK_HISTORY))*100,2) || '%'  "Percent of average closing price",
    round((high/(select avg(high) from STOCK_HISTORY))*100,2) || '%'  "Percent of average high price",
    case  
         when   round((open/(select avg(open) from STOCK_HISTORY))*100,2) > 90 and 
                round((close/(select avg(close) from STOCK_HISTORY))*100,2) > 90 and 
                round((high/(select avg(high) from STOCK_HISTORY))*100,2) > 90 then 'A'
         when   round((open/(select avg(open) from STOCK_HISTORY))*100,2) > 50 and 
                round((close/(select avg(close) from STOCK_HISTORY))*100,2) > 50 and 
                round((high/(select avg(high) from STOCK_HISTORY))*100,2) > 50 then 'B'
                else 'Greater risk'
    end "Stock grade"
from stock_information si join stock_history sh on sh.symbol = si.symbol 



/*Problem #2*/
/*Most popular shares by quantity sold*/
with num_stocks as
    (select count(unique symbol) total_stocks from transactions)
select country,
        listagg( unique symbol, ',') within group (order by symbol) "Stocks of companies traded in country",
        count( unique symbol) "Number of companies traded",
        round((count(unique symbol)/ ns.total_stocks)*100, 2) || '%' "Percentage of total number of companies traded",
        sum(quantity)  "Number of stocks sold"    
from address a join transactions t on t.profile_id = a.profile_id
               cross join num_stocks  ns
group by country, ns.total_stocks
order by 4 desc ,5 desc

