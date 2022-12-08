-- IFNULL, COALESCE [Handling null values by using these fun.]

USE HR;

-- IFNULL [If the null values will have  in COMMISSION_PCT column then replace it by 0]
SELECT * FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, IFNULL(COMMISSION_PCT,0) AS UPDATED_COMMISSION FROM EMPLOYEES;

-- COALESCE [Null values replace by alternatives, STATE_PROVINCE:CITY, CITY:POSTAL_CODE, POSTAL_CODE:STREET_ADDRESS]
SELECT * FROM LOCATIONS;

SELECT LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, COALESCE(STATE_PROVINCE, CITY, POSTAL_CODE, STREET_ADDRESS) UPDATED_DATA FROM LOCATIONS;

-- DDL [DATA DEFINITION LANGUAGE]:- CREATE, ALTER, RENAME, DROP, COMMENT, TRUNCATE, MODIFY
-- It has auto-saved mode
-- We can do any changes only with column
-- We writes any query for doing any changes regarding column & once we execute it after that we can not undo the changes
-- Because whatever we will do in DDL it will get automatically saved & it will have permanent changes
-- So becarefull before executing any query in DDL

SELECT * FROM EMPLOYEES; 

-- DESC [Describing the data types]
DESC EMPLOYEES;

-- CREATE TABLE [Create a new table]
CREATE TABLE TRAINING(
EMP_ID INT UNSIGNED,
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
JOB_ID VARCHAR(30),
SALARY DECIMAL(10,2),
HIRE_DATE DATE);

SELECT * FROM TRAINING;

-- ALTER [Used for updating or doing any changes in columns]
ALTER TABLE TRAINING ADD COLUMN PHONE_NUMBER VARCHAR(15);

ALTER TABLE TRAINING ADD COLUMN MIDDLE_NAME VARCHAR(50);

SELECT * FROM TRAINING;

ALTER TABLE TRAINING RENAME COLUMN LAST_NAME TO SURNAME;

SELECT * FROM TRAINING;

ALTER TABLE TRAINING DROP COLUMN MIDDLE_NAME;

SELECT * FROM TRAINING;

DESC TRAINING;

-- MODIFY [Used for modifying data]
SELECT * FROM TRAINING;

ALTER TABLE TRAINING MODIFY COLUMN SALARY DECIMAL(13.2);

ALTER TABLE TRAINING MODIFY COLUMN SALARY INT UNSIGNED;

-- DROP
-- Once you execute the DROP fun. all dataset will be gone in one shot 
-- So be carefull before executing it & make sure whatever you are dropping, is it okay or not for dropping?
DROP TABLE TRAINING;

-- TRUNCATE 
-- It works same as DROP, only one difference is that once we execute TRUNCATE fun. all data will be gone but its structure will be remain.
-- So be carefull when you used TRUNCATE fun.
SELECT * FROM EMPLOYEES;

CREATE TABLE TRAINING AS (SELECT * FROM EMPLOYEES);

SELECT * FROM TRAINING;

DESC TRAINING;

RENAME TABLE TRAINING TO TRAINING_NEW;

SELECT * FROM TRAINING_NEW;

TRUNCATE TRAINING_NEW;

SELECT * FROM TRAINING_NEW;