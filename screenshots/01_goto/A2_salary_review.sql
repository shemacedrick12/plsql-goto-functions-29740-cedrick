SET SERVEROUTPUT ON;

DECLARE
  v_emp_id     employees.emp_id%TYPE := 2;   -- test with 5, 2 and 1
  v_name       VARCHAR2(70);
  v_salary     employees.salary%TYPE;
  v_rate       NUMBER := 0;
  v_new_salary NUMBER;
BEGIN
  SELECT first_name || ' ' || last_name, salary
  INTO   v_name, v_salary
  FROM   employees
  WHERE  emp_id = v_emp_id;

  IF v_salary < 100000 THEN
    GOTO low_salary;
  ELSIF v_salary <= 500000 THEN
    GOTO mid_salary;
  ELSE
    GOTO high_salary;
  END IF;

  <<low_salary>>
  v_rate := 0.10;
  DBMS_OUTPUT.PUT_LINE('Category: LOW salary - 10% raise');
  GOTO show_result;

  <<mid_salary>>
  v_rate := 0.05;
  DBMS_OUTPUT.PUT_LINE('Category: MEDIUM salary - 5% raise');
  GOTO show_result;

  <<high_salary>>
  v_rate := 0;
  DBMS_OUTPUT.PUT_LINE('Category: HIGH salary - no raise');

  <<show_result>>
  v_new_salary := v_salary * (1 + v_rate);
  DBMS_OUTPUT.PUT_LINE('Employee   : ' || v_name);
  DBMS_OUTPUT.PUT_LINE('Old salary : ' || v_salary);
  DBMS_OUTPUT.PUT_LINE('New salary : ' || v_new_salary);

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Employee ' || v_emp_id || ' not found.');
END;
/
