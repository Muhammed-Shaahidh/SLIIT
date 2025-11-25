-- Create Employee Table
create table emp_IT24610823_Lab08
(
	eid integer primary key,
	ename varchar(25),
	age int,
	salary float
);

insert into emp_IT24610823_Lab08 values(1000,'Lakmal',33,90000);
insert into emp_IT24610823_Lab08 values(1001,'Nadeeka',24,28000);
insert into emp_IT24610823_Lab08 values(1002,'Amila',26,35000);
insert into emp_IT24610823_Lab08 values(1003,'Nishani',28,60000);
insert into emp_IT24610823_Lab08 values(1004,'Krishan',36,95000);
insert into emp_IT24610823_Lab08 values(1005,'Surangi',37,22000);
insert into emp_IT24610823_Lab08 values(1006,'Shanika',24,18000);
insert into emp_IT24610823_Lab08 values(1007,'Amali',21,20000);
insert into emp_IT24610823_Lab08 values(1008,'Charith',28,35000);
insert into emp_IT24610823_Lab08 values(1009,'Prasad',40,95000);

-- Create Department Table
create table dept_IT24610823_Lab08
(
did char(12) primary key,
budget float,
managerId int foreign key references emp_IT24610823_Lab08
);

insert into dept_IT24610823_Lab08 values('Academic',900000,1002);
insert into dept_IT24610823_Lab08 values('Admin',120000,1000);
insert into dept_IT24610823_Lab08 values('Finance',3000000,1008);
insert into dept_IT24610823_Lab08 values('ITSD',4500000,1000);
insert into dept_IT24610823_Lab08 values('Maintenance',40000,1004);
insert into dept_IT24610823_Lab08 values('SESD',20000,1004);
insert into dept_IT24610823_Lab08 values('Marketing',90000,1008);

-- Create Works Table
create table works_IT24610823_Lab08
(
eid int foreign key references emp_IT24610823_Lab08,
did Char(12) foreign key references dept_IT24610823_Lab08,
pct_time int,
primary key(eid,did)
);

insert into works_IT24610823_Lab08 values(1000,'Admin',40);
insert into works_IT24610823_Lab08 values(1000,'ITSD',50);
insert into works_IT24610823_Lab08 values(1001,'Admin',100);
insert into works_IT24610823_Lab08 values(1002,'Academic',100);
insert into works_IT24610823_Lab08 values(1003,'Admin',20);
insert into works_IT24610823_Lab08 values(1003,'Academic',30);
insert into works_IT24610823_Lab08 values(1003,'ITSD',45);
insert into works_IT24610823_Lab08 values(1004,'Admin',60);
insert into works_IT24610823_Lab08 values(1004,'Finance',30);
insert into works_IT24610823_Lab08 values(1006,'Finance',45);
insert into works_IT24610823_Lab08 values(1006,'Maintenance',52);
insert into works_IT24610823_Lab08 values(1008,'Maintenance',30);
insert into works_IT24610823_Lab08 values(1008,'ITSD',30);
insert into works_IT24610823_Lab08 values(1008,'Finance',35);
insert into works_IT24610823_Lab08 values(1009,'Admin',100);

-- Select all
select * from emp_IT24610823_Lab08;
select * from dept_IT24610823_Lab08;
select * from works_IT24610823_Lab08;

-- Exercise 01

--a) List employees whose salary is greater than the salary of 'Lakmal'
SELECT ename, salary
FROM emp_IT24610823_Lab08
WHERE salary > (
    SELECT salary
    FROM emp_IT24610823_Lab08
    WHERE ename = 'Lakmal'
);

--b) Show the eid, ename, salary of employees whose salary equals the minimum salary in the company
SELECT eid, ename, salary
FROM emp_IT24610823_Lab08
WHERE salary = (
    SELECT MIN(salary)
    FROM emp_IT24610823_Lab08
);

--c) Display departments (did) whose budget is greater than the average salary of all employees
SELECT did, budget
FROM dept_IT24610823_Lab08
WHERE budget > (
    SELECT AVG(salary)
    FROM emp_IT24610823_Lab08
);

--d) List employees whose salary is not equal to the average salary of all employees
SELECT eid, ename, salary
FROM emp_IT24610823_Lab08
WHERE salary <> (
    SELECT AVG(salary)
    FROM emp_IT24610823_Lab08
);

--e) Display employees whose salary is less than the salary of the manager of department 'ITSD'
SELECT ename, salary
FROM emp_IT24610823_Lab08
WHERE salary < (
    SELECT salary
    FROM emp_IT24610823_Lab08
    WHERE eid = (
        SELECT managerId
        FROM dept_IT24610823_Lab08
        WHERE did = 'ITSD'
    )
);

-- Exercise 02

--a) List employees who work in any department whose budget ≥ 1,000,000
SELECT DISTINCT e.eid, e.ename
FROM emp_IT24610823_Lab08 e
WHERE e.eid IN (
    SELECT w.eid
    FROM works_IT24610823_Lab08 w
    WHERE w.did IN (
        SELECT d.did
        FROM dept_IT24610823_Lab08 d
        WHERE d.budget >= 1000000
    )
);

--b) Display employees who are not working in the ‘Academic’ or ‘Admin’ departments
SELECT DISTINCT e.eid, e.ename
FROM emp_IT24610823_Lab08 e
WHERE e.eid NOT IN (
    SELECT w.eid
    FROM works_IT24610823_Lab08 w
    WHERE w.did IN ('Academic', 'Admin')
);

--c) List employees whose salary is greater than ALL employee salaries in 'Admin'
SELECT ename, salary
FROM emp_IT24610823_Lab08
WHERE salary > ALL (
    SELECT e.salary
    FROM emp_IT24610823_Lab08 e
    JOIN works_IT24610823_Lab08 w ON e.eid = w.eid
    WHERE w.did = 'Admin'
);

--d) List employees whose salary is greater than ANY salary of employees who work in 'Finance'
SELECT ename, salary
FROM emp_IT24610823_Lab08
WHERE salary > ANY (
    SELECT e.salary
    FROM emp_IT24610823_Lab08 e
    JOIN works_IT24610823_Lab08 w ON e.eid = w.eid
    WHERE w.did = 'Finance'
);

--e) Show department IDs where ALL assigned employees have salary ≥ 30,000
SELECT d.did
FROM dept_IT24610823_Lab08 d
WHERE d.did IN (
    SELECT w.did
    FROM works_IT24610823_Lab08 w
    WHERE w.eid NOT IN (
        SELECT e.eid
        FROM emp_IT24610823_Lab08 e
        WHERE e.salary < 30000
    )
);
