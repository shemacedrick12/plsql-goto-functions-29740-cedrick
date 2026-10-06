-- 02_functions/B5_select_with_functions.sql
-- Author: SHEMA Mfizi Cedrick | ID: 29740
-- B5: One SELECT that uses all four functions

SELECT e.emp_id,
       e.first_name || ' ' || e.last_name  AS employee_name,
       fn_department_name(e.dept_id)       AS department,
       e.salary                            AS monthly_salary,
       fn_annual_salary(e.emp_id)          AS annual_salary,
       fn_years_of_service(e.emp_id)       AS years_of_service,
       fn_tax(e.salary)                    AS monthly_tax
FROM   employees e
ORDER  BY e.emp_id;
