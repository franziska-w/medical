-- Create database exampleDB and user nifi with privileges
CREATE DATABASE exampleDB;
CREATE USER 'nifi'@'localhost' IDENTIFIED BY '<password>';
GRANT ALL PRIVILEGES ON exampleDB . * TO 'nifi'@'localhost';

-- Create tables to load data from NiFi
USE exampleDB;
CREATE TABLE medication_ingredient (
     id NVARCHAR(255) NULL
    ,coding_system NVARCHAR(255) NULL
    ,coding_code NVARCHAR(255) NULL
    ,coding_display NVARCHAR(255) NULL
    ,numerator_value INT NULL
    ,numerator_system NVARCHAR(255) NULL
    ,numerator_code NVARCHAR(255) NULL
    ,denominator_value INT NULL
    ,denominator_system NVARCHAR(255) NULL
    ,denominator_code NVARCHAR(255) NULL
);
CREATE TABLE medicationrequest (
     id NVARCHAR(255) NULL
    ,Med_id NVARCHAR(255) NULL
    ,Med_code_system NVARCHAR(255) NULL
    ,Med_code_code NVARCHAR(255) NULL
    ,Med_code_display NVARCHAR(255) NULL
    ,status NVARCHAR(255) NULL
    ,authoredOn NVARCHAR(255) NULL
    ,subject_reference NVARCHAR(255) NULL
    ,subject_display NVARCHAR(255) NULL
);
