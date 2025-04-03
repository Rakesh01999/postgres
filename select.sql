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

SELECT * FROM students;

INSERT INTO
    students (
        first_name,
        last_name,
        age,
        grade,
        course,
        email,
        dob,
        blood_group,
        country
    )
VALUES (
        'John',
        'Doe',
        20,
        'A',
        'Computer Science',
        'john.doe@example.com',
        '2004-05-14',
        'O+',
        'USA'
    ),
    (
        'Alice',
        'Smith',
        22,
        'B',
        'Mathematics',
        'alice.smith@example.com',
        '2002-11-23',
        'A-',
        'Canada'
    ),
    (
        'Bob',
        'Johnson',
        21,
        'C',
        'Physics',
        'bob.johnson@example.com',
        '2003-07-19',
        'B+',
        'UK'
    ),
    (
        'Emma',
        'Brown',
        23,
        'A',
        'Chemistry',
        'emma.brown@example.com',
        '2001-03-08',
        'AB-',
        'Australia'
    ),
    (
        'David',
        'Wilson',
        20,
        'B',
        'Engineering',
        'david.wilson@example.com',
        '2004-09-25',
        'O-',
        'Germany'
    ),
    (
        'Sophia',
        'Taylor',
        19,
        'A',
        'Biology',
        'sophia.taylor@example.com',
        '2005-06-11',
        'A+',
        'France'
    ),
    (
        'Liam',
        'Martinez',
        24,
        'B',
        'Economics',
        'liam.martinez@example.com',
        '2000-12-29',
        'B-',
        'Spain'
    ),
    (
        'Olivia',
        'Anderson',
        22,
        'C',
        'History',
        'olivia.anderson@example.com',
        '2002-08-17',
        'O+',
        'Italy'
    ),
    (
        'Noah',
        'Thomas',
        21,
        'A',
        'Political Science',
        'noah.thomas@example.com',
        '2003-02-14',
        'AB+',
        'Netherlands'
    ),
    (
        'Isabella',
        'Moore',
        23,
        'B',
        'Psychology',
        'isabella.moore@example.com',
        '2001-05-22',
        'O-',
        'Brazil'
    ),
    (
        'Ethan',
        'Harris',
        20,
        'C',
        'Mechanical Engineering',
        'ethan.harris@example.com',
        '2004-07-30',
        'A-',
        'Japan'
    ),
    (
        'Mia',
        'Clark',
        22,
        'A',
        'Sociology',
        'mia.clark@example.com',
        '2002-04-03',
        'B+',
        'India'
    ),
    (
        'James',
        'Lewis',
        19,
        'B',
        'Business Administration',
        'james.lewis@example.com',
        '2005-11-09',
        'O+',
        'Mexico'
    ),
    (
        'Charlotte',
        'Walker',
        21,
        'C',
        'Computer Engineering',
        'charlotte.walker@example.com',
        '2003-06-27',
        'AB-',
        'South Korea'
    ),
    (
        'Benjamin',
        'Young',
        23,
        'A',
        'Philosophy',
        'benjamin.young@example.com',
        '2001-09-18',
        'O+',
        'Russia'
    );

SELECT first_name, age FROM students;

SELECT email FROM students;

SELECT email as "Student Email" FROM students;

SELECT * FROM students ORDER BY first_name ASC;

SELECT * FROM students ORDER BY first_name DESC;

SELECT * FROM students ORDER BY age DESC;

SELECT * FROM students ORDER BY age ASC;

SELECT * FROM students ORDER BY dob ASC;

SELECT country FROM students;

SELECT DISTINCT country FROM students;

SELECT DISTINCT country FROM students ORDER BY country ASC;

SELECT DISTINCT blood_group FROM students;

-- data filtering

-- select students from the USA
-- select students with 'A' grade in Physics
-- select students with a specific blood group('A')
-- select students from the USA or from Australia
-- select students from the USA or from Australia and age is 20
-- select students with a grade of 'A' or 'B' grade in Math or Physics
-- select students older than 20

SELECT * FROM students WHERE country = 'USA';

SELECT * FROM students WHERE grade = 'A';

SELECT *
FROM students
    -- WHERE grade = 'A' AND course='Physics';
WHERE
    grade = 'A'
    AND course = 'Sociology';

SELECT *
FROM students
WHERE
    country = 'USA'
    OR country = 'Australia';

SELECT *
FROM students
WHERE
    country = 'USA'
    OR country = 'Australia';

SELECT *
FROM students
WHERE (
        country = 'USA'
        OR country = 'Australia'
    )
    AND age = 20;

SELECT * FROM students WHERE age < 20;

SELECT * FROM students WHERE age > 20 AND course = 'History';

SELECT * FROM students WHERE age != 20;

SELECT * FROM students WHERE age <> 20;

SELECT * FROM students WHERE country <> 'USA';

SELECT upper(first_name) FROM students;

SELECT upper(first_name), * FROM students;

SELECT upper(first_name) as first_name_in_upper_case, *
FROM students;

SELECT concat(first_name, last_name) FROM students;

SELECT concat(first_name, ' ', last_name) FROM students;

SELECT * FROM students;

SELECT length(first_name) FROM students;

SELECT avg(age) FROM students;

SELECT sum(age) FROM students;

SELECT count(age) FROM students;

SELECT count(*) FROM students;

SELECT max(length(first_name)) FROM students;

/*

@Scalar functions
UPPER() Converts a string to uppercase .
LOWER() Converts a string to lowercase .
CONCAT() Concatenates two or more strings .
LENGTH() Returns the number of characters in a string .


@Aggregate functions
AVG() Calculates the average of a set of values .
MAX() Returns the max value in a set .
MIN() Returns the minimum value in a set .
SUM() Calculates the sum of values in a set .
COUNT() Counts the number of rows in a set .

*/

SELECT * FROM students WHERE NOT country = 'USA';

SELECT * FROM students WHERE email = NULL;

SELECT * FROM students WHERE email IS NULL;

SELECT * FROM students WHERE email IS NOT NULL;

SELECT
    COALESCE(email, 'Email Not Provided') as "Email",
    blood_group,
    first_name
FROM students;

-- SELECT * FROM students WHERE country='USA' OR  country='UK' OR country='Canada' ;

SELECT * FROM students WHERE country IN('USA','UK' ,'Canada') ;

SELECT * FROM students WHERE country NOT IN('USA','UK' ,'Canada') ;

SELECT * FROM students
    WHERE age BETWEEN 19 AND 22 ;

SELECT * FROM students
    WHERE dob BETWEEN '2000-01-01' AND '2005-01-01' ORDER BY dob ASC ;

SELECT * FROM students 
    WHERE first_name LIKE '%am';
    
SELECT * FROM students 
    WHERE first_name LIKE '%a';

SELECT * FROM students 
    WHERE first_name LIKE 'A%';

SELECT * FROM students 
    WHERE first_name LIKE '__a%';

SELECT * FROM students 
    WHERE first_name LIKE '___a';

SELECT * FROM students 
    WHERE first_name LIKE '__a%';

SELECT * FROM students 
    WHERE first_name ILIKE '__A%';



SELECT * FROM students
    WHERE country IN('USA', 'UK', 'Canada') LIMIT 5;


SELECT * FROM students LIMIT 5;

SELECT * FROM students LIMIT 5 OFFSET 5*0;
SELECT * FROM students LIMIT 5 OFFSET 5*1;
SELECT * FROM students LIMIT 5 OFFSET 5*2;




SELECT * FROM students;

DELETE FROM students;

DELETE FROM students
    WHERE grade = 'B';

DELETE FROM students
    WHERE grade = 'C' AND country='USA';


