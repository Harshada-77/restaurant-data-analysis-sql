-- Title: Aggregate Rating Analysis and Prediction-Oriented Insights
-- Description:
-- This script analyzes features that may influence restaurant ratings and prepares a structured dataset 
-- suitable for further predictive analysis. It includes:
-- 1. Feature selection and transformation
-- 2. Group-wise analysis of target variable
-- 3. Dataset assembly for modeling-oriented workflows

-- 1. Preview selected features related to ratings
SELECT
    "Restaurant Name",
    "Aggregate rating" AS target_rating,
    "Price range",
    "Votes",
    "Has Table booking",
    "Has Online delivery"
FROM
    restaurant_data
LIMIT 10;

-- 2. Encode features and create a clean modeling-ready view
CREATE VIEW IF NOT EXISTS prediction_features AS
SELECT
    "Restaurant ID",
    "Aggregate rating" AS target_rating,
    "Price range",
    "Votes",
    CASE WHEN "Has Table booking" = 'Yes' THEN 1 ELSE 0 END AS table_booking_binary,
    CASE WHEN "Has Online delivery" = 'Yes' THEN 1 ELSE 0 END AS online_delivery_binary,
    LENGTH("Restaurant Name") AS name_length,
    LENGTH("Address") AS address_length
FROM
    restaurant_data
WHERE
    "Aggregate rating" IS NOT NULL;

-- 3. Preview data from the view
SELECT * FROM prediction_features LIMIT 15;

-- 4. Analyze average ratings by selected features
-- a) By price range
SELECT 
    "Price range", 
    ROUND(AVG(target_rating), 2) AS avg_rating
FROM 
    prediction_features
GROUP BY 
    "Price range"
ORDER BY 
    "Price range";

-- b) By table booking availability
SELECT 
    table_booking_binary,
    ROUND(AVG(target_rating), 2) AS avg_rating
FROM 
    prediction_features
GROUP BY 
    table_booking_binary;

-- c) By online delivery availability
SELECT 
    online_delivery_binary,
    ROUND(AVG(target_rating), 2) AS avg_rating
FROM 
    prediction_features
GROUP BY 
    online_delivery_binary;
