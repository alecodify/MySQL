-- Create the 'employees' table with various constraints
CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY, -- Primary Key & Auto Increment
    first_name VARCHAR(100) NOT NULL,      -- Not Null constraint
    last_name VARCHAR(100) NOT NULL,       -- Not Null constraint
    email VARCHAR(255) UNIQUE,             -- Unique constraint
    department_id INT,                     -- Foreign key reference
    salary DECIMAL(10, 2) CHECK (salary >= 0), -- Check constraint ensuring salary is non-negative
    join_date DATE,                        -- Add Date
    is_active BOOLEAN DEFAULT TRUE         -- Default constraint to set TRUE if not specified
);

-- Create the 'departments' table with foreign key reference
CREATE TABLE departments (
    department_id INT PRIMARY KEY,         -- Primary Key constraint
    department_name VARCHAR(100) NOT NULL  -- Not Null constraint
);

-- Add a foreign key constraint to reference the 'departments' table
ALTER TABLE employees
ADD CONSTRAINT fk_department
FOREIGN KEY (department_id) REFERENCES departments(department_id);

-- Inserting data into the 'departments' table
INSERT INTO departments (department_id, department_name) 
VALUES (1, 'Engineering'),
       (2, 'Human Resources'),
       (3, 'Sales');

-- Inserting data into the 'employees' table (using constraints)
INSERT INTO employees (first_name, last_name, email, department_id, salary, join_date)
VALUES ('John', 'Doe', 'john.doe@example.com', 1, 5000, '2024-06-10'),
       ('Jane', 'Smith', 'jane.smith@example.com', 2, 6000, DEFAULT),
       ('Alice', 'Johnson', 'alice.johnson@example.com', NULL, 4500, '2024-04-30');

-- Attempting to insert without specifying a NOT NULL column (fails)
INSERT INTO employees (last_name, email, department_id, salary) 
VALUES (NULL, 'example@example.com', 1, 4000); 

-- Inserting a duplicate email (fails due to UNIQUE constraint)
INSERT INTO employees (first_name, last_name, email, department_id, salary) 
VALUES ('Test', 'User', 'john.doe@example.com', 1, 4500); 

-- Inserting a negative salary (fails due to CHECK constraint)
INSERT INTO employees (first_name, last_name, email, department_id, salary) 
VALUES ('Negative', 'Salary', 'negative@example.com', 1, -500); 

-- Correct insertion that respects all constraints (success)
INSERT INTO employees (first_name, last_name, email, department_id, salary) 
VALUES ('Valid', 'Employee', 'valid@example.com', 3, 5500); 

-- Attempting to insert a non-existent department ID (fails due to FOREIGN KEY constraint)
INSERT INTO employees (first_name, last_name, email, department_id, salary) 
VALUES ('NonExistent', 'Department', 'no_dept@example.com', 99, 5000);