-- Title: Customer Preference Analysis – Cuisine Trends and Ratings
-- Description:
-- This script analyzes how different cuisines relate to customer ratings and preferences.
-- It covers:
-- 1. Rating trends by cuisine
-- 2. Cuisine popularity based on total votes
-- 3. High-rated cuisines

-- 1. Analyze average rating per cuisine
SELECT 
    "Cuisines",
    ROUND(AVG("Aggregate rating"), 2) AS avg_rating,
    COUNT(*) AS restaurant_count
FROM 
    restaurant_data
WHERE 
    "Cuisines" IS NOT NULL
GROUP BY 
    "Cuisines"
ORDER BY 
    avg_rating DESC
LIMIT 20;

-- 2. Most popular cuisines based on total votes
SELECT 
    "Cuisines",
    SUM("Votes") AS total_votes,
    COUNT(*) AS restaurant_count
FROM 
    restaurant_data
WHERE 
    "Cuisines" IS NOT NULL
GROUP BY 
    "Cuisines"
ORDER BY 
    total_votes DESC
LIMIT 20;

-- 3. Cuisines with highest average ratings and decent sample size
-- Filter to show only cuisines that appear at least 5 times
SELECT 
    "Cuisines",
    ROUND(AVG("Aggregate rating"), 2) AS avg_rating,
    COUNT(*) AS restaurant_count
FROM 
    restaurant_data
WHERE 
    "Cuisines" IS NOT NULL
GROUP BY 
    "Cuisines"
HAVING 
    restaurant_count >= 5
ORDER BY 
    avg_rating DESC
LIMIT 20;
