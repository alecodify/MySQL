-- Create the 'employees' table to store employee data
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT 
);

-- Insert sample data into 'employees' table
INSERT INTO employees (employee_id, first_name, last_name, department_id)
VALUES 
(1, 'Aisha', 'Ahmed', 101),
(2, 'Muhammad', 'Khan', 102),
(3, 'Fatima', 'Hassan', 101),
(4, 'Omar', 'Farooq', 103);

-- Create the 'departments' table to store department data
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Insert sample data into 'departments' table
INSERT INTO departments (department_id, department_name)
VALUES 
(101, 'HR'),
(102, 'Finance'),
(103, 'Marketing');

-- Create a view 
CREATE VIEW employee_department AS
SELECT employees.first_name, employees.last_name, departments.department_name
FROM employees
JOIN departments ON employees.department_id = departments.department_id;

-- Query the view to see the result
SELECT * FROM employee_department;

-- Modify the view to show the first name, last name, and department ID instead of department name
CREATE OR REPLACE VIEW employee_department AS
SELECT employees.first_name, employees.last_name, employees.department_id
FROM employees;

-- Drop the view if it exists, to clean up the database
DROP VIEW IF EXISTS employee_department;
