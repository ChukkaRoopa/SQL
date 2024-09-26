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

SELECT name, Department,SUM(Salary), COUNT(*) FROM Employee GROUP BY name, Department;

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

-- order by multiple coloumns (sort by salary and if having same salary, then sort by using name)
SELECT * FROM Employee
ORDER BY Salary DESC, Name ASC;

-- Order by column number instead of name (2 indicate, it sorted by column number 2)
SELECT * FROM Employee
ORDER BY 2;

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

-- offset 2 values and limit to 4
SELECT * FROM Employee
LIMIT 2,4;

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

-- null
SELECT * FROM Employee_details
WHERE Phone_Number IS NULL;

-- Union operator
-- only unique values from table 1 and table2
SELECT Name FROM Employee_details
UNION
SELECT Name FROM Employee;

-- duplicate values also
SELECT Name FROM Employee_details
UNION ALL
SELECT Name FROM Employee;

-- Union using where clause
SELECT Name FROM Employee_details
WHERE Name = "Roopa"
UNION ALL
SELECT Name FROM Employee
WHERE Name = "Manohar";

-- except clause not supported in mysql

-- All
SELECT * FROM Employee
WHERE Salary > ALL (SELECT Salary FROM Employee WHERE Department = 'Webex');

-- Any
SELECT * FROM Employee
where Salary = ANY (SELECT Salary FROM Employee WHERE Department = "Webex");

-- intersect statement (Return the rows common to both the select statements)
SELECT * FROM SubTable
INTERSECT
SELECT * FROM Employee_details;

-- Exists statement
SELECT Name FROM Employee_details
WHERE EXISTS (SELECT Name FROM Employee_details WHERE Employee_details.EmpID = 3);

-- Case Statement
SELECT Name, Salary, 
CASE
    WHEN Salary > 800000 THEN "Salary is high"
    WHEN Salary BETWEEN 600000 AND 800000 THEN "Salary is OK"
    ELSE "Salary is low"
END AS SalaryText
FROM Employee_details;

-- Case statement with order by clause
Select Name, Department
FROM Employee
ORDER BY
(CASE
    WHEN Department = 'Webex' THEN Department
    ELSE Name
END);

-- Aggregate functions
SELECT COUNT(*) AS Total_employees FROM Employee_details;
SELECT AVG(Salary) AS Avg_salary FROM Employee_details;
SELECT MIN(Salary) AS Min_salary FROM Employee_details;
SELECT MAX(Salary) AS Max_salary FROM Employee_details;
SELECT SUM(Salary) AS Total_salary FROM Employee_details;

-- Data Constraints
-- Not Null, unique, check, default, primary key, foreign key
-- primary key = Not null + unique
-- Forign key is a field or cloumn points to primary key of other table
CREATE TABLE Data_constaints(
    RollNo INT PRIMARY KEY,
    First_Name VARCHAR(50) DEFAULT "New Student",
    EmpID INT(4) UNIQUE,
    cid INT(2),
    FOREIGN KEY(cid) REFERENCES Programming(cid),
    Age INT(3) CHECK (Age >= 18),
    Department VARCHAR(50) NOT NULL
);

CREATE TABLE Programming(
    cid INT(2) PRIMARY KEY,
    Programming_lang VARCHAR(10)
);

DESCRIBE Data_constaints;

-- Joins
-- Join combines rows or data from 2 or more tables based on the common field between them

-- join operation or inner join are same. (create the result-set by combining all rows from both the tables)
Select ed.Employeeid, ed.name, ed.Department, ed.Salary, ed.Phone_Number, se.course
FROM Employee_details ed
JOIN SubTable_employee se 
ON ed.Employeeid = se.Employeeid;

Select ed.Employeeid, ed.name, ed.Department, ed.Salary, ed.Phone_Number, se.course
FROM Employee_details ed
INNER JOIN SubTable_employee se 
ON ed.Employeeid = se.Employeeid;

-- Left join
Select ed.Employeeid, ed.name, ed.Department, ed.Salary, ed.Phone_Number, se.course
FROM Employee_details ed
LEFT JOIN SubTable_employee se 
ON ed.Employeeid = se.Employeeid;

-- right join
Select ed.Employeeid, ed.name, ed.Department, ed.Salary, ed.Phone_Number, se.course
FROM Employee_details ed
RIGHT JOIN SubTable_employee se 
ON ed.Employeeid = se.Employeeid;

-- self join (a self join is a regular join that is used to join a table with itself)
CREATE TABLE selfjoin(
    employee_id INT PRIMARY KEY, 
    employee_name VARCHAR(50), 
    manager_id INT
);
INSERT INTO selfjoin (employee_id, employee_name, manager_id)
VALUES  (1, 'Zaid', 3),  
        (2, 'Rahul', 3),  
        (3, 'Raman', 4),  
        (4, 'Kamran', NULL),  
        (5, 'Farhan', 4);

SELECT e.employee_name, m.employee_name
FROM selfjoin e
JOIN selfjoin m
ON e.manager_id = m.employee_id;

-- cross join
-- CROSS JOIN returns a combination of each row in the left table paired with each row in the right table
SELECT * FROM Employee_details
CROSS JOIN SubTable_employee;

-- update joins
UPDATE Employee_details ed
INNER JOIN SubTable_employee se 
ON ed.Employeeid = se.Employeeid
SET ed.Department = se.course
WHERE ed.Employeeid IN (1,2);

-- delete joins
DELETE se
FROM SubTable_employee se
INNER JOIN Employee_details ed
ON ed.Employeeid = se.Employeeid
WHERE se.Employeeid = 1;

-- Date and time functions
-- NOW() - return current date and time
SELECT NOW();

-- CURDATE() - returns current date
SELECT CURDATE();

-- CURTIME() - returns current time
SELECT CURTIME();

-- Create table
Create table datetime_fun (
    id INT,
    name VARCHAR(10),
    Birthtime DATETIME(3)
);

INSERT INTO datetime_fun
values (1, "Roopa", "2001-06-30 16:23:15.891");

-- DATE()
SELECT name, DATE(Birthtime) FROM datetime_fun;

-- EXTRACT() - returns a single part of date/time
SELECT name, EXTRACT(DAY FROM Birthtime) FROM datetime_fun;

SELECT name, EXTRACT(MINUTE FROM Birthtime) FROM datetime_fun;

SELECT name, EXTRACT(SECOND FROM Birthtime) FROM datetime_fun;

SELECT name, EXTRACT(MICROSECOND FROM Birthtime) FROM datetime_fun;

-- DATE_ADD() -  Adds a specified time interval to a date.
SELECT name, DATE_ADD(Birthtime, INTERVAL 1 YEAR) FROM datetime_fun; 

SELECT name, DATE_ADD(Birthtime, INTERVAL 1 HOUR) FROM datetime_fun; 

-- DATE_SUB()
SELECT name, DATE_SUB(Birthtime, INTERVAL 1 YEAR) FROM datetime_fun; 

-- DATEDIFF() -  Returns the number of days between two dates. 
SELECT DATEDIFF('2001-06-30', '2002-06-30');

-- DATEFORMAT()
SELECT DATE_FORMAT('2001-06-30 16:23:15.891', '%Y-%m-%d %H:%i:%s');

SELECT DATE_FORMAT('2001-06-30', '%M %d, %Y')

-- Working with JSON in SQL

SET @jsonData = '{
"Information": 
  {"SchoolDetails": 
     [{"Name": "VidhyaMandhir"}, {"Name": "Chettinad"}, {"Name":"PSSenior"}]
  }
}';

SELECT JSON_VALID(@jsonData) AS VALIDJSON;
