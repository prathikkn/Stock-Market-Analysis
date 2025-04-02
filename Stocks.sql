-- ------------------------------------------KPI-1-------------------------------------
select Ticker as "Stock" ,avg(VOLUME) AS "Avg Daily Traded Volume" 
from STOCK_DATA
group by ticker 
order by avg(volume) DESC; 

 -- ------------------------------------------KPI-2--------------------------------------       
select Ticker as "Stock" ,round(avg(beta),4) AS "Avg of Beta values" 
from STOCK_DATA 
group by ticker 
order by avg(beta)  DESC ;

-- ------------------------------------------KPI-3--------------------------------------
        
select Ticker as "Stock" ,round(avg(dividend_amount),4) AS "Dividend Amount" 
from STOCK_DATA 
where Ticker IN('GOOGL', 'FB', 'AAPL', 'MSFT', 'AMZN')
group by ticker 
order by avg(dividend_amount);


-- ------------------------------------------KPI-4--------------------------------------
                
select Ticker as "Stock" , round(avg(PE_ratio),3) AS "Avg P/E Ratio" 
from STOCK_DATA 
where Ticker IN('GOOGL', 'FB', 'AAPL', 'MSFT', 'AMZN')
group by ticker
order by avg(PE_Ratio); 

-- ------------------------------------------KPI-5--------------------------------------

select Ticker as "Stock" ,CONCAT((ROUND((avg(market_cap)/1000000000),3))," B") AS "Avg Market Capital" 
from STOCK_DATA 
where Ticker IN('GOOGL', 'FB', 'AAPL', 'MSFT', 'AMZN')
group by ticker 
order by avg(market_cap);

-- ------------------------------------------KPI-6-------------------------------------- 

select Ticker as "Stock" ,round(avg('52 Week High'),2)  AS "52 Week High" 
from STOCK_DATA 
where Ticker IN('GOOGL', 'FB', 'AAPL', 'MSFT', 'AMZN')
group by ticker ;
        
-- ------------------------------------------KPI-7--------------------------------------        

select Ticker as "Stock" ,round(avg('52 Week Low'),2)  AS "52 Week Low" 
from STOCK_DATA 
where Ticker IN('GOOGL', 'FB', 'AAPL', 'MSFT', 'AMZN')
group by ticker ;

-- ------------------------------------------KPI-8--------------------------------------        

select TICKER,date,rsi_14 as "RSI (14 Days)",MACD ,
(CASE 
WHEN RSI_14 <=45 AND MACD >0 THEN "BUY"
WHEN RSI_14 >=69 AND MACD <0 THEN "SELL"
ELSE "WAIT"
END) AS "Buy/Wait/Sell"
FROM STOCK_DATA;
