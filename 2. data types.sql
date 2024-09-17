-- Create event table
CREATE TABLE events (
    event_name VARCHAR(255),
    event_date DATE,        
    event_time TIME,        
    event_datetime DATETIME 
);

DESC events;

-- Insert sample records into the 'events' table
INSERT INTO events (event_name, event_date, event_time, event_datetime) 
VALUES ('Meeting', '2024-03-02', '14:30:00', '2024-03-02 14:30:00'),
       ('Presentation', '2024-03-03', '09:00:00', '2024-03-03 09:00:00'),
       ('Party', '2024-03-04', '20:00:00', '2024-03-04 20:00:00');


SELECT * FROM events;

-- Get current date, time, and datetime
SELECT CURRENT_DATE(); 
SELECT CURRENT_TIME(); 
SELECT NOW();       

-- Create comments table
CREATE TABLE comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    author VARCHAR(255),
    content VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Insert sample records into comments table
INSERT INTO comments (author, content) 
VALUES ('Ali', 'This is a great article!'),
       ('Hina', 'I have a question about this topic.'),
       ('Zafar', 'Thanks for sharing this information.');

-- Select all rows
SELECT * FROM comments;

-- Update specific rows based on conditions
UPDATE comments 
SET content="tf is going on here?" 
WHERE id=1;

UPDATE comments 
SET content="Never mind my query is resolved" 
WHERE id=2;

-- Select all rows to see data after updated
SELECT * FROM comments;
