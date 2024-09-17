-- Create 'employees' table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    department_id INT
);

-- Create 'departments' table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

-- Insert data into 'employees' table
INSERT INTO employees (first_name, last_name, department_id)
VALUES ('John', 'Doe', 1),
       ('Jane', 'Smith', 2),
       ('Alice', 'Johnson', 1),
       ('Bob', 'Brown', 3);

-- Insert data into 'departments' table
INSERT INTO departments (department_id, department_name)
VALUES (1, 'Engineering'),
       (2, 'Human Resources'),
       (3, 'Sales'),
       (4, 'Marketing');

-- Inner join
SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
INNER JOIN departments ON employees.department_id = departments.department_id;

-- Left join 
SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
LEFT JOIN departments ON employees.department_id = departments.department_id;

-- Right join
SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
RIGHT JOIN departments ON employees.department_id = departments.department_id;

-- Full join
SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
LEFT JOIN departments ON employees.department_id = departments.department_id
UNION
SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
RIGHT JOIN departments ON employees.department_id = departments.department_id;


-- Cross join 
SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
CROSS JOIN departments;

-- Self join to find employees who share the same department
SELECT e1.first_name AS employee1, e2.first_name AS employee2, d.department_name
FROM employees e1
INNER JOIN employees e2 ON e1.department_id = e2.department_id
INNER JOIN departments d ON e1.department_id = d.department_id
WHERE e1.emp_id != e2.emp_id;
