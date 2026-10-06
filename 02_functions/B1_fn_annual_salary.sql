-- 02_functions/B1_fn_annual_salary.sql
-- Author: SHEMA Mfizi Cedrick | ID: 29740
-- B1: Returns the annual salary (monthly salary x 12) of an employee

CREATE OR REPLACE FUNCTION fn_annual_salary (
  p_emp_id IN employees.emp_id%TYPE
) RETURN NUMBER
IS
  v_salary employees.salary%TYPE;
BEGIN
  SELECT salary
  INTO   v_salary
  FROM   employees
  WHERE  emp_id = p_emp_id;

  RETURN v_salary * 12;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN NULL;   -- employee does not exist
END fn_annual_salary;
/

-- Quick test
SELECT emp_id, first_name, salary, fn_annual_salary(emp_id) AS annual_salary
FROM   employees;

SELECT fn_annual_salary(99) AS missing_employee FROM dual;
