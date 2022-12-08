-- 1) INNER JOIN:-
-- If we connect two table by using inner join
-- It gives only those observations which are matching in both table
-- But there is need to join them, atleast one column should be same in both table
-- If the there is DEPARTMENT TABLE & in that have a DEPT_ID & DEPT_NAME COLUMN | In EMPLOYEES TABLE have a DEPT_ID, FIRST_NAME, LAST_NAME, EMP_ID, SALARY, JOB_ID
-- So we have got same column in both table like DEPARTMENT TABLE = DEPT_ID & EMPLOYEES TABLE = DEPT_ID
USE HR;
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, DEPARTMENT_NAME, SALARY,DEPARTMENT_ID FROM EMPLOYEES
INNER JOIN
DEPARTMENTS
USING (DEPARTMENT_ID);

-- 2) LEFT JOIN:-
-- System will take the left hand side table data as it is & then it will be matching to right hand side table data as per LHS table obseravtions
-- It gives all matched & non matched records
-- But it gives non matched records as a NULL
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, DEPARTMENT_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES
LEFT OUTER JOIN
DEPARTMENTS
USING (DEPARTMENT_ID);

-- 3) RIGHT JOIN:-
-- System will take the right hand side table data as it is & then it will be matching to left hand side table data as per RHS table obseravtions
-- It gives all matched & non matched records
-- But it gives non matched records as a NULL
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, DEPARTMENT_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES
RIGHT OUTER JOIN
DEPARTMENTS
USING (DEPARTMENT_ID);

-- 4) FULL OUTER JOIN:-
-- We can not type a FULL OUTER JOIN in query then when we type only join then system will understand its a only join & gives result same as INNER JOIN
-- So we have to combined LEFT JOIN & RIGHT JOIN by using UNION for FULL OUTER JOIN result
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, DEPARTMENT_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES
LEFT JOIN
DEPARTMENTS
USING (DEPARTMENT_ID)
UNION
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, DEPARTMENT_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES
RIGHT JOIN
DEPARTMENTS
USING (DEPARTMENT_ID);

-- 5) SELF JOIN:-
-- Used for join the table itself but we can not join the table itself by same name
-- So for that we have to make the same table name as unique in different two name by using ALIASES
-- If the two columns having a different name & i want to match it so we have to used ON CLAUSE
SELECT * FROM DEPARTMENTS;
ALTER TABLE DEPARTMENTS RENAME COLUMN DEPARTMENT_ID TO DEPT_ID;

-- 1ST METHOD:-
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID, DEPARTMENT_NAME, SALARY, DEPARTMENT_ID FROM EMPLOYEES E 
INNER JOIN
DEPARTMENTS D
ON (E.DEPARTMENT_ID = D.DEPT_ID);

-- 2ND METHOD:-
-- If i want to join the two column in a single column from the same table itsef then use CONCAT CLAUSE
-- But we have to make table name as unique because we can not join the same table itself by the same name
SELECT * FROM EMPLOYEES;

SELECT CONCAT(E.FIRST_NAME,' ',E.LAST_NAME) EMPLOYEES_NAME, CONCAT(M.FIRST_NAME,' ',M.LAST_NAME) MANAGERS_NAME  FROM EMPLOYEES E
JOIN 
EMPLOYEES M
ON (M.EMPLOYEE_ID = E.MANAGER_ID);
-- 6) CROSS JOIN:-
-- LHS TABLE points match the each & every single point of RHS TABLE