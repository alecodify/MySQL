-- Create 'employees' table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),  
    last_name VARCHAR(50)  
);

-- Create 'projects' table
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100)
);

-- Create 'employee_projects' table (junction table to establish many-to-many relationship)
CREATE TABLE employee_projects (
    employee_id INT, 
    project_id INT, 
    PRIMARY KEY (employee_id, project_id), 
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)     
);

-- Insert data into 'employees' table
INSERT INTO employees (employee_id, first_name, last_name)
VALUES
(1, 'Aisha', 'Ahmed'),
(2, 'Muhammad', 'Khan'),
(3, 'Fatima', 'Hassan'),
(4, 'Omar', 'Farooq');

-- Insert data into 'projects' table
INSERT INTO projects (project_id, project_name)
VALUES
(101, 'Project A'),
(102, 'Project B'),
(103, 'Project C');

-- Insert data into 'employee_projects' table
-- Associating employees with projects
INSERT INTO employee_projects (employee_id, project_id)
VALUES
(1, 101),
(1, 102),
(2, 102),
(3, 101),
(3, 103),
(4, 103);

-- Query to get the projects each employee is working on
SELECT employees.first_name, employees.last_name, projects.project_name
FROM employees
JOIN employee_projects ON employees.employee_id = employee_projects.employee_id
JOIN projects ON employee_projects.project_id = projects.project_id;

-- Query to get the employees working on a specific project
SELECT projects.project_name, employees.first_name, employees.last_name
FROM projects
JOIN employee_projects ON projects.project_id = employee_projects.project_id
JOIN employees ON employee_projects.employee_id = employees.employee_id;
