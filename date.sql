-- Active: 1743601378217@@127.0.0.1@5432@test_db@public

SHOW timezone;

CREATE Table timez (ts TIMESTAMP without time zone, tsz TIMESTAMP with time zone);

INSERT INTO timez VALUES('2024-01-12 10:45:00', '2024-01-12 10:45:00');

SELECT * FROM timez;

SELECT now();

SELECT CURRENT_DATE;

SELECT now()::date;

SELECT now()::time;

SELECT to_char(now(), 'dd/mm/yyyy');

SELECT to_char(now(), 'month');

SELECT to_char(now(), 'MONTH');

SELECT to_char(now(), 'DDDD');

SELECT to_char(now(), 'dddd');

SELECT CURRENT_DATE - INTERVAL '1 year';

SELECT CURRENT_DATE - INTERVAL '1 month';

SELECT CURRENT_DATE - INTERVAL '1 year 2 month';

SELECT age(CURRENT_DATE, '1996-07-29');

SELECT * FROM students;

SELECT *, age(CURRENT_DATE, dob) FROM students;

SELECT extract(day from '2024-01-25'::date);

SELECT extract(month from '2024-01-25'::date);

SELECT extract(year from '2024-01-25'::date);

SELECT 'n'::BOOLEAN;
