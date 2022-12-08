-- DATA PARTITIONING:-
-- Data partitioning is nothing but making a subset of data from whole data which is available in huge qty 
-- We can not work on huge dataset so for avoiding those difficulties we have to make data partitioning
-- Which will help to user for work on dataset
-- We can not give a more than one partition for one table

-- 1) RANGE PARTITIONING:-
-- We have to mentioned column name on which you want to partitioning the whole table & also mentioned range values 
-- We can give a name to partitioning like partition0,1,2 
-- If we will have created partition1 already & you will be creating one other partition2 then system will replace the partition1 by updated or currently created partition2 
CREATE DATABASE PEOPLE;
USE PEOPLE;
CREATE TABLE PEOPLE(
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
AGE INT UNSIGNED,
NATIONALITY VARCHAR(50),
STATE VARCHAR(50),
CITY VARCHAR(50))
PARTITION BY RANGE(AGE)(
PARTITION PART0 VALUES LESS THAN (20),
PARTITION PART1 VALUES LESS THAN (30),
PARTITION PART2 VALUES LESS THAN (40),
PARTITION PART3 VALUES LESS THAN (50),
PARTITION PART4 VALUES LESS THAN MAXVALUE);

INSERT INTO PEOPLE VALUES
('ANAND', 'JAGDALE', 25, 'INDIAN', 'MAHARASHTRA', 'PUNE'),
('SWAPNIL', 'WADKAR', 27, 'INDIAN', 'MAHARASHTRA', 'LATUR'),
('VEDPRAKASH', 'ARYA', 31, 'INDIAN', 'MAHARASHTRA', 'PARBHANI'),
('NILESH', 'CHIPADE', 32, 'INDIAN', 'MAHARASHTRA', 'SOLAPUR'),
('ARIF', 'MOKHTAR', 41, 'INDIAN', 'KARNATAKA', 'BENGALURU'),
('KUNDLIK', 'JAGDALE', 65, 'INDIAN', 'MAHARASHTRA', 'OSMANABAD'),
('SUYOG', 'PATEKAR', 13, 'INDIAN', 'MAHARASHTRA', 'PUNE');

SELECT * FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_SCHEMA = 'PEOPLE' AND TABLE_NAME = 'PEOPLE';

SELECT * FROM PEOPLE;
SELECT * FROM PEOPLE PARTITION (PART0);
SELECT * FROM PEOPLE PARTITION (PART1);
SELECT * FROM PEOPLE PARTITION (PART2);
SELECT * FROM PEOPLE PARTITION (PART3);
SELECT * FROM PEOPLE PARTITION (PART4);

-- 2) LIST PARTITIONING:- 
-- In list partitioning, if the table does not have any partition at that time we can not ADD PARTITION for that table 
-- So we have to create or insert a partition1 on newly created column then we can ADD PARTITION for that table again 
-- If the table have contained already some rows with information then before adding other partition we have to make sure that those point or every row should be part of partition
-- Partition just look like copy but its not exact copy because partition contains some kind of information from original table so its not copy
-- We have to mentioned a column name & using IN operator we can passed the list of values from which we can create a no. of subset from original table 
-- after adding partiton we can add other row with information based on partition criteria
CREATE TABLE CUSTOMER(
CUST_NAME VARCHAR(50),
CITY VARCHAR(50))
PARTITION BY LIST COLUMNS (CITY) (
PARTITION NORTH VALUES IN ('DELHI', 'PANJAB', 'UP'),
PARTITION SOUTH VALUES IN ('HYDERABAD', 'CHENNAI', 'BENGALURU'),
PARTITION WEST VALUES IN ('GOA', 'MUMBAI', 'PUNE'),
PARTITION EAST VALUES IN ('KOLKATA', 'DURGAPUR', 'BARDHAMAN'));

INSERT INTO CUSTOMER VALUES
('ANAND','DELHI'),
('SWAPNIL', 'HYDERABAD'),
('VEDPRAKASH','KOLKATA'),
('NILESH','MUMBAI'),
('ARIF','BENGALURU'),
('SAUDUL','CHENNAI'),
('SUYOG','PUNE');

