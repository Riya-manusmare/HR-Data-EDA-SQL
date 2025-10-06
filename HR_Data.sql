CREATE DATABASE hrdata;
USE hrdata;

-- upload csv file as table employees
SELECT * FROM EMPLOYEES;        

-- Total Employees
SELECT COUNT(*) ASTotal_Employees
FROM Employees;

-- total old employees
SELECT COUNT(*) AS Total_Old_Employees
FROM employees
WHERE DateofTermination!='';

-- Total Current Employees
SELECT COUNT(*) AS Total_Old_Employees
FROM employees
WHERE DateofTermination='';

-- Average Salary
SELECT AVG(salary) AS Avg_Salary
FROM employees;

-- Average Age
SELECT AVG(TIMESTAMPDIFF(YEAR,STR_TO_DATE(DOB,'%d-%m-%Y'),CURDATE())) AS Avg_Age
FROM employees;

-- AVG years in company
SELECT AVG(TIMESTAMPDIFF(YEAR,STR_TO_DATE(DateofHire,'%d-%m-%Y'),CURDATE())) AS Avg_years_in_company
FROM employees;

-- Adding new column fro employees current status
ALTER TABLE employees
ADD EmployeeCurrentStatus INT;

-- Updating values for new column
SET SQL_SAFE_UPDATES=0;
UPDATE employees
SET EmployeeCurrentStatus=CASE
    WHEN DateofTermination=''THEN 1
    ELSE 0
END;

-- Calculate atrrition Rate based on custom EmpStatusID values
SELECT (CAST(COUNT(CASE WHEN EmployeeCurrentStatus=0 THEN 1 END)AS FLOAT)/COUNT(*))* 100 AS Attrition_Rate
FROM Employees;

-- get columns names and datatypes
DESCRIBE employees;
-- or
-- SHOW COLUMNS FROM EMPLOYEEES;

-- Print 1st 5 Rows
SELECT * FROM Employees
LIMIT 5;

-- PRINT Last 5 rows
SELECT * FROM employees
ORDER BY EmpID DESC
limit 5;

-- changing data types of salary
ALTER TABLE employees
MODIFY COLUMN Salary DECIMAL(10,2);

-- Convert all date columns in proper dates
UPDATE employees
SET DOB=STR_TO_DATE(DOB,'%d-%m-%Y');
UPDATE employees
SET DateofHire=STR_TO_DATE(DateofHire,'%d-%m-%Y');
UPDATE employees
SET LastPerformanceReview_Date=STR_TO_DATE(LastPerformanceReview_Date,'%d-%m-%Y');

-- Alter Table
ALTER TABLE employees
MODIFY COLUMN DOB DATE,
MODIFY COLUMN DateofHire DATE,
MODIFY COLUMN LastPerformanceReview_Date DATE;

-- Read columns to check changes
SELECT DOB,DateofHire,LastPerformanceReview_Date FROM employees;

DESCRIBE employees;

-- Full Empty Values IN Date Of Termination
UPDATE employees
SET DateofTermination='CurrentlyWorking'
WHERE DateofTermination IS NULL OR DateofTermination='';

-- count of each unique value in the maritalDesc
SELECT MaritalDesc,COUNT(*) AS Count
FROM employees
GROUP BY MaritalDesc
ORDER BY Count DESC;

-- count of each unique value in the department
SELECT Department,COUNT(*) AS Count
FROM employees
GROUP BY Department
ORDER BY Count DESC;

-- count of each unique value in the position
SELECT position,COUNT(*) AS Count
FROM employees
GROUP BY position
ORDER BY Count DESC;

-- count of each unique values in the manager
SELECT managername,COUNT(*) AS Count
FROM employees
GROUP BY managername
ORDER BY Count DESC;

-- SALARY DISTRIBUTION BY EMPLOYEES
SELECT 
CASE
WHEN Salary<30000 THEN'<30K'
WHEN Salary BETWEEN 30000 AND 49999 THEN '30K-49K'
WHEN Salary BETWEEN 50000 AND 69999 THEN '50K-69K'
WHEN Salary BETWEEN 70000 AND 89999 THEN '70K-89K'
WHEN Salary>=90000 THEN '90K and above'
END AS Salary_Range,
COUNT(*) AS Frequency
FROM employees GROUP BY Salary_Range ORDER BY Salary_Range;

SELECT 
     performanceScore,
     COUNT(*) AS Count
FROM employees
GROUP BY PerformanceScore
ORDER BY PerformanceScore;

SELECT 
     department,
     AVG(Salary) AS AverageSalary
FROM employees
GROUP BY department
ORDER BY department;

-- count termination by cause
SELECT 
     TermReason,
COUNT(*) AS Count
FROM employees
WHERE TermReason IS NOT NULL
GROUP BY TermReason
ORDER BY Count DESC;

-- employee count of state
SELECT 
    State,
	COUNT(*) AS Count
FROM Employees
GROUP BY State
ORDER BY  Count DESC;

-- GENDER DISTRIBUTION
SELECT 
    Gender,
	COUNT(*) AS Count
FROM Employees
GROUP BY Gender
ORDER BY  Count DESC;

-- ADD a new column age
ALTER TABLE employees
ADD COLUMN Age INT;

-- Update the Age column with calculated age
UPDATE employees
SET Age=TIMESTAMPDIFF(YEAR,DOB,CURDATE());

-- Age Distribution
SELECT 
CASE
WHEN Age<20 THEN'<20'
WHEN Age BETWEEN 20 AND 29 THEN '20-29'
WHEN Age BETWEEN 30 AND 39 THEN '30-39'
WHEN Age BETWEEN 40 AND 49 THEN '40-49'
WHEN Age BETWEEN 50 AND 59 THEN '50-59'
WHEN Age>=60 THEN '60 and above'
END AS Age_Group,
Count(*) AS count
FROM employees
GROUP BY Age_group;