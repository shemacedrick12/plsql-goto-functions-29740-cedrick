-- 02_functions/B3_fn_tax_calculator.sql
-- Author: SHEMA Mfizi Cedrick | ID: 29740
-- B3: Calculates progressive monthly tax from a salary amount

CREATE OR REPLACE FUNCTION fn_tax (
  p_salary IN NUMBER
) RETURN NUMBER
IS
  v_tax NUMBER;
BEGIN
  IF p_salary IS NULL OR p_salary < 0 THEN
    RETURN NULL;
  ELSIF p_salary <= 100000 THEN
    v_tax := 0;
  ELSIF p_salary <= 300000 THEN
    v_tax := (p_salary - 100000) * 0.10;
  ELSE
    v_tax := 20000 + (p_salary - 300000) * 0.20;
  END IF;

  RETURN v_tax;
END fn_tax;
/

-- Quick test
SELECT emp_id, first_name, salary, fn_tax(salary) AS tax
FROM   employees;
