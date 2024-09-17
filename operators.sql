-- Creating the 'employees' table
CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    department_id INT,
    salary DECIMAL(10, 2),
    join_date DATE,
    is_active BOOLEAN
);

-- Creating the 'departments' table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- Inserting sample data into 'employees' table
INSERT INTO employees (first_name, last_name, department_id, salary, join_date, is_active) 
VALUES ('John', 'Doe', 1, 5000, '2022-01-15', TRUE),
       ('Jane', 'Smith', 2, 6000, '2023-03-22', TRUE),
       ('Alice', 'Johnson', 1, 4500, '2021-07-11', FALSE),
       ('Bob', 'Brown', 3, 5500, '2020-09-30', TRUE);

-- Inserting sample data into 'departments' table
INSERT INTO departments (department_id, department_name)
VALUES (1, 'Engineering'),
       (2, 'Human Resources'),
       (3, 'Sales');

-- comparison
SELECT * FROM employees WHERE salary > 5000;
SELECT * FROM employees WHERE department_id = 2;
SELECT * FROM employees WHERE department_id IN (1, 2);
SELECT * FROM employees WHERE join_date BETWEEN '2021-01-01' AND '2023-12-31';
SELECT * FROM employees WHERE first_name LIKE 'J%';

-- logical
SELECT * FROM employees WHERE salary > 5000 AND is_active = TRUE;
SELECT * FROM employees WHERE department_id = 1 OR salary > 5500;
SELECT * FROM employees WHERE NOT is_active AND join_date < '2022-01-01';

-- arithmetic
SELECT first_name, last_name, salary + 500 AS new_salary FROM employees;
SELECT first_name, last_name, salary * 0.10 AS tax FROM employees;
SELECT first_name, last_name, salary / 2 AS half_salary FROM employees;
SELECT first_name, last_name, salary % 1000 AS remainder FROM employees;

-- bitwise
SELECT emp_id, emp_id & department_id AS bitwise_and FROM employees;
SELECT emp_id, emp_id | department_id AS bitwise_or FROM employees;

-- set
SELECT first_name, last_name FROM employees WHERE salary > 5000
UNION
SELECT first_name, last_name FROM employees WHERE department_id = 1;
SELECT first_name, last_name FROM employees WHERE salary > 5000
UNION ALL
SELECT first_name, last_name FROM employees WHERE department_id = 1;

-- aggregate
SELECT COUNT(*) FROM employees;
SELECT SUM(salary) AS total_salary FROM employees;
SELECT AVG(salary) AS avg_salary FROM employees;
SELECT MIN(salary) AS min_salary, MAX(salary) AS max_salary FROM employees;

-- Concatenate 
SELECT first_name || ' ' || last_name AS full_name FROM employees;
SELECT * FROM employees WHERE first_name LIKE '%o%';

-- Join
SELECT e.first_name, e.last_name, d.department_name 
FROM employees e
JOIN departments d ON e.department_id = d.department_id;
