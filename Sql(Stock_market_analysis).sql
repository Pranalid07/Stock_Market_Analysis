select * from synthetic_stock_data;

-- AVERAGE DAILY TRADING VOLUME
SELECT ticker, YEAR(date) AS year,
 avg(volume) AS average_volume,year(date)
FROM synthetic_stock_data
GROUP BY ticker,YEAR(date) ;

-- MOST VOLATILE STOCKS
SELECT ticker, YEAR(date) AS year,
AVG(beta) AS average_beta 
FROM synthetic_stock_data
GROUP BY ticker,YEAR(date) 
ORDER BY average_beta DESC; 

-- highest beta value
SELECT  ticker, YEAR(date) AS year,
 AVG(beta) AS average_beta 
FROM synthetic_stock_data 
GROUP BY ticker ,YEAR(date) 
ORDER BY average_beta DESC
LIMIT 1;

-- STOCK WITH HIGHEST DIVIDENT AND LOWEST DIVIDENT

SELECT ticker, YEAR(date) AS year, 
       MAX(`dividend amount`) AS max_dividend, 
       MIN(`dividend amount`) AS min_dividend
FROM synthetic_stock_data
GROUP BY ticker ,YEAR(date);

-- HIGHEST AND LOWEST P/E RATIOS

SELECT  ticker, YEAR(date) AS year,
 AVG(`pe ratio`) AS average_pe_ratio
FROM synthetic_stock_data
GROUP BY ticker , YEAR(date)
ORDER BY average_pe_ratio DESC;
SELECT ticker, YEAR(date) AS year,
 ROUND(AVG(`pe ratio`)) AS average_pe_ratio
FROM synthetic_stock_data
GROUP BY ticker ,YEAR(date)
ORDER BY average_pe_ratio DESC;


-- STOCK WITH HIGHEST MARKET CAP

SELECT ticker, YEAR(date) AS year,
 ROUND(SUM(`market cap`) / 1000000000) AS total_market_cap_bln
FROM synthetic_stock_data
GROUP BY ticker, YEAR(date)
ORDER BY total_market_cap_bln DESC;

SELECT ROUND(SUM(`market cap`) / 1000000000) AS market_cap_total_bln
FROM synthetic_stock_data;

-- STOCKS NEAR 52 WEEKS HIGH
-- 1 with year
SELECT  
    ticker, 
    YEAR(date) AS year,
   round( AVG(`52 week high`)) AS avg_52_week_high
FROM synthetic_stock_data
GROUP BY ticker, YEAR(date);
SELECT  
    ticker, 
    YEAR(date) AS year,
   round( AVG(`52 week high`)) AS avg_52_week_high
FROM synthetic_stock_data
where year(date) = 2023
GROUP BY ticker, YEAR(date);


-- STOCK NEAR 52 WEEK LOW

-- 1 with year
SELECT  
    ticker, 
    YEAR(date) AS year,
   round( AVG(`52 week low`)) AS avg_52_week_low
FROM synthetic_stock_data
GROUP BY ticker, YEAR(date);
SELECT  
    ticker, 
    YEAR(date) AS year,
   round( AVG(`52 week low`)) AS avg_52_week_low
FROM synthetic_stock_data
where year(date) = 2023
GROUP BY ticker, YEAR(date);




 -- 2 without year
 SELECT ticker, ROUND(AVG(`52 week low`), 2) AS average_52_week_low
FROM synthetic_stock_data
GROUP BY ticker;

-- AVEARAGE OD MACD AND TICKER

SELECT ticker, YEAR(date) AS year,
 ROUND(AVG(macd), 2) AS average_macd
FROM synthetic_stock_data
GROUP BY ticker, YEAR(date);

-- ACERAGE OF RSI (10 DAYS)


SELECT ticker, YEAR(date) AS year,
 ROUND(AVG(`rsi (14 days)`), 2) AS average_rsi
FROM synthetic_stock_data
GROUP BY ticker,YEAR(date);






