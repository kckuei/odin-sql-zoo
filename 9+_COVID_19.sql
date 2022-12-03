-- 1. The example uses a WHERE clause to show the cases in 'Italy' in March 2020.
-- Modify the query to show data from Spain
-- SELECT name, DAY(whn),
--  confirmed, deaths, recovered
--  FROM covid
-- WHERE name = 'Italy'
-- AND MONTH(whn) = 3 AND YEAR(whn) = 2020
-- ORDER BY whn

SELECT name, DAY(whn),
 confirmed, deaths, recovered
 FROM covid
WHERE name = 'Spain'
AND MONTH(whn) = 3 AND YEAR(whn) = 2020
ORDER BY whn

-- 2. The LAG function is used to show data from the preceding row or the table. 
-- When lining up rows the data is partitioned by country name and ordered by the data whn. 
-- That means that only data from Italy is considered.
-- Modify the query to show confirmed for the day before.
-- SELECT name, DAY(whn), confirmed,
--    LAG(whn, 1) OVER (PARTITION BY name ORDER BY whn)
--  FROM covid
-- WHERE name = 'Italy'
-- AND MONTH(whn) = 3 AND YEAR(whn) = 2020
-- ORDER BY whn

SELECT name, DAY(whn), confirmed,
   LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn)
 FROM covid
WHERE name = 'Italy'
AND MONTH(whn) = 3 AND YEAR(whn) = 2020
ORDER BY whn

-- 3. The number of confirmed case is cumulative - but we can use LAG to recover the number 
-- of new cases reported for each day.
-- Show the number of new cases for each day, for Italy, for March.

SELECT name, DAY(whn), confirmed-LAG(confirmed, 1) 
OVER (PARTITION BY name ORDER BY whn)
 FROM covid
WHERE name = 'Italy'
AND MONTH(whn) = 3 AND YEAR(whn) = 2020
ORDER BY whn

-- 4. The data gathered are necessarily estimates and are inaccurate. However by taking a longer time 
-- span we can mitigate some of the effects.
-- You can filter the data to view only Monday's figures WHERE WEEKDAY(whn) = 0.
-- Show the number of new cases in Italy for each week in 2020 - show Monday only.

SELECT name, DATE_FORMAT(whn,'%Y-%m-%d'), confirmed-LAG(confirmed, 1)
OVER (PARTITION BY name ORDER BY whn) 
 FROM covid
WHERE name = 'Italy'
AND WEEKDAY(whn) = 0 AND YEAR(whn) = 2020
ORDER BY whn

-- 5. You can JOIN a table using DATE arithmetic. This will give different results if data is missing.
-- Show the number of new cases in Italy for each week - show Monday only.
-- In the sample query we JOIN this week tw with last week lw using the DATE_ADD function.




-- 6. The query shown shows the number of confirmed cases together with the world ranking for cases.
-- United States has the highest number, Spain is number 2...
-- Notice that while Spain has the second highest confirmed cases, Italy has the second highest number of deaths due to the virus.
-- Include the ranking for the number of deaths in the table.


-- 7. The query shown includes a JOIN t the world table so we can access the total population of each country and calculate infection rates (in cases per 100,000).
-- Show the infect rate ranking for each country. Only include countries with a population of at least 10 million.



-- 8. For each country that has had at last 1000 new cases in a single day, show the date of the peak number of new cases.



-- covid(
-- name (Afghanistan), 
-- whn (Wed, 22 Jan 2020 00:00:00 GMT),
-- confirmed, deaths, recovered)