-- Active: 1743601378217@@127.0.0.1@5432@test_db@public
SELECT * FROM students;

SELECT country FROM students;

SELECT country, count(*) FROM students
    GROUP BY country;

SELECT country, count(*), avg(age) FROM students
    GROUP BY country;

SELECT country, count(*), avg(age) FROM students
    GROUP BY country
        HAVING avg(age) > 20 
    ;

SELECT country, count(*), avg(age) FROM students
    GROUP BY country
        HAVING avg(age) > 20.97 
    ;



-- Filter Groups Using HAVING to Show Only Countries with Average Age Above 20.97
SELECT country, count(*), avg(age) FROM students
    GROUP BY country
        HAVING avg(age) > 20.97 
    ;

-- Count Students Born in Each Year
SELECT extract(year FROM dob) as birth_year
    FROM students
    GROUP BY birth_year

SELECT extract(year FROM dob) as birth_year, count(*)
    FROM students
    GROUP BY birth_year


