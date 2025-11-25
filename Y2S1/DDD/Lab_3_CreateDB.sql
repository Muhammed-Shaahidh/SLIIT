CREATE TABLE Student(

sid INT PRIMARY KEY,
sname VARCHAR(25) NOT NULL,
address VARCHAR(100),
dob DATE,
nic VARCHAR(10) UNIQUE NOT NULL,
cid INT,
FOREIGN KEY (cid) REFERENCES Course(cid) 

)

CREATE TABLE Offers(

cid INT,
FOREIGN KEY (cid) REFERENCES Course(cid),
Mcode INT,
FOREIGN KEY (Mcode) REFERENCES Module(Mcode),
Accadamic_Year INT,
Semester INT,
PRIMARY KEY(cid, Mcode)

)

CREATE TABLE Module(

Mcode INT PRIMARY KEY,
Mname VARCHAR(50) NOT NULL,
M_Description VARCHAR(150),
NoOfCredits INT NOT NULL

)

CREATE TABLE Course(

cid INT PRIMARY KEY,
Cname VARCHAR(50) NOT NULL,
C_Description VARCHAR(100),
C_Fee DECIMAL(8,2) CHECK (C_Fee >= 0)

)

DROP TABLE IF EXISTS Student

SELECT * FROM Student
SELECT * FROM Offers
SELECT * FROM Module
SELECT * FROM Course

-- Using ALTER TABLE, add the following CHECK constraints:
-- • In the Student table, the NIC number must be exactly 9 digits followed by ’V’
-- or ’v’.
-- • In the Module table, the credits value must be 1, 2, 3, or 4.

ALTER TABLE Student 
ADD CONSTRAINT chk_nic 
CHECK (nic LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][Vv]')

ALTER TABLE Module
ADD CONSTRAINT chk_credits
CHECK (NoOfCredits IN (1, 2, 3, 4))


INSERT INTO Course VALUES (15, 'IT', 'Information Technology', 65000)
INSERT INTO Student VALUES (101, 'John Smith', 'New York, US', '2025-08-15', '968523147v', 15)
INSERT INTO Student VALUES (102, 'Lee', 'Tokyo', '2025-08-18', '256341589V', 15)
INSERT INTO Module VAlUES (801, 'DataBase System', 'Covers SQL', 3)
INSERT INTO Module VAlUES (802, 'Software Engineering', 'Covers Java', 4)
INSERT INTO Offers VALUES (15, 802, 2025, 2)