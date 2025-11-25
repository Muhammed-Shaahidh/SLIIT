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


SELECT * FROM emp
SELECT * FROM works
SELECT * FROM dept

--Exercise 01

--(a)Make a list of the employee ID, name, and the department ID(s) they are working in
SELECT e.eid, e.ename, w.did 
FROM emp e, works w 
WHERE e.eid = w.eid

--(b)List the department names and the IDs of employees assigned to each
SELECT did, eid
FROM works


--(c)Display the names of employees along with the names of the departments they are working in
SELECT e.ename, w.did
FROM emp e, works w
WHERE e.eid = w.eid

--(d)List the employee names and salaries for those who work in departments with a budget greater than 1,000,000
SELECT e.ename, d.budget
FROM emp e, dept d, works w
WHERE e.eid = w.eid AND d.did = w.did AND budget > 1000000

--(e)Find the names of departments where employees spend more than 40% of their time
SELECT d.did
FROM dept d, works w
WHERE d.did = w.did
GROUP BY d.did
HAVING SUM (w.pct_time) > 40;


--Exercise 02

--(a)How many employees are working in each department? List the department ID and the number of employees
SELECT d.did, COUNT(e.eid) AS [No Of Employees]
FROM dept d, emp e, works w
WHERE d.did = w.did AND e.eid = w.eid
GROUP BY d.did

--(b) How many employees are working in each department? List the department name and the number of employees
SELECT d.did, COUNT(e.eid) AS [No Of Employees]
FROM dept d, emp e, works w
WHERE d.did = w.did  AND e.eid = w.eid
GROUP BY d.did

--(c)Which departments have more than 2 employees assigned to them? List the department IDs only
SELECT d.did
FROM dept d, works w
WHERE d.did = w.did
GROUP BY d.did
HAVING COUNT(eid) > 2

--(d)List all departments that have more than 2 employees assigned. Show the department name along with the number of employees and sort the result in ascending order of employee count.
SELECT d.did AS [Department ID], d.budget AS [Department Name], COUNT(w.eid) AS [Num Of Employees]
FROM works w, dept d
WHERE d.did = w.did 
GROUP BY d.did, d.budget
HAVING COUNT(w.eid) > 2
ORDER BY [Num Of Employees] ASC;


