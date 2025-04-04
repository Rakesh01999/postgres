## Postgres

### select.sql :
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

---------------------------
===========================

# date.sql :
# SQL Date and Time Operations

A comprehensive guide to working with dates, times, and timestamps in SQL with practical examples. This repository extends the SQL Students Database Tutorial with focused content on date and time manipulation in PostgreSQL.

## 📋 Table of Contents

- [Introduction](#introduction)
- [Database Configuration](#database-configuration)
- [Timestamp Types](#timestamp-types)
- [Current Date and Time](#current-date-and-time)
- [Date and Time Formatting](#date-and-time-formatting)
- [Date Arithmetic](#date-arithmetic)
- [Age Calculation](#age-calculation)
- [Date Component Extraction](#date-component-extraction)
- [Boolean Conversions](#boolean-conversions)
- [Example Queries](#example-queries)

## 📚 Introduction

Date and time manipulation is a crucial aspect of database operations. This guide demonstrates PostgreSQL's capabilities for handling temporal data, including timezone management, formatting, calculation, and extraction of components from dates.

## 🌐 Database Configuration

### Checking Current Timezone

Before working with dates and times, it's important to know your database's timezone configuration:

```sql
SHOW timezone;
```

## ⏰ Timestamp Types

PostgreSQL offers two main timestamp types:

- `TIMESTAMP without time zone` - Stores date and time without timezone information
- `TIMESTAMP with time zone` - Stores date and time with timezone information

### Creating a Table with Both Timestamp Types

```sql
CREATE Table timez (
    ts TIMESTAMP without time zone, 
    tsz TIMESTAMP with time zone
);
```

### Inserting Timestamp Data

```sql
INSERT INTO timez VALUES('2024-01-12 10:45:00', '2024-01-12 10:45:00');
```

### Viewing Timestamp Data

```sql
SELECT * FROM timez;
```

## 📅 Current Date and Time

PostgreSQL provides several functions to get the current date and time:

```sql
-- Current date and time with timezone
SELECT now();

-- Current date only
SELECT CURRENT_DATE;

-- Extract date from timestamp
SELECT now()::date;

-- Extract time from timestamp
SELECT now()::time;
```

## 🔤 Date and Time Formatting

The `to_char()` function allows formatting dates in various ways:

```sql
-- Format date as day/month/year
SELECT to_char(now(), 'dd/mm/yyyy');

-- Get month name (lowercase)
SELECT to_char(now(), 'month');

-- Get month name (uppercase)
SELECT to_char(now(), 'MONTH');

-- Get day name (uppercase)
SELECT to_char(now(), 'DDDD');

-- Get day name (lowercase)
SELECT to_char(now(), 'dddd');
```

## ➕ Date Arithmetic

PostgreSQL makes it easy to perform date arithmetic using the `INTERVAL` keyword:

```sql
-- Subtract one year from current date
SELECT CURRENT_DATE - INTERVAL '1 year';

-- Subtract one month from current date
SELECT CURRENT_DATE - INTERVAL '1 month';

-- Subtract one year and two months from current date
SELECT CURRENT_DATE - INTERVAL '1 year 2 month';
```

## 🧮 Age Calculation

The `age()` function calculates the difference between two dates:

```sql
-- Calculate age from birth date
SELECT age(CURRENT_DATE, '1996-07-29');
```

### Practical Application: Student Age Calculation

```sql
-- Calculate age of all students
SELECT *, age(CURRENT_DATE, dob) FROM students;
```

## 🔍 Date Component Extraction

The `extract()` function allows extraction of specific components from dates:

```sql
-- Extract day
SELECT extract(day from '2024-01-25'::date);

-- Extract month
SELECT extract(month from '2024-01-25'::date);

-- Extract year
SELECT extract(year from '2024-01-25'::date);
```

## 🔄 Boolean Conversions

PostgreSQL allows conversion of certain string values to boolean:

```sql
-- Convert string to boolean
SELECT 'n'::BOOLEAN;
```

## 📝 Example Queries

Here are some practical examples combining date operations:

1. **Find students born in a specific month:**
   ```sql
   SELECT * FROM students 
   WHERE extract(month from dob) = 7;
   ```

2. **Calculate average age by course:**
   ```sql
   SELECT course, AVG(extract(year from age(CURRENT_DATE, dob))) as average_age 
   FROM students 
   GROUP BY course 
   ORDER BY average_age DESC;
   ```

3. **Format students' birthdays nicely:**
   ```sql
   SELECT 
       first_name, 
       last_name, 
       to_char(dob, 'Month DD, YYYY') as birthday 
   FROM students;
   ```

4. **Find students who have birthdays next month:**
   ```sql
   SELECT * FROM students 
   WHERE extract(month from dob) = extract(month from CURRENT_DATE + INTERVAL '1 month');
   ```

--------------------
====================
# groupBy.sql:
# SQL Student Analysis

A collection of SQL queries for analyzing student demographic data with PostgreSQL, focusing on aggregation, grouping, and filtering techniques.

## 📋 Table of Contents

- [Overview](#overview)
- [Database Connection](#database-connection)
- [Queries Explained](#queries-explained)
  - [Basic Data Retrieval](#basic-data-retrieval)
  - [Country-based Analysis](#country-based-analysis)
  - [Filtered Aggregations with HAVING](#filtered-aggregations-with-having)
  - [Date-based Analysis](#date-based-analysis)
- [Usage](#usage)
- [Schema Information](#schema-information)

## 📚 Overview

This project contains SQL queries that demonstrate how to analyze student data using PostgreSQL's powerful aggregation and filtering capabilities. The queries progressively build in complexity, showing how to extract meaningful insights from demographic and geographical data.

## 🔌 Database Connection

The queries connect to a PostgreSQL database with the following connection string:
```
Active: 1743601378217@@127.0.0.1@5432@test_db@public
```

This indicates a connection to:
- Host: 127.0.0.1 (localhost)
- Port: 5432 (default PostgreSQL port)
- Database: test_db
- Schema: public

## 🧮 Queries Explained

### Basic Data Retrieval

```sql
-- Retrieve all student records
SELECT * FROM students;

-- Extract list of countries represented in the dataset
SELECT country FROM students;
```

### Country-based Analysis

```sql
-- Count students by country
SELECT country, count(*) FROM students
    GROUP BY country;

-- Calculate average age by country
SELECT country, count(*), avg(age) FROM students
    GROUP BY country;
```

### Filtered Aggregations with HAVING

```sql
-- Filter groups using HAVING to show only countries with average age above 20
SELECT country, count(*), avg(age) FROM students
    GROUP BY country
        HAVING avg(age) > 20;

-- Filter groups using HAVING with more precise threshold (20.97)
SELECT country, count(*), avg(age) FROM students
    GROUP BY country
        HAVING avg(age) > 20.97;
```

### Date-based Analysis

```sql
-- Count students born in each year
SELECT extract(year FROM dob) as birth_year
    FROM students
    GROUP BY birth_year;

-- Get count of students by birth year
SELECT extract(year FROM dob) as birth_year, count(*)
    FROM students
    GROUP BY birth_year;
```

## 🚀 Usage

To execute these queries:

1. Connect to your PostgreSQL database using a client like pgAdmin, DBeaver, or the command line
2. Copy and paste the desired query
3. Execute the query to view the results

## 🗄️ Schema Information

These queries work with a `students` table that appears to have at least the following columns:
- Various student attributes (implicitly retrieved with `SELECT *`)
- `country` (VARCHAR) - Student's country of origin
- `age` (INT) - Student's age
- `dob` (DATE) - Student's date of birth

This project builds upon concepts from the "SQL Students Database Tutorial" which provides a more comprehensive explanation of the database schema and operations.

