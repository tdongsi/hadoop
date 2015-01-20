-- Based on DDL scripts in https://github.com/tdongsi/databases/tree/master/sql/create
-- Drop the database if it exists
DROP DATABASE IF EXISTS college CASCADE;

-- Drop the tables if they already exists
--
-- Not required because of database drop
-- DROP TABLE IF EXISTS College;
-- DROP TABLE IF EXISTS Student;
-- DROP TABLE IF EXISTS Apply;

-- Create the database
CREATE DATABASE college;
USE college;

-- Create the schema for the tables
CREATE TABLE College ( 
cName STRING COMMENT 'College name', 
state STRING COMMENT 'State code', 
enrollment INT COMMENT 'Enrollment number' )
COMMENT 'List of colleges'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

CREATE TABLE Student ( 
sID INT COMMENT 'Student ID', 
sName STRING COMMENT 'Student name', 
GPA FLOAT COMMENT 'Student GPA', 
sizeHS INT COMMENT 'Size of student highschool')
COMMENT 'List of students';

CREATE TABLE Apply ( 
sID INT COMMENT 'Student ID', 
cName STRING COMMENT 'College name', 
major STRING COMMENT 'Major that student applies for', 
decision STRING COMMENT 'Application result, either Y or N' )
COMMENT 'List of applications';

-- Populate the tables
LOAD DATA INPATH '/user/cloudera/college/college.data' OVERWRITE INTO TABLE College;

