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
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

CREATE TABLE Reviewer (
rID INT comment 'Reviewer ID',
name STRING comment 'Reviewer name'
)
COMMENT 'List of reviewers'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE;


CREATE TABLE Rating_Stage (
rID INT comment 'Movie ID',
mID INT comment 'Reviewer ID',
stars INT comment 'Rating',
ratingDate STRING comment 'Date of review'
)
COMMENT 'Staging table for ratings'
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "quoteChar"     = "'"
)
STORED AS TEXTFILE;

CREATE TABLE Rating (
rID INT comment 'Movie ID',
mID INT comment 'Reviewer ID',
stars INT comment 'Rating',
ratingDate BIGINT comment 'Date of review'
)
COMMENT 'List of ratings';

-- Populate the tables with data
LOAD DATA LOCAL INPATH './movie.data' OVERWRITE INTO TABLE Movie;
LOAD DATA LOCAL INPATH './reviewer.data' OVERWRITE INTO TABLE Reviewer;
LOAD DATA LOCAL INPATH './rating.data' OVERWRITE INTO TABLE Rating_Stage;

-- TODO: Fix the error
-- FROM Rating_Stage rs
-- INSERT OVERWRITE TABLE Rating
-- SELECT rs.rID, rs.mID, rs.stars, unix_timestamp(rs.ratingDate, 'yyyy-MM-dd');

-- Show tables
SELECT * FROM Movie;
SELECT * FROM Reviewer;
SELECT * FROM Rating_Stage;
-- SELECT * FROM Rating;
