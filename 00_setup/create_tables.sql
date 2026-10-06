-- 00_setup/create_tables.sql
-- Author: SHEMA Mfizi Cedrick | ID: 29740
-- Course: INSY 8311 - Database Development with PL/SQL
-- Purpose: Create the tables and sample data used by all tasks.

-- Clean up (ignore errors if tables do not exist yet)
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE employees PURGE';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE departments PURGE';
EXCEPTION WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE departments (
  dept_id    NUMBER(4)     PRIMARY KEY,
  dept_name  VARCHAR2(50)  NOT NULL
);

CREATE TABLE employees (
  emp_id      NUMBER(6)     PRIMARY KEY,
  first_name  VARCHAR2(30)  NOT NULL,
  last_name   VARCHAR2(30)  NOT NULL,
  dept_id     NUMBER(4)     REFERENCES departments(dept_id),
  salary      NUMBER(10,2)  NOT NULL,   -- monthly salary
  hire_date   DATE          NOT NULL
);

INSERT INTO departments VALUES (10, 'Finance');
INSERT INTO departments VALUES (20, 'IT');
INSERT INTO departments VALUES (30, 'Human Resources');
INSERT INTO departments VALUES (40, 'Marketing');

INSERT INTO employees VALUES (1, 'Alice',  'Uwase',    10, 850000, DATE '2015-03-15');
INSERT INTO employees VALUES (2, 'Bob',    'Habimana', 20, 450000, DATE '2019-07-01');
INSERT INTO employees VALUES (3, 'Claire', 'Mukamana', 20, 120000, DATE '2023-01-10');
INSERT INTO employees VALUES (4, 'David',  'Nkusi',    30, 300000, DATE '2020-11-20');
INSERT INTO employees VALUES (5, 'Eve',    'Ingabire', 10,  60000, DATE '2025-06-01');
INSERT INTO employees VALUES (6, 'Frank',  'Mugisha',  NULL, 200000, DATE '2018-09-09');

COMMIT;

SELECT * FROM departments;
SELECT * FROM employees;
