-- Create 'departments' table (One side of the relationship)
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)   
);

-- Insert some data into 'departments' table
INSERT INTO departments (department_id, department_name)
VALUES 
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Marketing');

-- Create 'employees' table (Many side of the relationship)
CREATE TABLE employees (
    employee_id INT PRIMARY KEY, 
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Insert some data into 'employees' table, assigning employees to departments
INSERT INTO employees (employee_id, first_name, last_name, department_id)
VALUES 
(1, 'Aisha', 'Ahmed', 1),   
(2, 'Muhammad', 'Khan', 2),
(3, 'Fatima', 'Hassan', 1),
(4, 'Omar', 'Farooq', 3);   

-- Query to show the departments and their employees
SELECT departments.department_name, employees.first_name, employees.last_name
FROM departments
JOIN employees ON departments.department_id = employees.department_id;
