DROP DATABASE IF EXISTS company_db;

CREATE DATABASE company_db;
USE company_db;

CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(50),
    department_id VARCHAR(5),
    salary INT,
    PRIMARY KEY (emp_id)
);

INSERT INTO employees (emp_id, name, department_id, salary) VALUES
(101,'Abhishek','D01',62000),
(102,'Shubham','D01',58000),
(103,'Priya','D02',67000),
(104,'Rohit','D02',64000),
(105,'Neha','D03',72000),
(106,'Aman','D03',55000),
(107,'Ravi','D04',60000),
(108,'Sneha','D04',75000),
(109,'Kiran','D05',70000),
(110,'Tanuja','D05',65000);

CREATE TABLE departments (
    department_id VARCHAR(5),
    department_name VARCHAR(50),
    location VARCHAR(50),
    PRIMARY KEY (department_id)
);

INSERT INTO departments VALUES
('D01','Sales','Mumbai'),
('D02','Marketing','Delhi'),
('D03','Finance','Pune'),
('D04','HR','Bengaluru'),
('D05','IT','Hyderabad');

CREATE TABLE sales (
    sale_id INT,
    emp_id INT,
    sale_amount INT,
    sale_date DATE,
    PRIMARY KEY (sale_id)
);

INSERT INTO sales VALUES
(201,101,4500,'2025-01-05'),
(202,102,7800,'2025-01-10'),
(203,103,6700,'2025-01-14'),
(204,104,12000,'2025-01-20'),
(205,105,9800,'2025-02-02'),
(206,106,10500,'2025-02-05'),
(207,107,3200,'2025-02-09'),
(208,108,5100,'2025-02-15'),
(209,109,3900,'2025-02-20'),
(210,110,7200,'2025-03-01');

ANSWER 1
SELECT name
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

ANSWER 2
SELECT *
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
    LIMIT 1
);

ANSWER 3
SELECT name
FROM employees
WHERE emp_id IN (SELECT emp_id FROM sales);

ANSWER 4
SELECT name
FROM employees
WHERE emp_id = (
    SELECT emp_id
    FROM sales
    WHERE sale_amount = (SELECT MAX(sale_amount) FROM sales)
);

ANSWER 5
SELECT name
FROM employees
WHERE salary > (
    SELECT salary FROM employees WHERE name = 'Shubham'
);

ANSWER 6
SELECT name
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM employees
    WHERE name = 'Abhishek'
);

ANSWER 7
SELECT DISTINCT department_name
FROM departments
WHERE department_id IN (
    SELECT department_id
    FROM employees
    WHERE salary > 60000
);

ANSWER 8
SELECT department_name
FROM departments
WHERE department_id = (
    SELECT department_id
    FROM employees
    WHERE emp_id = (
        SELECT emp_id FROM sales
        ORDER BY sale_amount DESC LIMIT 1
    )
);

ANSWER 9
SELECT name
FROM employees
WHERE emp_id IN (
    SELECT emp_id
    FROM sales
    WHERE sale_amount > (SELECT AVG(sale_amount) FROM sales)
);

ANSWER 10
SELECT SUM(sale_amount)
FROM sales
WHERE emp_id IN (
    SELECT emp_id
    FROM employees
    WHERE salary > (SELECT AVG(salary) FROM employees)
);

ANSWER 11
SELECT name
FROM employees
WHERE emp_id NOT IN (SELECT emp_id FROM sales);

ANSWER 12
SELECT department_id
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 55000;

ANSWER 13
SELECT DISTINCT department_name
FROM departments
WHERE department_id IN (
    SELECT department_id
    FROM employees
    WHERE emp_id IN (
        SELECT emp_id
        FROM sales
        GROUP BY emp_id
        HAVING SUM(sale_amount) > 10000
    )
);

ANSWER 14
SELECT name
FROM employees
WHERE emp_id = (
    SELECT emp_id
    FROM sales
    WHERE sale_amount < (SELECT MAX(sale_amount) FROM sales)
    ORDER BY sale_amount DESC
    LIMIT 1
);

ANSWER 15
SELECT name
FROM employees
WHERE salary > (SELECT MAX(sale_amount) FROM sales);