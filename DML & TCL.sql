 -- DML [DATA MANIPULATION LANGUAGE]:- INSERT, UPDATE, DELETE
-- We can do any changes with only rows
-- We can not manipulate the data by manually so with the help of data loader we can manipulate the data from the data base directly
-- It has option to switched off/on autosaved mode by using SET AUTOCOMMIT = 0--(OFF), SET AUTOCOMMIT = 1--(ON)
-- So before writing any query we have to switched off the autosaved mode
-- And once you write correct query & make sure that what does we save it because once we saved it after that we can not undo it
-- So be carefull before saved it

-- TCL [TRANSACTION CONTROL LANGUAGE]:- COMMIT, ROLLBACK, SAVEPOINT
-- If we will have done any changes in data but no anyone able to see it as long as we does not save it
-- And once we have saved it after that everyone will be able to see those changes whatever we will have done it
-- And after that its out of your control then if we want to change it we can not do nothing
-- So be carefull before saved it our query is right or not please
-- Becasue as long as we does not save the query it in your control we can do anything like rollback menas remove the query if we dont want

SET AUTOCOMMIT = 0;

-- WHERE FALSE:- I want only column name not data points so WHERE FALSE; If i want data also then WHERE TRUE
CREATE TABLE TR_DML AS (SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY FROM EMPLOYEES WHERE FALSE);
SELECT * FROM TR_DML;

INSERT INTO TR_DML VALUES (1, 'RAHUL', 'OBEROY', 'AI', 200000);
SELECT * FROM TR_DML;

-- CREATE TABLE [Create a new table]
CREATE TABLE DML_TR(
EMP_ID INT UNSIGNED,
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
JOB_ID VARCHAR(50),
SALARY INT UNSIGNED);

SELECT * FROM DML_TR;

-- INSERT [Used for manipulate the data or values]
-- Whatever we will write character or alphacharacter words it should be in single quotes
INSERT INTO DML_TR VALUES
(100, 'ANAND', 'JAGDALE', 'DS_DA', 100000),
(101, 'SWAPNIL', 'WADKAR', 'DS_DA', 150000),
(102, 'SAUDUL', 'HODA', 'DS', 125000),
(103, 'RAVIKIRAN', 'JILLELA', 'DS_DA', 100000),
(104, 'VEDPRAKASH', 'ARYA', 'GRAPHIX_DESIGNER', 130000);

SELECT * FROM DML_TR;

-- Removing unwanted query
ROLLBACK;

-- UPDATE [Used for updating data]
USE HR;
SELECT * FROM EMPLOYEES;

UPDATE EMPLOYEES
SET SALARY = 50000
WHERE EMPLOYEE_ID = 100;

SELECT * FROM EMPLOYEES;

ROLLBACK;

SELECT * FROM EMPLOYEES;

UPDATE EMPLOYEES
SET SALARY = 50000
WHERE EMPLOYEE_ID = 100;

SELECT * FROM EMPLOYEES;

SET AUTOCOMMIT = 1;

-- Once we saves the query using AUTOCOMMIT fun. then we can not flashback or undo it
ROLLBACK;

 SELECT * FROM EMPLOYEES;
 
 UPDATE EMPLOYEES
 SET SALARY = 24000
 WHERE EMPLOYEE_ID = 100;
 
 SELECT * FROM EMPLOYEES;
 
 -- DELETE [Used for deleting the specific data points fro data]
 USE HR;
 SELECT * FROM EMPLOYEES;
 
 SET FOREIGN_KEY_CHECKS = 0;
 
 DELETE FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 100;
 SAVEPOINT A;
 
 SELECT * FROM EMPLOYEES;
 
 DELETE FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 101;
 
 -- SAVEPOINT [Used to making bookmark]
 SAVEPOINT B;
 
 SELECT * FROM EMPLOYEES;
 
 DELETE FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 102;
 SAVEPOINT C;
 
 SELECT * FROM EMPLOYEES;
 
 DELETE FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 103;
 SAVEPOINT D;
 
 SELECT * FROM EMPLOYEES;
 
 ROLLBACK TO B;
 
 ROLLBACK;
 
 SELECT * FROM EMPLOYEES;

-- IF ELSE LOGIC [CASE WHEN THEN EXPRESSION]

-- 1) Simple case expression:-
-- We can apply the conditions on only one column in this case
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY,
CASE JOB_ID WHEN 'IT_PROG' THEN SALARY*0.5+SALARY
            WHEN 'SA_MAN' THEN SALARY*0.3+SALARY
            WHEN 'SA_REP' THEN SALARY*0.2+SALARY
            ELSE SALARY
            END UPDATED_SALARY
            FROM EMPLOYEES;
            
SELECT * FROM EMPLOYEES;

ROLLBACK;

SELECT * FROM EMPLOYEES;
            
-- 2) Searched case expression:-
-- We can apply the conditions on no. of columns in this case
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY, MANAGER_ID,
CASE WHEN JOB_ID = 'IT_PROG' THEN SALARY*0.5+SALARY
	 WHEN JOB_ID = 'SA_MAN' THEN SALARY*0.3+SALARY
     WHEN JOB_ID = 'SA_REP' THEN SALARY*0.2+SALARY
     WHEN EMPLOYEE_ID = 101 THEN SALARY-2000
     WHEN MANAGER_ID = 100 THEN SALARY*2
     ELSE SALARY 
     END UPDATED_SALARIES
     FROM EMPLOYEES;