SELECT * FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_SCHEMA = 'PEOPLE' AND TABLE_NAME = 'CUSTOMER';
SELECT * FROM CUSTOMER;

SELECT * FROM CUSTOMER PARTITION (NORTH);
SELECT * FROM CUSTOMER PARTITION (WEST);
SELECT * FROM CUSTOMER PARTITION (EAST);
SELECT * FROM CUSTOMER PARTITION (SOUTH);

-- 3) HASH PARTITIONING:- 
-- Without passing any range value & list value, I want to create 10 or 5 partition on the entire table
-- So for that we have told to system just create a partition for me on this table
-- But for creating HASH PARTITIONING column should have a unique values in that column on which column you want to create a partition 
-- HASH PARTITION create a partition based on numerical values & also categorical value
-- It gives a result such a way for eg; i want to create 3 partition on table & table have a column in which have unique numerical value
-- & in that table have some 15 rows
-- System crewate PARTITON(0):-
-- In a column how many values are divisible by total no. of partition completely means remainder shoulde be 0 those data point lies in PARTITION(0)
-- PARTITION(1):-
-- In a column how many remaining values means excepting PARTITION(0) values are giving remainder 1 if i divide it by total no. of partition those point goes to PARTITION(1)
-- In such a way for PARTITON(2),,,,& so on.
DROP TABLE PEOPLE_NEW;
CREATE TABLE PEOPLE_NEW(
ID INT UNSIGNED NOT NULL,
NAME VARCHAR(50),
SURNAME VARCHAR(50),
AGE INT UNSIGNED NOT NULL,
CITY VARCHAR(50))
PARTITION BY HASH(ID)
PARTITIONS 3;

INSERT INTO PEOPLE_NEW VALUES
(101, 'ANAND', 'JAGDALE', 25, 'PUNE'),
(102, 'SAUDUL', 'HODA', 24, 'ODISA'),
(103, 'NILESH', 'CHIPADE', 26, 'SOLAPUR'),
(104, 'DINESH', 'MORE', 32, 'BARSHI'),
(105, 'RAVIKUMAR', 'MHETRE', 52, 'BANGLURU'),
(106, 'GANESH', 'DESHMUKH', 66, 'NASHIK'),
(107, 'DILIP', 'REDDY', 74, 'HYDERABAD'),
(108, 'VARUN', 'VENELANGATI', 32, 'HYDERABAD'),
(109, 'CHANDRAKANT', 'AUTI', 31, 'MUMBAI');

SELECT * FROM PEOPLE_NEW;

SELECT * FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_SCHEMA = 'PEOPLE' AND TABLE_NAME = 'PEOPLE_NEW';

-- ADD PARTITION:- If the table have already existed
DROP TABLE STUDENTS_INFO;
CREATE TABLE STUDENTS_INFO(
REG_NO INT UNSIGNED NOT NULL,
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
CITY VARCHAR(50),
AGE INT UNSIGNED NOT NULL);

ALTER TABLE STUDENTS_INFO PARTITION BY HASH (REG_NO) PARTITIONS 2;

INSERT INTO STUDENTS_INFO VALUES
(101, 'ARDVAN', 'HODA', 'HYDERABAD', 7),
(102, 'SUYOG', 'PATEKAR', 'PUNE', 13),
(103, 'SARTHAK', 'KHAIRE', 'PUNE', 12),
(104, 'SHREYA', 'CHOUDHARY', 'PARANDA', 15),
(105, 'SWAROOP', 'HAGWANE', 'BARSHI', 13),
(106, 'PRAJWAL', 'HAGWANE', 'BARSHI', 17),
(107, 'OM', 'KARALE', 'KANDARI', 17);

SELECT * FROM INFORMATION_SCHEMA.PARTITIONS WHERE TABLE_SCHEMA = 'PEOPLE' AND TABLE_NAME = 'STUDENTS_INFO';



