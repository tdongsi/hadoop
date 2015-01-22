-- Based on DDL scripts in https://github.com/tdongsi/databases/tree/master/sql/create
-- Drop the database if it exists
DROP DATABASE IF EXISTS rating CASCADE;

-- Drop the tables if they already exists: taken care by CASCADE

-- Create the database
CREATE DATABASE rating;
USE rating;

-- Create the schema for the tables
CREATE TABLE Movie (
mID INT comment 'Movie ID',
title STRING comment 'Movie title',
year INT comment 'Release year',
director STRING comment 'Director name'
)
COMMENT 'List of movies'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ', '
STORED AS TEXTFILE;

-- Populate the tables with data
LOAD DATA LOCAL INPATH './movie.data' OVERWRITE INTO TABLE Movie;

-- Show table
SELECT * FROM Movie;
