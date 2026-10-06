-- 03_tests/test_functions.sql
-- Author: SHEMA Mfizi Cedrick | ID: 29740
-- Tests for B1 to B4 using the sample data from 00_setup/create_tables.sql

SET SERVEROUTPUT ON

DECLARE
  PROCEDURE check_result (p_label IN VARCHAR2,
                          p_actual IN VARCHAR2,
                          p_expected IN VARCHAR2) IS
  BEGIN
    DBMS_OUTPUT.PUT_LINE(RPAD(p_label, 38) || ' -> ' || p_actual
      || CASE WHEN p_actual = p_expected THEN '  [PASS]'
              ELSE '  [FAIL, expected ' || p_expected || ']' END);
  END;
BEGIN
  -- B1: annual salary = monthly salary x 12
  check_result('B1 fn_annual_salary(1)',  TO_CHAR(fn_annual_salary(1)), '10200000');
  check_result('B1 fn_annual_salary(5)',  TO_CHAR(fn_annual_salary(5)), '720000');

  -- B2: years of service
  check_result('B2 fn_years_of_service(1)', TO_CHAR(fn_years_of_service(1)), '11');
  check_result('B2 fn_years_of_service(5)', TO_CHAR(fn_years_of_service(5)), '1');

  -- B3: tax calculator
  check_result('B3 fn_tax(60000)',  TO_CHAR(fn_tax(60000)),  '0');
  check_result('B3 fn_tax(200000)', TO_CHAR(fn_tax(200000)), '10000');
  check_result('B3 fn_tax(850000)', TO_CHAR(fn_tax(850000)), '130000');

  -- B4: department name
  check_result('B4 fn_department_name(10)',   fn_department_name(10),   'Finance');
  check_result('B4 fn_department_name(NULL)', fn_department_name(NULL), 'No department');
END;
/
