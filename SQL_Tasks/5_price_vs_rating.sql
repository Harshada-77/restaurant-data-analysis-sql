-- Title: Price Range and Rating Analysis
-- Description:
-- This SQL script explores how restaurant pricing relates to customer ratings.
-- 1. Find the most common price range
-- 2. Calculate average rating per price range
-- 3. Identify the rating color for the highest-rated price range
-- Tool: DB Browser for SQLite
-- Table: restaurant_data

-- 1. Most common price range
SELECT 
    "Price range", 
    COUNT(*) AS count
FROM 
    restaurant_data
GROUP BY 
    "Price range"
ORDER BY 
    count DESC
LIMIT 1;

-- 2. Average rating per price range
SELECT 
    "Price range", 
    ROUND(AVG("Aggregate rating"), 2) AS avg_rating
FROM 
    restaurant_data
WHERE 
    "Aggregate rating" IS NOT NULL
GROUP BY 
    "Price range"
ORDER BY 
    "Price range";

-- 3. Rating color for price range with highest avg rating
WITH avg_ratings AS (
    SELECT 
        "Price range", 
        ROUND(AVG("Aggregate rating"), 2) AS avg_rating,
        MAX("Rating color") AS rating_color  -- assuming each price range has 1 dominant color
    FROM 
        restaurant_data
    GROUP BY 
        "Price range"
)
SELECT 
    "Price range", 
    avg_rating, 
    rating_color
FROM 
    avg_ratings
ORDER BY 
    avg_rating DESC
LIMIT 1;
