CREATE DATABASE workforce_db;
USE workforce_db;

CREATE TABLE employees (
    Emp_ID INT,
    Department VARCHAR(50),
    Location VARCHAR(50),
    Hire_Date DATE,
    Status VARCHAR(30),
    Base_Salary_USD DECIMAL(12,2),
    Weekly_Capacity_Hrs DECIMAL(6,2),
    Performance_Rating DECIMAL(3,2)
);

DESCRIBE employees;

USE workforce_db;

ALTER TABLE employees
MODIFY Emp_ID VARCHAR(20);

TRUNCATE TABLE employees;

SELECT COUNT(*) AS total_rows
FROM employees;

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE
'D:/WORK - MAIN/PROJECTS/DAKSH/DAKSH PowerBI Projects/Dynamic Workforce & Hiring Planning Simulator/Cleaned_Workforce_Dataset.csv'
INTO TABLE employees
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

SELECT COUNT(*) AS total_rows
FROM employees;

SELECT *
FROM employees
LIMIT 5;


SELECT COUNT(*) FROM employees;
SELECT COUNT(*) AS total_headcount
FROM employees;

SELECT COUNT(*) AS active_headcount
FROM employees
WHERE Status = 'Active';

SELECT
    Status,
    COUNT(*) AS employee_count
FROM employees
GROUP BY Status
ORDER BY employee_count DESC;

SELECT
    Department,
    COUNT(*) AS employee_count
FROM employees
GROUP BY Department
ORDER BY employee_count DESC;

SELECT
    Department,
    COUNT(*) AS active_employees
FROM employees
WHERE Status = 'Active'
GROUP BY Department
ORDER BY active_employees DESC;


SELECT
    Department,
    Location,
    COUNT(*) AS employee_count
FROM employees
WHERE Status = 'Active'
GROUP BY Department, Location
ORDER BY Department, employee_count DESC;

SELECT
    AVG(Base_Salary_USD) AS average_salary
FROM employees
WHERE Status = 'Active';

SELECT
    SUM(Base_Salary_USD) AS total_salary_cost
FROM employees
WHERE Status = 'Active';

SELECT
    Department,
    COUNT(*) AS active_employees,
    SUM(Base_Salary_USD) AS salary_cost
FROM employees
WHERE Status = 'Active'
GROUP BY Department
ORDER BY salary_cost DESC;


SELECT
    Department,
    AVG(Base_Salary_USD) AS average_salary
FROM employees
WHERE Status = 'Active'
GROUP BY Department
ORDER BY average_salary DESC;


SELECT
    SUM(Weekly_Capacity_Hrs) AS total_weekly_capacity
FROM employees
WHERE Status = 'Active';

SELECT
    Department,
    COUNT(*) AS active_employees,
    SUM(Weekly_Capacity_Hrs) AS weekly_capacity
FROM employees
WHERE Status = 'Active'
GROUP BY Department
ORDER BY weekly_capacity DESC;


SELECT
    Department,
    AVG(Weekly_Capacity_Hrs) AS avg_capacity_per_employee
FROM employees
WHERE Status = 'Active'
GROUP BY Department
ORDER BY avg_capacity_per_employee DESC;


SELECT
    Status,
    COUNT(*) AS employee_count
FROM employees
GROUP BY Status
ORDER BY employee_count DESC;

SELECT
    COUNT(*) AS total_employees,
    SUM(Status <> 'Active') AS inactive_employees,
    ROUND(SUM(Status <> 'Active') * 100.0 / COUNT(*), 2) AS inactive_pct
FROM employees;


SELECT
    Department,
    SUM(Weekly_Capacity_Hrs) AS available_hours,
    40000 AS required_hours,
    40000 - SUM(Weekly_Capacity_Hrs) AS staffing_gap_hours
FROM employees
WHERE Status = 'Active'
GROUP BY Department;

SELECT
    Department,
    SUM(Weekly_Capacity_Hrs) AS available_hours,
    40000 AS required_hours,
    GREATEST(
        CEIL((40000 - SUM(Weekly_Capacity_Hrs)) / 40),
        0
    ) AS employees_to_hire
FROM employees
WHERE Status = 'Active'
GROUP BY Department;

SELECT
    Department,
    COUNT(*) AS active_employees,
    SUM(Weekly_Capacity_Hrs) AS available_hours,
    40000 AS required_hours,
    GREATEST(40000 - SUM(Weekly_Capacity_Hrs), 0) AS gap_hours
FROM employees
WHERE Status = 'Active'
GROUP BY Department
ORDER BY gap_hours DESC;


CREATE VIEW department_workforce_summary AS
SELECT
    Department,
    COUNT(*) AS active_employees,
    SUM(Weekly_Capacity_Hrs) AS available_hours,
    SUM(Base_Salary_USD) AS salary_cost,
    40000 AS required_hours,
    GREATEST(40000 - SUM(Weekly_Capacity_Hrs), 0) AS hiring_gap_hours
FROM employees
WHERE Status = 'Active'
GROUP BY Department;

SELECT *
FROM department_workforce_summary;


SELECT
    Department,
    active_employees,
    available_hours,
    hiring_gap_hours
FROM department_workforce_summary
WHERE hiring_gap_hours > 0
ORDER BY hiring_gap_hours DESC;


SELECT
    Department,
    active_employees,
    hiring_gap_hours,
    CEIL(hiring_gap_hours / 40) AS employees_to_hire
FROM department_workforce_summary
WHERE hiring_gap_hours > 0
ORDER BY employees_to_hire DESC;


SELECT
    COUNT(*) AS total_employees,
    SUM(Status = 'Active') AS active_employees,
    SUM(Base_Salary_USD) AS total_salary_cost,
    SUM(Weekly_Capacity_Hrs) AS total_capacity
FROM employees;

CREATE OR REPLACE VIEW department_workforce_summary AS
SELECT
    Department,
    COUNT(*) AS active_employees,
    SUM(Weekly_Capacity_Hrs) AS available_hours,
    SUM(Base_Salary_USD) AS salary_cost,
    40000 AS required_hours,
    GREATEST(40000 - SUM(Weekly_Capacity_Hrs), 0) AS hiring_gap_hours,
    CEIL(GREATEST(40000 - SUM(Weekly_Capacity_Hrs), 0) / 40) AS employees_to_hire
FROM employees
WHERE Status = 'Active'
GROUP BY Department;