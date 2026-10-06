-- 01_goto/A1_number_classifier.sql
-- Author: SHEMA Mfizi Cedrick | ID: 29740
-- A1: Number Classifier using GOTO
-- Classifies a number as Positive, Negative or Zero.

SET SERVEROUTPUT ON;

DECLARE
  v_number NUMBER := -15;   -- change this value to test: 25, -15, 0
BEGIN
  IF v_number > 0 THEN
    GOTO positive_number;
  ELSIF v_number < 0 THEN
    GOTO negative_number;
  ELSE
    GOTO zero_number;
  END IF;

  <<positive_number>>
  DBMS_OUTPUT.PUT_LINE(v_number || ' is a POSITIVE number.');
  GOTO end_program;

  <<negative_number>>
  DBMS_OUTPUT.PUT_LINE(v_number || ' is a NEGATIVE number.');
  GOTO end_program;

  <<zero_number>>
  DBMS_OUTPUT.PUT_LINE('The number is ZERO.');

  <<end_program>>
  DBMS_OUTPUT.PUT_LINE('Classification complete.');
END;
/
