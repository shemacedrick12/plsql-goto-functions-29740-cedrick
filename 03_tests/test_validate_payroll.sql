-- 03_tests/test_validate_payroll.sql
-- Author: SHEMA Mfizi Cedrick | ID: 29740
-- Tests for fn_validate_payroll

SET SERVEROUTPUT ON

-- Test 1: valid employee (Alice, Finance)
-- Test 2: employee with no department (Frank)
-- Test 3: employee that does not exist
-- Test 4: NULL id
BEGIN
  DBMS_OUTPUT.PUT_LINE('Test 1 (emp 1)   : ' || fn_validate_payroll(1));
  DBMS_OUTPUT.PUT_LINE('Test 2 (emp 6)   : ' || fn_validate_payroll(6));
  DBMS_OUTPUT.PUT_LINE('Test 3 (emp 999) : ' || fn_validate_payroll(999));
  DBMS_OUTPUT.PUT_LINE('Test 4 (NULL)    : ' || fn_validate_payroll(NULL));
END;
/

-- All employees in one result grid (run with Ctrl+Enter for the screenshot)
SELECT emp_id,
       first_name || ' ' || last_name AS employee_name,
       fn_validate_payroll(emp_id)    AS payroll_status
FROM   employees
ORDER  BY emp_id;
