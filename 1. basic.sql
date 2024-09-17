/* Commands that perform CURD operations */

-- see all the databases 
SHOW DATABASES;

-- Create and drop the database 
CREATE DATABASE UNIVERSITY;
DROP DATABASE UNIVERSITY;

-- use and the select the database 
USE TESTING;
SELECT DATABASE();

-- create the table 
CREATE TABLE BOOKS (
    name VARCHAR(50),
    ratings INT
);

SHOW TABLES;

SHOW COLUMNS FROM BOOKS;

DESC BOOKS;

-- drop/delete the table 
DROP TABLE BOOKS;

CREATE TABLE BOOKS (
    name VARCHAR(50) DEFAULT 'Anonymous',
    release_year INT DEFAULT 2024,
    ratings INT NOT NULL
);

DESC BOOKS;

-- Insert the values in the table 
INSERT INTO BOOKS (name, release_year, ratings) VALUES ('Math', 2010, 7), ('SCIENCE', 2011, 8);

-- see/read the data that stored in the table
SELECT name FROM BOOKS;
SELECT release_year FROM BOOKS;
SELECT ratings FROM BOOKS; 
SELECT name, release_year, ratings FROM BOOKS;
SELECT * FROM BOOKS;

CREATE TABLE USERS(
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    email VARCHAR(50),
    password VARCHAR(50)
);

INSERT INTO USERS(id, name, age, email, password)
VALUES
(1, 'John', 25, 'U3Qc2@example.com', 'password123'),
(2, 'Jane', 30, 'qGqQh@example.com', 'password456'),
(3, 'Bob', 35, 'I3l0h@example.com', 'password789');

SELECT * FROM USERS;
SELECT id AS SerialNo FROM USERS;

-- update the data with where clause/condition 
UPDATE USERS SET age = 30 WHERE id = 1

SELECT * FROM USERS;

-- delete the user by id 
DELETE FROM USERS WHERE id = 1

SELECT * FROM USERS;

DROP TABLE USERS;

SELECT * FROM USERS;