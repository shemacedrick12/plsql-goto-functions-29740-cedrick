-- 02_functions/B4_fn_department_name.sql
-- Author: SHEMA Mfizi Cedrick | ID: 29740
-- B4: Returns the department name for a given department id

CREATE OR REPLACE FUNCTION fn_department_name (
  p_dept_id IN departments.dept_id%TYPE
) RETURN VARCHAR2
IS
  v_name departments.dept_name%TYPE;
BEGIN
  IF p_dept_id IS NULL THEN
    RETURN 'No department';
  END IF;

  SELECT dept_name
  INTO   v_name
  FROM   departments
  WHERE  dept_id = p_dept_id;

  RETURN v_name;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN 'Unknown department';
END fn_department_name;
/

-- Quick test
SELECT emp_id, first_name, dept_id, fn_department_name(dept_id) AS department
FROM   employees;

SELECT fn_department_name(99) AS unknown_dept FROM dual;
