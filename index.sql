
SELECT * from  employees;


EXPLAIN ANALYSE
-- SELECT * from employees WHERE emp_no = '10004';
SELECT * from employees WHERE employee_name = 'John Doe';

CREATE INDEX idx_employees_last_name
on employees (last_name);

SHOW data_directory;