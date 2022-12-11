-- Create Employee table
CREATE TABLE Employee(
     SSN INT PRIMARY KEY,
     Name VARCHAR(20) NOT NULL,
     DEPT VARCHAR(10) 
);
-- Create Project table
CREATE TABLE Project(
     PNO INT PRIMARY KEY,
     Project_Area VARCHAR(20)
);
-- Create Assigned to
 CREATE TABLE Assigned_to(
    SSN INT,
    PNO INT,
    FOREIGN KEY(SSN) REFERENCES Employee(SSN),
    FOREIGN KEY(PNO) REFERENCES Project(PNO),
    PRIMARY KEY(SSN,PNO));

-- Creating tables for Employee
INSERT INTO Employee VALUES(001,'Reehan',1);
INSERT INTO Employee VALUES(002,'CR7',2);
INSERT INTO Employee VALUES(003,'Neymar',2);
INSERT INTO Employee VALUES(004,'Bono',4);
INSERT INTO Employee VALUES(005,'Ramaiah',3);

-- Creating tables for Project
INSERT INTO Project values(12,'Data Structures');
INSERT INTO Project values(13,'Applied CS');
INSERT INTO Project values(15,'Databases');
INSERT INTO Project values(14, 'Machine Learning');
INSERT INTO Project values(16,'Web Development'),(20,'Java Project');

-- Inserting into Assigned_to 

INSERT INTO  Assigned_to  (SSN ,PNO) values(001,12),(002,13),(003,16),(004,14),(005,16),(004,12),(004,15),(005,20);

-- Query 1
SELECT *FROM Employee WHERE SSN IN
(SELECT SSN FROM Assigned_to
WHERE PNO IN
(SELECT PNO FROM project WHERE Project_Area = 'Databases'));

-- Query 2
SELECT DEPT ,
COUNT(SSN) AS 'Number Of Employees'
FROM Employee
GROUP BY DEPT DESC;

-- Query 3
-- USE SET FOREIGN_KEYS_CHECKS = 0;
UPDATE Assigned_to SET PNO=20 WHERE SSN=1;
-- Query 4
SELECT *FROM Employee
WHERE SSN IN (
 SELECT  SSN FROM Assigned_to
 GROUP BY SSN
 HAVING COUNT(*) = 1
);     


