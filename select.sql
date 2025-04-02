CREATE TABLE students(
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INT,
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50)
);

SELECT * FROM students;

INSERT INTO students (first_name, last_name, age, grade, course, email, dob, blood_group, country)
VALUES 
('John', 'Doe', 20, 'A', 'Computer Science', 'john.doe@example.com', '2004-05-14', 'O+', 'USA'),
('Alice', 'Smith', 22, 'B', 'Mathematics', 'alice.smith@example.com', '2002-11-23', 'A-', 'Canada'),
('Bob', 'Johnson', 21, 'C', 'Physics', 'bob.johnson@example.com', '2003-07-19', 'B+', 'UK'),
('Emma', 'Brown', 23, 'A', 'Chemistry', 'emma.brown@example.com', '2001-03-08', 'AB-', 'Australia'),
('David', 'Wilson', 20, 'B', 'Engineering', 'david.wilson@example.com', '2004-09-25', 'O-', 'Germany'),
('Sophia', 'Taylor', 19, 'A', 'Biology', 'sophia.taylor@example.com', '2005-06-11', 'A+', 'France'),
('Liam', 'Martinez', 24, 'B', 'Economics', 'liam.martinez@example.com', '2000-12-29', 'B-', 'Spain'),
('Olivia', 'Anderson', 22, 'C', 'History', 'olivia.anderson@example.com', '2002-08-17', 'O+', 'Italy'),
('Noah', 'Thomas', 21, 'A', 'Political Science', 'noah.thomas@example.com', '2003-02-14', 'AB+', 'Netherlands'),
('Isabella', 'Moore', 23, 'B', 'Psychology', 'isabella.moore@example.com', '2001-05-22', 'O-', 'Brazil'),
('Ethan', 'Harris', 20, 'C', 'Mechanical Engineering', 'ethan.harris@example.com', '2004-07-30', 'A-', 'Japan'),
('Mia', 'Clark', 22, 'A', 'Sociology', 'mia.clark@example.com', '2002-04-03', 'B+', 'India'),
('James', 'Lewis', 19, 'B', 'Business Administration', 'james.lewis@example.com', '2005-11-09', 'O+', 'Mexico'),
('Charlotte', 'Walker', 21, 'C', 'Computer Engineering', 'charlotte.walker@example.com', '2003-06-27', 'AB-', 'South Korea'),
('Benjamin', 'Young', 23, 'A', 'Philosophy', 'benjamin.young@example.com', '2001-09-18', 'O+', 'Russia');


SELECT first_name, age FROM students;

SELECT email FROM students;

SELECT email as "Student Email" FROM students;

SELECT * FROM students ORDER BY first_name ASC;

SELECT * FROM students ORDER BY first_name DESC;

SELECT * FROM students ORDER BY age DESC;

SELECT * FROM students ORDER BY age ASC;

SELECT * FROM students ORDER BY dob ASC;

