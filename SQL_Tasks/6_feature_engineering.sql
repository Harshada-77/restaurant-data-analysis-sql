-- Title: Feature Engineering on Restaurant Dataset
-- Description:
-- This SQL script performs feature extraction and transformation:
-- 1. Adds derived features like name length and address length
-- 2. Encodes Yes/No categorical fields as binary numeric columns
-- Tool: DB Browser for SQLite
-- Table: restaurant_data

-- 1. Extract length of restaurant name and address
SELECT 
    "Restaurant Name", 
    LENGTH("Restaurant Name") AS name_length,
    "Address", 
    LENGTH("Address") AS address_length
FROM 
    restaurant_data
LIMIT 10;

-- 2. Encode "Has Table booking" into binary (1 = Yes, 0 = No)
SELECT 
    "Restaurant Name",
    "Has Table booking",
    CASE 
        WHEN "Has Table booking" = 'Yes' THEN 1
        ELSE 0
    END AS table_booking_binary
FROM 
    restaurant_data
LIMIT 10;

-- 3. Encode "Has Online delivery" into binary (1 = Yes, 0 = No)
SELECT 
    "Restaurant Name",
    "Has Online delivery",
    CASE 
        WHEN "Has Online delivery" = 'Yes' THEN 1
        ELSE 0
    END AS online_delivery_binary
FROM 
    restaurant_data
LIMIT 10;
