USE end2end;

-- 1
-- find top 5 countries according life expectancy
SELECT Country, Life_expectancy
FROM life_expect
ORDER BY Life_expectancy DESC
LIMIT 5;


-- 2
-- find top 3 countries in europe
SELECT Country, Life_expectancy
FROM life_expect
WHERE Region LIKE "%EUROPE%"
ORDER BY Life_expectancy DESC
LIMIT 3;


-- 3
-- find top country per region
SELECT Region, Country, Life_expectancy
FROM life_expect
WHERE (Region, Life_expectancy) IN (
  SELECT Region, MAX(Life_expectancy)
  FROM life_expect
  GROUP BY Region
);


-- 4
-- find out what regions in europe exist
SELECT Region, COUNT(DISTINCT(Country)) nr_of_countries
FROM life_expect
WHERE Region LIKE "%europe%"
GROUP BY Region;


-- 5
-- where in europe is the life expectancy higher, in EU or outside?
SELECT Region, AVG(Life_expectancy) AS average_life_expectancy
FROM life_expect
WHERE Region LIKE "%europe%"
GROUP BY Region;


-- 6
-- whats the region of the world with the highest life expectancy?
SELECT Region, AVG(Life_expectancy) AS average_life_expectancy
FROM life_expect
GROUP BY Region
ORDER BY average_life_expectancy DESC
LIMIT 1;


-- 7
-- show top 10 and their alcohol consumption
SELECT Country, ROUND(Life_expectancy, 0) AS Life_expectancy, ROUND(Alcohol_consumption, 0) AS Alcohol_consumption
FROM life_expect
ORDER BY Life_expectancy DESC
LIMIT 10;


-- 8
-- show 5 countries with the highest BMI and their alcohol consupmption
SELECT Country, ROUND(BMI, 0) AS BMI, ROUND(Alcohol_consumption, 0) AS Alcohol_consumption
FROM life_expect
ORDER BY BMI DESC
LIMIT 5;


-- 9
-- show top 10 countries per GDP and their schooling duration
SELECT Country, ROUND(GDP_per_capita, 0) GDP, ROUND(Schooling, 0) Schooling
FROM life_expect
ORDER BY GDP_per_capita DESC
LIMIT 10;


-- 10
-- which 5 asian countries with economy status developed have the highest population?
SELECT Country, Population_mln
FROM life_expect
WHERE Economy_status = 0 AND Region = "Asia"
ORDER BY Population_mln DESC
LIMIT 5;
