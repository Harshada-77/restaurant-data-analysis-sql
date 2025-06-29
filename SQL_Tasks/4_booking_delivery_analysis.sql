-- Title: Booking & Delivery Insights
-- Description:
-- This SQL script analyzes:
-- 1. Percentage of restaurants offering table booking
-- 2. Percentage offering online delivery
-- 3. Comparison of average ratings based on booking availability
-- 4. Delivery availability across different price ranges
-- Tool: DB Browser for SQLite
-- Table: restaurant_data

-- 1. Percentage of restaurants offering table booking
SELECT 
    ROUND(
        (SUM(CASE WHEN "Has Table booking" = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 
        2
    ) AS table_booking_percentage
FROM 
    restaurant_data;

-- 2. Percentage of restaurants offering online delivery
SELECT 
    ROUND(
        (SUM(CASE WHEN "Has Online delivery" = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 
        2
    ) AS online_delivery_percentage
FROM 
    restaurant_data;

-- 3. Average rating: With vs Without table booking
SELECT 
    "Has Table booking" AS table_booking,
    ROUND(AVG("Aggregate rating"), 2) AS avg_rating
FROM 
    restaurant_data
WHERE 
    "Aggregate rating" IS NOT NULL
GROUP BY 
    "Has Table booking";

-- 4. Online delivery availability across price ranges
SELECT 
    "Price range",
    "Has Online delivery",
    COUNT(*) AS count
FROM 
    restaurant_data
GROUP BY 
    "Price range", "Has Online delivery"
ORDER BY 
    "Price range";

