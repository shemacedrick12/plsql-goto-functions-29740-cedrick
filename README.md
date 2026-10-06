# PL/SQL GOTO Statements and Functions

**Student:** SHEMA Mfizi Cedrick | **ID:** 29740
**Course:** INSY 8311 - Database Development with PL/SQL
**Instructor:** Eric Maniraguha
**Assignment:** Individual Assignment III

## Overview
This repository contains my work on PL/SQL GOTO statements, stored functions,
exception handling, and using functions inside SQL queries.

## Repository Structure
| Folder | Contents |
|---|---|
| `00_setup/` | `create_tables.sql` - creates `departments` and `employees` with sample data |
| `01_goto/` | A1 number classifier, A2 salary review, A3 illegal GOTO and fix, A4 rewrite without GOTO |
| `02_functions/` | B1 annual salary, B2 years of service, B3 tax calculator, B4 department name, C1 payroll validator |
| `03_tests/` | B5 functions in SELECT, `test_functions.sql`, `test_validate_payroll.sql` |
| `screenshots/` | Output screenshots for A1, A2, A3, A4, B5 and C1 |
| `docs/` | `REFLECTION.md` |

## Functions
| Function | Purpose |
|---|---|
| `fn_annual_salary(emp_id)` | Monthly salary x 12 |
| `fn_years_of_service(emp_id)` | Full years since hire date |
| `fn_tax(salary)` | Monthly tax from the salary |
| `fn_department_name(dept_id)` | Department name, or "No department" |
| `fn_validate_payroll(emp_id)` | Returns `VALID: ...` or `INVALID: reason` |

## How to Run
1. Run `00_setup/create_tables.sql`.
2. Run the functions in `02_functions/` (B1, B2, B3, B4, then C1).
3. Run the programs in `01_goto/`.
4. Run the test files in `03_tests/`.
5. Verify the results against the screenshots.

## Notes
- Tested in Oracle SQL Developer.
- AI usage: I used Claude (Anthropic) as an assistant for the C1 payroll
  validator, the test files, this README, and for guidance on organizing the
  GitHub repository. I reviewed the code and can explain how it works.
