--Exercise 01

--(a) Retrieve all information of all employees
SELECT * FROM emp;

--(b) Display the names and salaries of employees who earn more than 50,000
SELECT ename, salary FROM emp  WHERE salary > 50000;

--(c) Find employees whose names start with the letter ’A’
SELECT * FROM emp WHERE ename LIKE 'A%';

--(d) List the names and ages of employees younger than 30
SELECT ename, age FROM emp WHERE age < 30;

--(e) Find the employees whose salary is between 20,000 and 60,000
SELECT * FROM emp WHERE salary BETWEEN 20000 AND 60000 ;

--(f) Show employee names whose names contain the letter ‘a’
SELECT ename FROM emp WHERE ename LIKE '%a%';

--(g) Display the employee ID and name of those who are either aged 24 or 28
SELECT eid, ename FROM emp WHERE age IN (24, 28);

--(h) Select employees whose age is not between 25 and 35
SELECT * FROM emp WHERE age NOT BETWEEN 25 AND 35;

--(i) List all employees whose salary is not null
SELECT * FROM emp WHERE salary IS NOT NULL;


--Exercise 02

--(a) List all employees sorted by their name (ename)
SELECT * FROM emp ORDER BY ename ASC;

--(b) Show all employees sorted in descending order of salary.
SELECT * FROM emp ORDER BY salary DESC;

--(c) Display employee details ordered ascending by age and descending by salary
SELECT * FROM emp ORDER BY age ASC, salary DESC;

--(d) Show all departments sorted by budget in descending order
SELECT * FROM dept ORDER BY budget DESC;

--(e) List all work assignments ordered by pct time
SELECT * FROM works ORDER BY pct_time ASC;


--Exercise 03

--(a) How many employees are in the organization?
SELECT COUNT(*) FROM emp;

--(b) What is the total salary paid to all employees?
SELECT SUM(salary) FROM emp;

--(c) What is the highest salary and the lowest salary among all employees?
SELECT MAX(salary), MIN(salary) FROM emp;

--(d) What is the average salary of employees?
SELECT AVG(salary) FROM emp;

--(e) How many employees are aged below 30?
SELECT COUNT(age) FROM emp WHERE age < 30;

--(f) What is the total number of departments?
SELECT COUNT(*) FROM dept;

--(g) What is the maximum and minimum department budget?
SELECT MAX(budget), MIN(budget) FROM dept;

--(h) What is the total percentage of work assigned across all employees? (works table)
SELECT SUM(pct_time) FROM works;

--(i) What is the average work time (pct time) per employee?
SELECT AVG(pct_time) FROM works;


--Exercise 04

--(a) What is the total salary paid to employees of each age group?
SELECT age, SUM(salary) FROM emp GROUP BY age ORDER BY age;

--(b) Count the number of employees working in each department. Rename the count as ‘Number of Employees’
SELECT did, COUNT(*) AS [Number Of Employees] FROM dept GROUP BY did ORDER BY did;

--(c) How many employees earn a salary greater than 50,000?
SELECT COUNT(*) AS [No Of High Salary Employees] FROM emp WHERE salary > 50000;

--(d) List all employees who earn more than 50,000, sorted by salary in ascending order
SELECT * FROM emp WHERE salary > 50000 ORDER BY salary ASC;


--Exercise 05

--(a) Display the department IDs where the number of employees is less than 3
SELECT managerID FROM dept GROUP BY managerId HAVING COUNT(*) < 3;

--(b) List each manager and the number of departments they manage. Show only managers who manage more than 1 department. Sort by the number of de partments ascending.
SELECT managerID FROM dept GROUP BY managerId HAVING COUNT(*) > 1 ORDER BY COUNT(*) ASC;

--(c) Show each age group and the average salary of employees in that group. Display only age groups where the average salary is greater than 40,000
SELECT age, AVG(salary) FROM emp GROUP BY age HAVING AVG(salary) > 40000 ORDER BY age;

--(d) Find the number of work assignments per employee. Display employees with more than 2 assignments.
SELECT eid, COUNT(*) FROM works GROUP BY eid HAVING COUNT(*) > 2;

--(e) List departments with a total budget greater than 1,000,000.
SELECT did FROM dept WHERE budget > 1000000;


create table emp
(
	eid integer primary key,
	ename varchar(25),
	age int,
	salary float
)

insert into emp values(1000,'Lakmal',33,90000)
insert into emp values(1001,'Nadeeka',24,28000)
insert into emp values(1002,'Amila',26,35000)
insert into emp values(1003,'Nishani',28,60000)
insert into emp values(1004,'Krishan',36,95000)
insert into emp values(1005,'Surangi',37,22000)
insert into emp values(1006,'Shanika',24,18000)
insert into emp values(1007,'Amali',21,20000)
insert into emp values(1008,'Charith',28,35000)
insert into emp values(1009,'Prasad',40,95000)


create table dept
(
did char(12) primary key,
budget float,
managerId int foreign key references emp
)

insert into dept values('Academic',900000,1002)
insert into dept values('Admin',120000,1000)
insert into dept values('Finance',3000000,1008)
insert into dept values('ITSD',4500000,1000)
insert into dept values('Maintenance',40000,1004)
insert into dept values('SESD',20000,1004)
insert into dept values('Marketing',90000,1008)

create table works
(
eid int foreign key references emp,
did Char(12) foreign key references dept,
pct_time int,
primary key(eid,did)
)

insert into works values(1000,'Admin',40)
insert into works values(1000,'ITSD',50)
insert into works values(1001,'Admin',100)
insert into works values(1002,'Academic',100)
insert into works values(1003,'Admin',20)
insert into works values(1003,'Academic',30)
insert into works values(1003,'ITSD',45)
insert into works values(1004,'Admin',60)
insert into works values(1004,'Finance',30)
insert into works values(1006,'Finance',45)
insert into works values(1006,'Maintenance',52)
insert into works values(1008,'Maintenance',30)
insert into works values(1008,'ITSD',30)
insert into works values(1008,'Finance',35)
insert into works values(1009,'Admin',100)