-- Creating the 'sales' table with columns for product details and sales date
CREATE TABLE sales (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    product VARCHAR(255), 
    price DECIMAL(10, 2), 
    quantity INT, 
    sale_date DATE 
);

-- Inserting some sample sales records into the 'sales' table
INSERT INTO sales (product, price, quantity, sale_date) 
VALUES ('Laptop', 1500.00, 2, '2024-08-01'),
       ('Headphones', 100.50, 5, '2024-08-02'),
       ('Smartphone', 800.99, 3, '2024-08-03');

-- Calculating the total sales by multiplying price by quantity for all records
SELECT SUM(price * quantity) AS total_sales FROM sales;

-- Converting product names to uppercase
SELECT UPPER(product) FROM sales;

-- Extracting the year from the sale_date
SELECT YEAR(sale_date) AS sale_year FROM sales;

-- Calculating the total cost for each product (price * quantity) and rounding to 2 decimal places
SELECT product, ROUND(price * quantity, 2) AS total_cost FROM sales;


-- Creating the 'users' table with user details and constraints
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT, 
    first_name VARCHAR(255) NOT NULL, 
    last_name VARCHAR(255) NOT NULL, 
    email VARCHAR(255) UNIQUE NOT NULL, 
    password VARCHAR(255) NOT NULL, 
    age INT 
);

-- Inserting some sample user records into the 'users' table
INSERT INTO users (first_name, last_name, email, password, age)
VALUES
('Aisha', 'Ahmed', 'aisha@example.com', 'password4', 10),
('Muhammad', 'Khan', 'muhammad@example.com', 'password5', 20),
('Fatima', 'Hassan', 'fatima@example.com', 'password6', 35),
('Omar', 'Farooq', 'omar@example.com', 'password7', 30),
('Zainab', 'Malik', 'zainab@example.com', 'password8', 35),
('Ali', 'Shaikh', 'ali@example.com', 'password9', 35),
('Sana', 'Khalid', 'sana@example.com', 'password10', 40),
('Bilal', 'Raza', 'bilal@example.com', 'password11', 42),
('Amina', 'Siddiqui', 'amina@example.com', 'password12', 45),
('Yusuf', 'Qureshi', 'yusuf@example.com', 'password13', 50),
('Hafsa', 'Butt', 'hafsa@example.com', 'password14', 60),
('Ibrahim', 'Chaudhry', 'ibrahim@example.com', 'password15', 70),
('Maryam', 'Hussain', 'maryam@example.com', 'password16', 80),
('Ahmad', 'Nawaz', 'ahmad@example.com', 'password17', 15),
('Aaliyah', 'Javed', 'aaliyah@example.com', 'password18', 18),
('Zaid', 'Ansari', 'zaid@example.com', 'password19', 22),
('Hina', 'Tariq', 'hina@example.com', 'password20', 24),
('Noor', 'Abbasi', 'noor@example.com', 'password21', 21),
('Salman', 'Usman', 'salman@example.com', 'password22', 34),
('Khadija', 'Iqbal', 'khadija@example.com', 'password23', 31);

-- Extracting a substring from a string, starting at position 7 for 5 characters
SELECT SUBSTRING("Hello World", 7, 5);

-- Extracting a substring starting from the 3rd character of the string "ALIRAZA"
SELECT SUBSTRING("ALIRAZA", 3);

-- Extracting a substring of first names from position 2 for all users
SELECT SUBSTRING(first_name, 2) FROM users;

-- Extracting a substring starting from the 2nd character for 6 characters from the first names
SELECT SUBSTRING(first_name, 2, 6) FROM users;

-- Extracting the first 7 characters from the first names
SELECT SUBSTRING(first_name, 1, 7) FROM users;

-- Replacing "HELLO" with "BYE" in the string "HELLO WORLD"
SELECT REPLACE("HELLO WORLD", "HELLO", "BYE");

-- Reversing the string "Hello World"
SELECT REVERSE('Hello World');

-- Reversing the first names of all users
SELECT REVERSE(first_name) FROM users;

-- Reversing the passwords of all users
SELECT REVERSE(password) FROM users;

-- Getting the character length of the string "Hello World"
SELECT CHAR_LENGTH('Hello World');

-- Getting the character length of each user's first name
SELECT CHAR_LENGTH(first_name) FROM users;

-- Getting the byte length of the string "Hello World"
SELECT LENGTH('Hello World');

-- Getting the byte length of each user's first name
SELECT LENGTH(first_name) FROM users;

-- Sorting users first names in ascending order
SELECT first_name FROM users ORDER BY first_name ASC;

-- Sorting users first names in descending order
SELECT first_name FROM users ORDER BY first_name DESC;

-- Sorting users first names by their length
SELECT first_name FROM users ORDER BY LENGTH(first_name);

-- Selecting the first 5 users
SELECT first_name FROM users LIMIT 5;

-- Selecting the first 2 users
SELECT first_name FROM users LIMIT 2;

-- Counting the total number of users
SELECT COUNT(*) FROM users;

-- Counting the number of non-null first names
SELECT COUNT(first_name) FROM users;

-- Counting the number of users whose first name is "Ali"
SELECT COUNT(*) FROM users WHERE first_name = "Ali";

-- Getting the minimum age of all users
SELECT MIN(age) FROM users;

-- Getting the maximum age of all users
SELECT MAX(age) FROM users;

-- Getting the average age of all users
SELECT AVG(age) FROM users;

-- Getting the sum of all users' ages
SELECT SUM(age) FROM users;

-- Grouping users by their first names and calculating the average age for each group
SELECT first_name, AVG(age) AS average_age FROM users GROUP BY first_name;
