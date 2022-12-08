-- STORED PROCEDURE:- PL/SQL
-- It is not actual sql, it is kind of function.
-- It does work like excel VBA macros
-- It stored queries output in container & call it whenever require it.

-- DELIMITER // [Used for starting & ending the procedure query]
-- Procedure query should be start with delimiter //
-- And after completing query we have to convert DELIMITER // to DELIMITER ;

-- DROP PROCEDURE PROC7;

-- 1ST PROCEDURE_QUERY:-
DELIMITER //
CREATE PROCEDURE PROC7()
BEGIN
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, DEPARTMENT_ID, DEPARTMENT_NAME FROM EMPLOYEES
INNER JOIN
DEPARTMENTS
USING (DEPARTMENT_ID);
END //
DELIMITER ;

CALL PROC7();

SHOW PROCEDURE STATUS
WHERE DB = 'HR';

-- 2ND PROCEDURE_QUERY:-
DELIMITER //
CREATE PROCEDURE PROC8()
BEGIN
SELECT * FROM EMPLOYEES
WHERE SALARY > 10000;
END //
DELIMITER ;

CALL PROC8;

-- PROCEDURE WITH IN PARAMETER [Used for passing the input parameter to user]
-- 1ST PROCEDUR_QUERY WITH ONE INPUT PARAMETER
DELIMITER //
CREATE PROCEDURE PROC9(IN VAR1 INT)
BEGIN
SELECT * FROM EMPLOYEES
WHERE SALARY > VAR1;
END //
DELIMITER ;
-- We can inter the input value in parameter based on that it gives result
CALL PROC9(10000);

-- 2ND PROCEDURE_QUERY WITH TWO INPUT PARAMETER
DELIMITER //
CREATE PROCEDURE PROC1(IN VAR1 VARCHAR(30), IN VAR2 INT)
BEGIN
SELECT * FROM EMPLOYEES
WHERE JOB_ID = VAR1 AND SALARY > VAR2;
END //
DELIMITER ;

CALL PROC1('IT_PROG',1000);

-- USER DEFINED VARIABLE
-- OUT FUNCTION [Used for stored the result of procedure into container]
-- We can not delete it so for deleting it we have to SET @CALC = NULL
-- Before calling the user defined variable we have to write @ for only calling purpose otherwise it does not work

DELIMITER //
CREATE PROCEDURE PROC2(OUT CALC INT)
BEGIN
SELECT AVG(SALARY) INTO CALC FROM EMPLOYEES;
END //
DELIMITER ;

CALL PROC2(@CALC);

SELECT * FROM EMPLOYEES WHERE SALARY > @CALC;

-- PROCEDURE_QUERY WITH IN & OUT PARAMETER
DELIMITER //
CREATE PROCEDURE PROC3(IN VAR1 INT, OUT VAR2 DECIMAL(10,3))
BEGIN 
SELECT SALARY INTO VAR2 FROM EMPLOYEES WHERE EMPLOYEE_ID = VAR1;
END //
DELIMITER ;

CALL PROC3(110,@VAR2);

SELECT @VAR2;


