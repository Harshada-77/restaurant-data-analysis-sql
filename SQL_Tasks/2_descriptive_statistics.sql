-- File: 02_descriptive_statistics.sql
-- Purpose: Perform basic statistical and categorical analysis
-- Tool: DB Browser for SQLite

-- -------------------------------------------------------------
-- 1. Calculate basic statistical measures for numeric columns
-- -------------------------------------------------------------

SELECT 
  ROUND(AVG("Average Cost for two"), 2) AS avg_cost,
  MIN("Average Cost for two") AS min_cost,
  MAX("Average Cost for two") AS max_cost,
  
  ROUND(AVG("Votes"), 2) AS avg_votes,
  MIN("Votes") AS min_votes,
  MAX("Votes") AS max_votes,
  
  ROUND(AVG("Aggregate rating"), 2) AS avg_rating,
  MIN("Aggregate rating") AS min_rating,
  MAX("Aggregate rating") AS max_rating
FROM RESTAURANT;

-- Median of Average Cost for Two (approximate)
--Note: SQLite doesn’t have MEDIAN or STDDEV by default.
--If you want MEDIAN, run:

SELECT "Average Cost for two"
FROM RESTAURANT
ORDER BY "Average Cost for two"
LIMIT 1 OFFSET (SELECT COUNT(*) FROM RESTAURANT) / 2;

-- -------------------------------------------------------------
-- 2. Explore distribution of categorical variables
-- -------------------------------------------------------------

-- a) Country-wise restaurant count
SELECT "Country Code", COUNT(*) AS total_restaurants
FROM RESTAURANT
GROUP BY "Country Code"
ORDER BY total_restaurants DESC;

-- b) City-wise restaurant count (top 10)
SELECT "City", COUNT(*) AS total_restaurants
FROM RESTAURANT
GROUP BY "City"
ORDER BY total_restaurants DESC
LIMIT 10;

-- c) Cuisine-wise distribution (top 10)
SELECT "Cuisines", COUNT(*) AS total
FROM RESTAURANT
GROUP BY "Cuisines"
ORDER BY total DESC
LIMIT 10;
