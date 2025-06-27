# SQL_Tasks – Restaurant Data Analysis (SQLite Version)

This folder contains modular SQL scripts that perform end-to-end data analysis on a restaurant dataset using SQLite.

---

## 📂 Files Overview

| File Name                     | Task Description                                                                 |
|------------------------------|----------------------------------------------------------------------------------|
| 1_data_exploration.sql       | Initial exploration: row/column counts, missing values, and rating distribution |
| 2_descriptive_statistics.sql | Summary statistics for numeric fields and distribution of categorical features   |
| 3_geospatial_overview.sql    | Location-based analysis: city/country-wise counts and correlation with ratings   |
| 4_booking_delivery_analysis.sql | Booking and delivery availability, and impact on ratings and cost              |
| 5_price_vs_rating.sql        | Analysis of price range categories and their relationship with ratings           |
| 6_feature_engineering.sql    | Creating new features like name/address length, and binary columns               |
| 7_rating_prediction.sql      | Predicting restaurant ratings using basic regression logic                       |
| 8_cuisine_preference.sql     | Identifying preferred cuisines based on rating and vote trends                  |

---

## 🚀 How to Access and Run SQL Scripts

You can run these scripts using:

### 🔹 DB Browser for SQLite (Recommended)
1. Download and install: https://github.com/sqlitebrowser/sqlitebrowser/releases
2. Open DB Browser → File → Open Database → Load the dataset SQLite DB
3. Navigate to the "Execute SQL" tab
4. Copy-paste any script from this folder and run it

### 🔹 Other SQL Interfaces
- You can also import the dataset into tools like DBeaver, SQLiteStudio, or SQLite CLI
- These scripts use standard SQL and are compatible with SQLite

---

## 🔑 Key SQL Concepts Used

This project applies a wide range of SQL operations, including:

- SELECT, WHERE, GROUP BY, ORDER BY, LIMIT  
- Aggregate functions: COUNT, SUM, AVG, MIN, MAX  
- CASE WHEN (for conditional grouping and classification)  
- UPDATE (for handling missing values)  
- JOIN (in advanced tasks like cuisine and delivery analysis)  
- Subqueries and nested SELECT  
- PRAGMA for schema inspection  
- Data type casting using CAST()  
- Basic median approximation using OFFSET + LIMIT

---

## 🛠️ Tools Used

- SQLite database engine (via DB Browser for SQLite)
- Dataset: Provided as CSV and imported into SQLite
- SQL (SQLite dialect)

---

## 📎 Dataset Overview

Contains information on thousands of restaurants across multiple countries:
- General info: Name, City, Country
- Food & Pricing: Cuisines, Average Cost, Votes, Ratings
- Location: Latitude, Longitude
- Service: Booking, Delivery, Price Range, Currency

---

## 👩‍💻 Author

Harshada Kiran Raut  
https://github.com/Harshada-77
