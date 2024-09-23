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
CREATE TABLE Employee1(
    Employeeid INT,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Date_submitted DATE,
    due_date DATE
);

-- Insert data into the table
INSERT INTO Employee1(Employeeid, Name, Department, Salary, Date_submitted, due_date)
VALUES (1, "Roopa", "Webex", 600000.986, "2024-09-12", "2024-09-06"),
       (2, "Manohar", "Logistics", 700000, "2024-09-14", "2024-09-14"),
       (3, "Santosh", "Operations", 900000, "2024-09-11", "2024-09-11"),
       (4, "Naresh", "Data analytics", 800000, "2024-09-04", "2024-09-03"),
       (5, "Mallika", "SRE", 500000, "2024-09-30", "2024-09-14"),
       (6, "Nagarjuna", "Webex", 550000, "2024-09-29", "2024-09-30");

-- Create table from other table (Subtable)
CREATE TABLE SubTable_employee AS
SELECT Employeeid, NAME
FROM Employee;

-- Drop tables
DROP TABLE Employee1;

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

-- Limit Clause
SELECT * FROM Employee
WHERE Salary > 600000
ORDER BY Salary DESC
LIMIT 2;

-- Limit with offset clause
-- The OFFSET keyword is utilized to indicate beginning rows from where to select rows.
-- OFFSET 2 means, the initial 2 rows are excluded or avoided. 
SELECT * FROM Employee
LIMIT 2 offset 4;

-- Select last
/* By sorting the data (it is mandatory to use the column ID or any column which is unique and sequentially 
 increasing with every record in the table.) */
SELECT Name AS last_name FROM Employee
ORDER BY Employeeid DESC
LIMIT 1;

-- select last by using Subquery and aggregate MAX()
SELECT Name as last_name FROM Employee
where Employeeid = (SELECT MAX(Employeeid) FROM Employee);

-- Select random 
SELECT * FROM Employee
ORDER BY RAND();
-- we can use limit clause to obtain a single row
SELECT * FROM Employee
ORDER BY RAND()
LIMIT 1;

-- SELECT IN with list of values
SELECT * FROM Employee
WHERE Employeeid IN (1, 3, 6);

-- SELECT DATE
-- Employees sumitted on date - "2024-09-11"
SELECT * FROM Employee1
WHERE Date_submitted = "2024-09-11";

-- Employees submitted after due date
SELECT * FROM Employee1
WHERE Date_submitted > due_date;

-- Employees submitted before due date  (submitted on time)
SELECT * FROM Employee1
WHERE Date_submitted <= due_date;

-- To view the description of the tables
DESCRIBE Employee;

-- Copy all rows and insert
INSERT INTO SubTable
SELECT * FROM Employee_details;

-- inserting specific columns using INSERT INTO SELECT
INSERT INTO SubTable(EmpID, Name)
SELECT EmpID, Name FROM Employee_details;

-- insert specific rows using INSERT INTO SELECT
INSERT INTO SubTable
SELECT * FROM Employee_details WHERE EmpID = 3;

-- Update statement
-- update single column
UPDATE Employee_details SET Name = "Manohar Reddy"
WHERE Name = "Manohar"

-- Update multiple columns
UPDATE Employee_details SET Name = "Manohar", Salary = 1000000
WHERE EmpID = 2;

-- Where clause
SELECT * FROM Employee_details
WHERE Name LIKE 'M%';

SELECT * FROM Employee_details
WHERE EmpID BETWEEN 1 AND 3;

SELECT * FROM Employee_details
WHERE EmpID IN (4,5);

-- not equal to operator <>
SELECT * FROM Employee_details
WHERE EmpID <> 4;




















