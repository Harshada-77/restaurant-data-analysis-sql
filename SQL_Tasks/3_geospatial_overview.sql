-- File: 03_geospatial_overview.sql
-- Purpose: Perform geospatial analysis using latitude, longitude, and location-based grouping
-- Tool: DB Browser for SQLite

-- -------------------------------------------------------------
-- 1. View restaurant locations with coordinates
-- -------------------------------------------------------------

SELECT 
  "Restaurant Name",
  "City",
  "Country Code",
  "Latitude",
  "Longitude"
FROM RESTAURANT
WHERE "Latitude" IS NOT NULL AND "Longitude" IS NOT NULL
LIMIT 20;

-- -------------------------------------------------------------
-- 2. Analyze restaurant count per city
-- -------------------------------------------------------------

SELECT "City", COUNT(*) AS total_restaurants
FROM RESTAURANT
GROUP BY "City"
ORDER BY total_restaurants DESC
LIMIT 10;

-- -------------------------------------------------------------
-- 3. Analyze restaurant count per country
-- -------------------------------------------------------------

SELECT "Country Code", COUNT(*) AS total_restaurants
FROM RESTAURANT
GROUP BY "Country Code"
ORDER BY total_restaurants DESC;

-- -------------------------------------------------------------
-- 4. Analyze correlation between location and rating
-- -------------------------------------------------------------

-- a) Average rating by City
SELECT "City", ROUND(AVG("Aggregate rating"), 2) AS avg_rating, COUNT(*) AS total_restaurants
FROM RESTAURANT
GROUP BY "City"
ORDER BY avg_rating DESC
LIMIT 10;

-- b) Average rating by Country
SELECT "Country Code", ROUND(AVG("Aggregate rating"), 2) AS avg_rating, COUNT(*) AS total_restaurants
FROM RESTAURANT
GROUP BY "Country Code"
ORDER BY avg_rating DESC;
