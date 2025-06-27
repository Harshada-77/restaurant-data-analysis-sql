-- File: 01_data_exploration.sql
-- Purpose: Perform data exploration and preprocessing on restaurant dataset
-- Tool: DB Browser for SQLite

-- -------------------------------------------------------------
-- 1. Count the total number of rows and columns
-- -------------------------------------------------------------

SELECT 
  (SELECT COUNT(*) FROM RESTAURANT) AS total_rows,
  (SELECT COUNT(*) FROM pragma_table_info('RESTAURANT')) AS total_columns;

-- -------------------------------------------------------------
-- 2. Check for missing values in each column
-- -------------------------------------------------------------

SELECT 
  SUM(CASE WHEN "Restaurant ID" IS NULL THEN 1 ELSE 0 END) AS missing_restaurant_id,
  SUM(CASE WHEN "Restaurant Name" IS NULL THEN 1 ELSE 0 END) AS missing_name,
  SUM(CASE WHEN "Country Code" IS NULL THEN 1 ELSE 0 END) AS missing_country,
  SUM(CASE WHEN "City" IS NULL THEN 1 ELSE 0 END) AS missing_city,
  SUM(CASE WHEN "Address" IS NULL THEN 1 ELSE 0 END) AS missing_address,
  SUM(CASE WHEN "Cuisines" IS NULL THEN 1 ELSE 0 END) AS missing_cuisines,
  SUM(CASE WHEN "Average Cost for two" IS NULL THEN 1 ELSE 0 END) AS missing_cost,
  SUM(CASE WHEN "Aggregate rating" IS NULL THEN 1 ELSE 0 END) AS missing_rating,
  SUM(CASE WHEN "Votes" IS NULL THEN 1 ELSE 0 END) AS missing_votes
FROM RESTAURANT;

-- -------------------------------------------------------------
-- 3. Handle missing values for selected columns
-- -------------------------------------------------------------

UPDATE RESTAURANT
SET "Address" = 'Not Available'
WHERE "Address" IS NULL;

UPDATE RESTAURANT
SET "Cuisines" = 'Not Specified'
WHERE "Cuisines" IS NULL;

-- Verify replacements
SELECT "Restaurant Name", "Address", "Cuisines"
FROM RESTAURANT
WHERE "Address" = 'Not Available' OR "Cuisines" = 'Not Specified';

-- -------------------------------------------------------------
-- 4. Analyze rating distribution (class imbalance)
-- -------------------------------------------------------------

SELECT 
  CASE 
    WHEN CAST("Aggregate rating" AS REAL) >= 4 THEN 'Excellent (4–5)'
    WHEN CAST("Aggregate rating" AS REAL) >= 3 THEN 'Good (3–3.9)'
    WHEN CAST("Aggregate rating" AS REAL) >= 2 THEN 'Average (2–2.9)'
    WHEN CAST("Aggregate rating" AS REAL) > 0 THEN 'Poor (0.1–1.9)'
    ELSE 'Not Rated (0)' 
  END AS rating_class,
  COUNT(*) AS count
FROM RESTAURANT
GROUP BY rating_class
ORDER BY count DESC;
