-- VIEWS:-
-- View is a part of main table
-- View helps to take control on dataset because it shows only those columns from table which i want to show anybody
-- Means we will have controlled on dataset & whatever confidential information have in a dataset which we can not show anybody that task we do by VIEWS
-- We can do anything on view as doing on table
-- But whatever actions we do on view those actions will reflected on table so be carefull for that
-- If any column have a important information & we do not want to show other person then we can control it by views,
-- what do you want to see or what do not you want to see?
-- It does not occupied space because its a temporary view of main table
-- We can modify the view
-- We can give a other name to view
SET AUTOCOMMIT = 0;
USE HR;
SELECT * FROM EMPLOYEES;

-- 1ST METHOD WITH ORIGINAL DATASET 
CREATE VIEW EMP_DATA AS
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID FROM EMPLOYEES;

SELECT * FROM EMP_DATA;

-- 1ST TRIAL
DELETE FROM EMP_DATA
WHERE EMPLOYEE_ID = 206;
SAVEPOINT A;
SELECT * FROM EMP_DATA;

-- CROSS CHECK 
SELECT * FROM EMPLOYEES;

SET FOREIGN_KEY_CHECKS = 0;

-- 2ND TRIAL
UPDATE EMP_DATA
SET JOB_ID = 'DS'
WHERE EMPLOYEE_ID = 105;
SAVEPOINT B;

SELECT * FROM EMP_DATA;

-- CROSS CHECK 
SELECT * FROM EMPLOYEES;

-- 3RD TRIAL 
UPDATE EMP_DATA
SET JOB_ID = 'DA'
WHERE EMPLOYEE_ID = 104;
SAVEPOINT C;

ROLLBACK TO B;

SELECT * FROM EMPLOYEES; 

-- 2ND METHOD WITH CREATED DATASET
DROP TABLE A1;
CREATE TABLE A1(
EMP_ID INT UNSIGNED NOT NULL,
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
JOB_ID VARCHAR(50),
SALARY DECIMAL(10,2));

INSERT INTO A1 VALUES
(101, 'ANAND', 'JAGDALE', 'DS', 25000),
(102, 'SAUDUL', 'HODA', 'DS', 30000),
(103, 'SWAPNIL', 'WADKAR', 'DS', 35000),
(104, 'VEDPRAKASH', 'ARYA', 'GD', 25000),
(105, 'IRFAN', 'SHEIKH', 'DA', 27000),
(106, 'NILESH', 'CHIPADE', 'DS', 12000);

CREATE VIEW A1_NEW AS
SELECT EMP_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY FROM A1;

UPDATE A1_NEW
SET JOB_ID = 'IT_PROG'
WHERE EMP_ID = 101;

-- 10:07:51	DELETE FROM A1_NEW WHERE EMP_ID = 104	Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.000 sec
-- disable safe update mode
SET SQL_SAFE_UPDATES=0;
-- execute update statement
-- UPDATE table SET column='value';
-- enable safe update mode
-- SET SQL_SAFE_UPDATES=1;

DELETE FROM A1_NEW
WHERE EMP_ID = 104;

 ROLLBACK;
 
-- CROSS CHECK 
SELECT * FROM A1_NEW;
SELECT * FROM A1;

-- If incase you want to modify or update an existing view you can make use of ALTER VIEW statement
-- Let's suppose i want to alter the A1_NEW view as i would like to get the data based on some condition

ALTER VIEW A1_NEW AS
SELECT EMP_ID, FIRST_NAME, LAST_NAME, JOB_ID, SALARY FROM A1
WHERE SALARY < 15000;

SELECT * FROM A1_NEW;

-- If incase one view have already existed with that name which name is you want to execute again then we have to used CREATE OR REPLACE VIEW statment
CREATE OR REPLACE VIEW A1_NEW AS
SELECT FIRST_NAME, LAST_NAME, JOB_ID, SALARY FROM A1;

SELECT * FROM A1_NEW;

-- RENAME 
RENAME TABLE A1_NEW TO A1_UPDATED;

SELECT * FROM A1_UPDATED;