DECLARE
  V_NM_FUNCIONARIO employees.first_name%TYPE;
  V_JOB_ID employees.JOB_ID%TYPE;
BEGIN
  SELECT first_name INTO V_NM_FUNCIONARIO
  FROM employees
  WHERE employee_id = 102;
  IF V_NM_FUNCIONARIO <> 'Lex' THEN 
    DBMS_OUTPUT.put_line(V_NM_FUNCIONARIO);
  ELSE 
    DBMS_OUTPUT.put_line('NOK');
  END IF;

END

SELECT * from employees

-- >, <, =, <>, !=, =<, =>