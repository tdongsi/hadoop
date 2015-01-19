/* Based on DDL scripts in https://github.com/tdongsi/databases/tree/master/sql/create */
/* Drop the database if it exists */
DROP DATABASE IF EXISTS college CASCADE;

/* Drop the tables if they already exists */
/*
-- Not required because of database drop
DROP TABLE IF EXISTS College;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Apply;
*/

/* Create the database */
CREATE DATABASE college;
USE college;

/* Create the schema for the tables */
CREATE TABLE College( cName STRING, state STRING, enrollment INT )
COMMENT 'List of colleges';

CREATE TABLE Student( sID INT, sName STRING, GPA FLOAT, sizeHS INT )
COMMENT 'List of students';

CREATE TABLE Apply( sID INT, cName STRING, major STRING, decision STRING )
COMMENT 'List of applications';

/* Populate the tables */

