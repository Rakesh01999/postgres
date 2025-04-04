## Postgres

# SQL Students Database Tutorial

A comprehensive tutorial and reference repository for learning SQL using a student database example. This repository contains SQL scripts that demonstrate essential database operations from basic queries to advanced data manipulation techniques.

## 📋 Table of Contents

- [Introduction](#introduction)
- [Database Schema](#database-schema)
- [Installation](#installation)
- [SQL Operations Covered](#sql-operations-covered)
  - [Basic Queries](#basic-queries)
  - [Sorting and Ordering](#sorting-and-ordering)
  - [Filtering Data](#filtering-data)
  - [Functions](#functions)
  - [Advanced Filtering](#advanced-filtering)
  - [Result Limiting and Pagination](#result-limiting-and-pagination)
  - [Data Modification](#data-modification)
- [Example Queries](#example-queries)

## 📚 Introduction

This repository serves as a practical guide to SQL using a realistic student database scenario. It's designed for SQL beginners and intermediate users who want to understand and practice common database operations. Each script is documented with comments explaining the purpose and functionality of the SQL commands.

## 🗄️ Database Schema

The database revolves around a single `students` table with the following structure:

```sql
CREATE TABLE students (
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
```

## 🔧 Installation

### Prerequisites
- PostgreSQL (recommended version 12 or higher)
- A PostgreSQL client (pgAdmin, DBeaver, or command line)

### Setup Instructions

1. **Install PostgreSQL** (skip if already installed):
   - [Download PostgreSQL](https://www.postgresql.org/download/)
   - Follow the installation instructions for your operating system

2. **Create a database**:
   ```sql
   CREATE DATABASE student_tutorial;
   ```

3. **Run the setup script**:
   - Open your PostgreSQL client
   - Connect to the student_tutorial database
   - Execute the `setup.sql` script in this repository

## 🧠 SQL Operations Covered

### Basic Queries

- Retrieving all data from a table
- Selecting specific columns
- Using column aliases
- Basic data exploration

```sql
-- Select all data
SELECT * FROM students;

-- Select specific columns
SELECT first_name, age FROM students;

-- Using aliases
SELECT email as "Student Email" FROM students;
```

### Sorting and Ordering

- Ascending and descending sorts
- Sorting by text, numbers, and dates
- Getting unique values with DISTINCT

```sql
-- Sort alphabetically
SELECT * FROM students ORDER BY first_name ASC;

-- Sort by age in descending order
SELECT * FROM students ORDER BY age DESC;

-- Get unique countries
SELECT DISTINCT country FROM students ORDER BY country ASC;
```

### Filtering Data

- Basic WHERE clause usage
- Multiple conditions with AND/OR
- Comparison operators
- Boolean logic and parentheses

```sql
-- Simple equality
SELECT * FROM students WHERE country = 'USA';

-- Multiple conditions
SELECT * FROM students 
WHERE grade = 'A' AND course = 'Physics';

-- Complex conditions
SELECT * FROM students 
WHERE (country = 'USA' OR country = 'Australia') AND age = 20;
```

### Functions

#### Scalar Functions
- UPPER() - Convert text to uppercase
- LOWER() - Convert text to lowercase
- CONCAT() - Join strings together
- LENGTH() - Get string length

```sql
SELECT upper(first_name) as first_name_in_upper_case, * FROM students;
SELECT concat(first_name, ' ', last_name) FROM students;
```

#### Aggregate Functions
- AVG() - Average of values
- SUM() - Sum of values
- COUNT() - Count rows
- MAX() - Maximum value
- MIN() - Minimum value

```sql
SELECT avg(age) FROM students;
SELECT count(*) FROM students;
```

### Advanced Filtering

- NULL value handling
- COALESCE for default values
- IN operator for multiple value matching
- BETWEEN for range queries
- LIKE/ILIKE for pattern matching

```sql
-- NULL handling
SELECT * FROM students WHERE email IS NULL;

-- Default values with COALESCE
SELECT COALESCE(email, 'Email Not Provided') as "Email" FROM students;

-- Multiple value matching
SELECT * FROM students WHERE country IN('USA','UK','Canada');

-- Range queries
SELECT * FROM students WHERE age BETWEEN 19 AND 22;

-- Pattern matching
SELECT * FROM students WHERE first_name LIKE 'A%';
```

### Result Limiting and Pagination

- LIMIT to restrict results
- OFFSET for pagination

```sql
-- Limit results
SELECT * FROM students LIMIT 5;

-- Pagination
SELECT * FROM students LIMIT 5 OFFSET 5;
```

### Data Modification

- DELETE operations with conditions
- UPDATE records

```sql
-- Delete with conditions
DELETE FROM students WHERE grade = 'B';

-- Update records
UPDATE students 
SET email = 'new_email@example.com', age = 21 
WHERE student_id = 1;
```

## 📝 Example Queries

Here are some practical examples of queries you can run:

1. **Find all students taking Computer Science:**
   ```sql
   SELECT * FROM students WHERE course = 'Computer Science';
   ```

2. **Calculate the average age by country:**
   ```sql
   SELECT country, AVG(age) as average_age 
   FROM students 
   GROUP BY country 
   ORDER BY average_age DESC;
   ```

3. **Find students with grade A and sort by age:**
   ```sql
   SELECT * FROM students 
   WHERE grade = 'A' 
   ORDER BY age ASC;
   ```

4. **Count number of students by course:**
   ```sql
   SELECT course, COUNT(*) as number_of_students 
   FROM students 
   GROUP BY course 
   ORDER BY number_of_students DESC;
   ```

