CREATE DATABASE company_db;

USE company_db;

CREATE TABLE employees (employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    hire_date DATE
);

DESCRIBE employees;

INSERT INTO employees
VALUES
(101, 'Amit', 'Sharma', 'HR', 50000, '2020-01-15'),
(102, 'Neha', 'Verma', 'IT', 60000, '2019-03-10'),
(103, 'Rahul', 'Singh', 'Finance', 55000, '2021-06-20');

SELECT * FROM employees;

ANSWER 2

DROP DATABASE IF EXISTS company_db;

CREATE DATABASE company_db;

USE company_db;

CREATE TABLE employees (
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    hire_date DATE
);

INSERT INTO employees (employee_id, first_name, last_name, department, salary, hire_date)
VALUES
(1, 'Amit', 'Sharma', 'HR', 50000, '2020-01-15'),
(2, 'Riya', 'Kapoor', 'Sales', 75000, '2019-03-22'),
(3, 'Raj', 'Mehta', 'IT', 90000, '2018-07-11'),
(4, 'Neha', 'Verma', 'IT', 85000, '2021-09-01'),
(5, 'Arjun', 'Singh', 'Finance', 60000, '2022-02-10');

SELECT * FROM employees;

ANSWER 3

USE company_db;

SHOW TABLES;

SELECT * 
FROM employees
ORDER BY salary ASC;

ANSWER 4

USE company_db;

SHOW TABLES;

SELECT * 
FROM employees
ORDER BY department ASC, salary DESC;


ANSWER 5

USE company_db;

SHOW TABLES;

SELECT * 
FROM employees
WHERE department = 'IT'
ORDER BY hire_date DESC;

ANSWER 6

CREATE DATABASE sales_db;

USE sales_db;

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    amount INT,
    sale_date DATE
);

INSERT INTO sales (sale_id, customer_name, amount, sale_date) VALUES
(1, 'Aditi', 1500, '2024-08-01'),
(2, 'Rohan', 2200, '2024-08-03'),
(3, 'Aditi', 3500, '2024-09-05'),
(4, 'Meena', 2700, '2024-09-15'),
(5, 'Rohan', 4500, '2024-09-25');

SELECT * FROM sales;

ANSWER 7

USE sales_db;

SHOW TABLES;

DESCRIBE sales;

SELECT * 
FROM sales;

SELECT * 
FROM sales
ORDER BY amount DESC;

ANSWER 8

SELECT * 
FROM sales
WHERE customer_name = 'Aditi';

ANSWER 9

Primary Key uniquely identifies each record in a table and cannot be NULL.
Foreign Key links one table to another table and refers to the Primary Key of another table.

ANSWER 10

Constraints are rules applied to table columns to ensure data accuracy and integrity.
Examples: PRIMARY KEY, NOT NULL, UNIQUE, FOREIGN KEY, CHECK.
