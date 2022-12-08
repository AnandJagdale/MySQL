-- MULTIPLE ROW | AGGREGATE | GROUP FUNCTION:-
-- SUM(), AVG(), MIN(), MAX(), COUNT()

USE HR; 

SELECT SUM(SALARY), AVG(SALARY), MIN(SALARY), MAX(SALARY), COUNT(*) FROM EMPLOYEES;

 -- ROUND [Used for making the approximation of value] how many decimal i want in value ?
SELECT SUM(SALARY), ROUND(AVG(SALARY),2), MIN(SALARY), MAX(SALARY), COUNT(*) FROM EMPLOYEES; 

-- GROUP BY [I want sum, avg, min, max & count of salary with all JOB_ID]
SELECT JOB_ID, SUM(SALARY), ROUND(AVG(SALARY),2), MIN(SALARY), MAX(SALARY), COUNT(*) FROM EMPLOYEES
GROUP BY JOB_ID;

-- WHERE CLAUSE [Used for only normal column means there is no any aggregation on that column]
SELECT JOB_ID, SUM(SALARY), ROUND(AVG(SALARY),2), MIN(SALARY), MAX(SALARY), COUNT(*) FROM EMPLOYEES
WHERE JOB_ID = 'IT_PROG';

-- HAVING CLAUSE [Used for only aggregated column means there is some aggregation on that column]
SELECT SALARY, SUM(SALARY), ROUND(AVG(SALARY),2), MIN(SALARY), MAX(SALARY), COUNT(*) FROM EMPLOYEES
HAVING AVG(SALARY) > 1000;


