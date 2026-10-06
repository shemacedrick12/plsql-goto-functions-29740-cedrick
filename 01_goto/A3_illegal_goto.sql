-- 01_goto/A3_illegal_goto.sql
-- Author: SHEMA Mfizi Cedrick | ID: 29740
-- A3: Illegal GOTO (jump INTO an IF block) and the fix

SET SERVEROUTPUT ON;

-- PART 1: ILLEGAL GOTO (this block gives an error on purpose)
-- The label is inside the IF block, so GOTO cannot jump into it.
BEGIN
  GOTO inside_if;

  IF 1 = 1 THEN
    <<inside_if>>
    DBMS_OUTPUT.PUT_LINE('Inside the IF block');
  END IF;
END;
/

-- PART 2: THE FIX
-- The label is moved to the same level as the GOTO, outside the IF.
BEGIN
  GOTO my_label;

  DBMS_OUTPUT.PUT_LINE('This line is skipped');

  <<my_label>>
  DBMS_OUTPUT.PUT_LINE('GOTO worked: label is at the same block level');
END;
/
