-- 02_functions/C1_fn_validate_payroll.sql
-- Author: SHEMA Mfizi Cedrick | ID: 29740
-- C1: Payroll Validator - reuses B1 to B4 functions

CREATE OR REPLACE FUNCTION fn_validate_payroll (
  p_emp_id IN NUMBER
) RETURN VARCHAR2
IS
  v_salary     employees.salary%TYPE;
  v_dept_id    employees.dept_id%TYPE;
  v_hire_date  employees.hire_date%TYPE;
  v_dept_name  VARCHAR2(50);
  v_annual     NUMBER;
  v_years      NUMBER;
  v_tax        NUMBER;
BEGIN
  -- 1. Employee must exist (raises NO_DATA_FOUND otherwise)
  SELECT salary, dept_id, hire_date
  INTO   v_salary, v_dept_id, v_hire_date
  FROM   employees
  WHERE  emp_id = p_emp_id;

  -- 2. Salary must be positive
  IF v_salary <= 0 THEN
    RETURN 'INVALID: salary must be greater than zero';
  END IF;

  -- 3. Employee must belong to a department
  IF v_dept_id IS NULL THEN
    RETURN 'INVALID: employee has no department';
  END IF;

  -- 4. Hire date cannot be in the future
  IF v_hire_date > SYSDATE THEN
    RETURN 'INVALID: hire date is in the future';
  END IF;

  -- All checks passed: use the B1 to B4 functions
  v_dept_name := fn_department_name(v_dept_id);
  v_annual    := fn_annual_salary(p_emp_id);
  v_years     := fn_years_of_service(p_emp_id);
  v_tax       := fn_tax(v_salary);

  RETURN 'VALID: ' || v_dept_name
      || ' | annual=' || v_annual
      || ' | years=' || v_years
      || ' | tax='    || v_tax;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'INVALID: employee ' || p_emp_id || ' not found';
  WHEN OTHERS THEN
    RETURN 'ERROR: ' || SQLERRM;
END fn_validate_payroll;
/

SHOW ERRORS
