-- Drop and Create Jobs table
DROP TABLE IF EXISTS Jobs;
CREATE TABLE Jobs (
    Job_Code INT PRIMARY KEY,
    Position VARCHAR(50),
    Payrate DECIMAL(5, 2)
);

-- Drop and Create Supervisors table
DROP TABLE IF EXISTS Supervisors;
CREATE TABLE Supervisors (
    SupervisorID INT PRIMARY KEY,
    Supervisor VARCHAR(100),
    Supervisor_Cell CHAR(12)
);

-- Drop and Create Employees table
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees (
    EmpId INT PRIMARY KEY,
    SIN BIGINT NOT NULL,
    Last VARCHAR(50),
    First VARCHAR(50),
    Street VARCHAR(100),
    City VARCHAR(50),
    Prov CHAR(2),
    Postal CHAR(7),
    Birth_Date DATE,
    Hire_Date DATE,
    Inc_Tax CHAR(1)
);

-- Drop and Create PayWeekEndDates table
DROP TABLE IF EXISTS PayWeekEndDates;
CREATE TABLE PayWeekEndDates (
    Pay_Week_End_Date DATE PRIMARY KEY,
    Days_Available INT NOT NULL
);

-- Drop and Create Committees table
DROP TABLE IF EXISTS Committees;
CREATE TABLE Committees (
    Committee_Id INT PRIMARY KEY,
    Committee_Name VARCHAR(100),
    Meeting_Night VARCHAR(10)
);

-- Drop and Create EmpJobSupervisor table
DROP TABLE IF EXISTS EmpJobSupervisor;
CREATE TABLE EmpJobSupervisor (
    EmpId INT PRIMARY KEY,
    Job_Code INT NOT NULL,
    SupervisorID INT NOT NULL,
    FOREIGN KEY (EmpId) REFERENCES Employees(EmpId) ON DELETE CASCADE,
    FOREIGN KEY (Job_Code) REFERENCES Jobs(Job_Code) ON DELETE CASCADE,
    FOREIGN KEY (SupervisorID) REFERENCES Supervisors(SupervisorID) ON DELETE CASCADE
);

-- Drop and Create PaymentDetails table
DROP TABLE IF EXISTS PaymentDetails;
CREATE TABLE PaymentDetails (
    EmpId INT NOT NULL,
    Pay_Week_End_Date DATE,
    Hours DECIMAL(5, 2),
    OT DECIMAL(5, 2),
    PRIMARY KEY (EmpId, Pay_Week_End_Date),
    FOREIGN KEY (EmpId) REFERENCES Employees(EmpId) ON DELETE CASCADE,
    FOREIGN KEY (Pay_Week_End_Date) REFERENCES PayWeekEndDates(Pay_Week_End_Date) ON DELETE CASCADE
);

-- Drop and Create EmployeesCommittees table
DROP TABLE IF EXISTS EmployeesCommittees;
CREATE TABLE EmployeesCommittees (
    EmpId INT NOT NULL,
    Committee_Id INT NOT NULL,
    PRIMARY KEY (EmpId, Committee_Id),
    FOREIGN KEY (EmpId) REFERENCES Employees(EmpId) ON DELETE CASCADE,
    FOREIGN KEY (Committee_Id) REFERENCES Committees(Committee_Id) ON DELETE CASCADE
);

-- Insert into Jobs table
INSERT INTO Jobs (Job_Code, Position, Payrate)
VALUES
    (3000, 'Stockperson', 12.99),
    (5000, 'Butcher', 18),
    (2000, 'Cashier', 11.99),
    (1000, 'Greeter', 10.25),
    (7000, 'Pharmacist', 30),
    (8000, 'Assistant Baker', 15.5),
    (4000, 'Baker', 17.5),
    (6000, 'Cleaner', 13.5);

-- Insert into Supervisors table
INSERT INTO Supervisors (SupervisorID, Supervisor, Supervisor_Cell)
VALUES
    (1, 'Jason Goldberg', '306.304.4545'),
    (2, 'Chand Long', '306.304.1212'),
    (3, 'Melissa Jones', '306.304.8878'),
    (4, 'Joseph Snowdale', '306.304.9091');

