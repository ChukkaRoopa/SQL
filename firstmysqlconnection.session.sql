-- create a database
CREATE DATABASE geeksforgeeks;

SHOW DATABASES;

USE geeksforgeeks

-- Drop database
DROP DATABASE geeksforgeeks;

-- drop database if exists (To avoid error while running the command)
DROP DATABASE IF EXISTS geeksforgeeks;

-- rename database (not supported for mysql)
RENAME DATABASE geeksforgeeks TO gfg;

-- create table
CREATE TABLE Employee(
    Employeeid INT,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

-- Insert data into the table
INSERT INTO Employee(Employeeid, Name, Department, Salary)
VALUES (1, "Roopa", "Webex", 600000.986),
       (2, "Manohar", "Logistics", 700000),
       (3, "Santosh", "Operations", 900000),
       (4, "Naresh", "Data analytics", 800000),
       (5, "Mallika", "SRE", 500000),
       (6, "Nagarjuna", "Webex", 550000);

-- Create table from other table (Subtable)
CREATE TABLE SubTable_employee AS
SELECT Employeeid, NAME
FROM Employee;

-- Drop tables
DROP TABLE Employee;

-- Delete Statement
-- Delete single record
DELETE FROM Employee 
WHERE Name = "Naresh";

-- Delete all the records
DELETE FROM Employee;

-- Alter or Rename 
-- change the name of the Employee table to Employee_details table
ALTER TABLE Employee
RENAME TO Employee_details;

-- change the name of the column Employeeid to EmpID
ALTER TABLE Employee_details
RENAME COlUMN Employeeid TO EmpID;

-- Add a new column
ALTER TABLE Employee_details
ADD COLUMN Phone_Number INT(10);

-- Truncate table (Data will be deleted but the structure remains for further operations.)
TRUNCATE TABLE Employee_details;

-- SQL query to copy, duplicate or backup table
-- with no data
CREATE TABLE SubTable AS
SELECT * FROM Employee_details
WHERE 1 != 1;

-- Select statement
-- fetch all the records
SELECT * FROM Employee;

-- retrieve wanted data
SELECT name,Employeeid  FROM Employee;

-- Select with where clause
SELECT name, Employeeid FROM Employee WHERE Employeeid >= 4;

-- Select with group by clause
SELECT name, Employeeid FROM Employee GROUP BY name, Employeeid;

-- Select with having clause
SELECT Department, SUM(Salary) 
FROM Employee 
GROUP BY Department 
HAVING SUM(Salary) > 600000;

-- Select with Order By
SELECT * FROM Employee
ORDER BY Salary DESC;

SELECT * FROM Employee
ORDER BY Salary ASC;



