-- Insert into Employees table
INSERT INTO Employees (EmpId, SIN, Last, First, Street, City, Prov, Postal, Birth_Date, Hire_Date, Inc_Tax)
VALUES
    (97319, 516303417, 'Novak', 'Gerry', '6803 Park Ave.', 'Saskatoon', 'SK', 'S6H 1X7', '1986-08-24', '2003-07-07', 'N'),
    (33982, 867481381, 'Boychuk', 'Robin', '117 East Broadway', 'Saskatoon', 'SK', 'S6H 3P5', '1971-04-04', '1998-10-11', 'Y'),
    (51537, 112893584, 'Smith', 'Kim', '9745 University Drive', 'Regina', 'SK', 'S4P 7A3', '1982-11-29', '2001-12-02', 'Y'),
    (41822, 717505366, 'Miller', 'Chris', '72 Railway Ave.', 'Pense', 'SK', 'S0T 1K4', '1968-11-15', '1985-02-19', 'Y'),
    (3571, 374853129, 'Hashimoto', 'Jo', '386 High Street', 'Tuxford', 'SK', 'S0L 8V6', '1956-06-23', '1980-03-20', 'Y'),
    (85833, 466128562, 'Singh', 'Lindsey', '1216 Willow Cres.', 'Pasqua', 'SK', 'S0H 5T8', '1975-03-15', '2002-07-27', 'Y'),
    (81216, 615914758, 'Hansen', 'Jaimie', '95 Lakeshore Blvd.', 'Caronport', 'SK', 'S0T 3S7', '1983-03-04', '2002-05-21', 'Y'),
    (32177, 306114858, 'DaSilva', 'Robbie', '4319 Main St.', 'Saskatoon', 'SK', 'S6H 2M2', '1951-02-18', '1973-07-07', 'Y'),
    (52421, 936654021, 'O''Day', 'Shelley', '27 High St.', 'Tuxford', 'SK', 'S0L 8V6', '1963-07-31', '1997-11-08', 'Y'),
    (72690, 655971502, 'Wong', 'Jodie', '59 Oslo Square', 'Saskatoon', 'SK', 'S6H 2H9', '1987-01-01', '2003-08-26', 'Y'),
    (72201, 635111876, 'Ramirez', 'Kelly', '1015 Brunswick Lane', 'Saskatoon', 'SK', 'S6H 4T5', '1986-09-29', '2003-08-26', 'N');


--Insert into EmpJobSupervisor table

INSERT INTO EmpJobSupervisor (EmpId, Job_Code, SupervisorID)
VALUES
    (97319, 3000, 1),
    (33982, 5000, 2),
    (51537, 2000, 3),
    (41822, 2000, 3),
    (3571, 1000, 3),
    (85833, 7000, 4),
    (81216, 8000, 2),
    (32177, 4000, 2),
    (52421, 6000, 1),
    (72690, 6000, 1),
    (72201, 3000, 1);

-- Insert into PayWeekEndDates table
INSERT INTO PayWeekEndDates (Pay_Week_End_Date, Days_Available)
VALUES
    ('2013-05-23', 7),
    ('2013-05-30', 6);

-- Insert into PaymentDetails table
INSERT INTO PaymentDetails (EmpId, Pay_Week_End_Date, Hours, OT)
VALUES
    (32177, '2013-05-23', 40.00, 3.70),
    (85833, '2013-05-23', 37.50, 0.50),
    (33982, '2013-05-23', 40.00, 0.00),
    (51537, '2013-05-23', 27.00, 0.00),
    (41822, '2013-05-23', 40.00, 0.00),
    (3571,  '2013-05-23', 40.00, 0.00),
    (81216, '2013-05-23', 40.00, 0.00),
    (52421, '2013-05-23', 22.00, 0.00),
    (72690, '2013-05-23', 36.00, 0.00),
    (52421, '2013-05-30', 40.00, 4.50),
    (32177, '2013-05-30', 40.00, 2.25),
    (41822, '2013-05-30', 38.00, 1.25),
    (33982, '2013-05-30', 38.25, 0.00),
    (3571,  '2013-05-30', 40.00, 0.00),
    (81216, '2013-05-30', 22.00, 0.00),
    (72201, '2013-05-30', 18.00, 0.00);

-- Insert into Committees table
INSERT INTO Committees (Committee_Id, Committee_Name, Meeting_Night)
VALUES
    (1, 'OH&S', 'Fri'),
    (2, 'Party Committee', 'Wed'),
    (3, 'Social Res. Com.', 'Mon');

-- Insert into EmployeesCommittees table

INSERT INTO EmployeesCommittees (EmpId, Committee_Id)
VALUES
    (97319, 1),
    (72201, 1),
    (33982, 1),
    (32177, 1),
    (72690, 2),
    (51537, 2),
    (81216, 2),
    (41822, 2),
    (41822, 3),
    (32177, 3),
    (72690, 3),
    (97319, 3);
