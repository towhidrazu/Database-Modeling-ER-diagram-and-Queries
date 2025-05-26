-- Query 1
SELECT DISTINCT
	e.EmpId AS [Employee ID],
    CONCAT(e.Last, ' ', e.First) AS [Full Name],
    s.Supervisor AS [Supervisor Name],
    pd.Hours AS [Hours]
FROM 
    Employees e
INNER JOIN 
    PaymentDetails pd ON e.EmpId = pd.EmpId
INNER JOIN 
    EmpJobSupervisor ejs ON e.EmpId = ejs.EmpId
INNER JOIN 
    Supervisors s ON ejs.SupervisorID = s.SupervisorID
WHERE 
    pd.Hours > 25 
    AND e.Last LIKE '%s%';


--Query 2
SELECT 
    e.EmpId AS [Employee ID],
    CONCAT(e.Last, ' ', e.First) AS [Full Name],
    pd.Pay_Week_End_Date AS [Pay Week End Date],
    pd.Hours AS [Hours Worked],
    pd.OT AS [Overtime Hours]
FROM 
    Employees e
INNER JOIN 
    PaymentDetails pd ON e.EmpId = pd.EmpId
WHERE 
    pd.Pay_Week_End_Date = '2013-05-30' 
    AND pd.OT > 0;

--Query 3
DECLARE @EmpId INT = 97319; -- Replace with the employee ID you want to search for

SELECT DISTINCT
    E.EmpId,
    EJS.Job_Code AS JobCode,
    S.Supervisor AS ManagerName,
    S.Supervisor_Cell AS ManagerCell
FROM
    Employees E
JOIN
    EmpJobSupervisor EJS ON E.EmpId = EJS.EmpId
JOIN
    Supervisors S ON EJS.SupervisorID = S.SupervisorID
WHERE
    E.EmpId = @EmpId;


--Query 4
DECLARE @City NVARCHAR(50) = 'Saskatoon'; -- Replace with the desired city

SELECT DISTINCT
    E.First + ' ' + E.Last AS FullName,
    J.Position AS JobDescription,
    @City AS City
FROM
    Employees E
JOIN
    EmpJobSupervisor EJS ON E.EmpId = EJS.EmpId
JOIN
    Jobs J ON EJS.Job_Code = J.Job_Code
WHERE
    E.City = @City; 


--Query 5
DECLARE @CommitteeName NVARCHAR(100) = 'OH&S';

SELECT DISTINCT
    E.EmpId,
    E.First + ' ' + E.Last AS FullName,
    J.Position AS JobDescription
FROM
    Employees E
JOIN
    EmployeesCommittees EC ON E.EmpId = EC.EmpId
JOIN
    Committees C ON EC.Committee_Id = C.Committee_Id
JOIN
    EmpJobSupervisor EJS ON E.EmpId = EJS.EmpId
JOIN
    Jobs J ON EJS.Job_Code = J.Job_Code
WHERE
    C.Committee_Name = @CommitteeName;


--Query 6
DECLARE @SupervisorLastName NVARCHAR(100) = 'Goldberg'; -- Replace with the desired supervisor's last name

SELECT DISTINCT
    E.EmpId AS EmployeeID,
    E.First + ' ' + E.Last AS EmployeeFullName,
    EJS.Job_Code AS JobCode
FROM
    Employees E
JOIN
    EmpJobSupervisor EJS ON E.EmpId = EJS.EmpId
JOIN
    Supervisors S ON EJS.SupervisorID = S.SupervisorID
WHERE
    RIGHT(S.Supervisor, LEN(@SupervisorLastName)) = @SupervisorLastName; -- Matches supervisor's last name


--Query 7

UPDATE Jobs
SET Payrate = Payrate * 1.15
WHERE Position = 'Cashier';


--Query 8

SELECT 
    SupervisorID,
    COUNT(EmpId) AS NumberOfEmployees
FROM 
    EmpJobSupervisor
GROUP BY 
    SupervisorID
HAVING 
    COUNT(EmpId) > 2;


--Query 9

SELECT 
    S.SupervisorID,
    S.Supervisor AS SupervisorName
FROM 
    Supervisors S
WHERE 
    EXISTS (
        SELECT 1
        FROM EmpJobSupervisor EJS
        WHERE 
            EJS.SupervisorID = S.SupervisorID
        GROUP BY 
            EJS.SupervisorID
        HAVING 
            COUNT(EJS.EmpId) > 2
			 );


--Query 10

CREATE VIEW EmployeeCommitteeView AS
SELECT DISTINCT
    E.EmpId AS EmployeeID, E.First + ' ' + E.Last AS EmployeeFullName, EC.Committee_Id AS CommitteeID,
    C.Meeting_Night, C.Committee_Name, S.SupervisorID, S.Supervisor AS SupervisorName
FROM 
    Employees E
JOIN 
    EmployeesCommittees EC ON E.EmpId = EC.EmpId
JOIN 
    Committees C ON EC.Committee_Id = C.Committee_Id
JOIN 
    EmpJobSupervisor EJS ON E.EmpId = EJS.EmpId
JOIN 
    Supervisors S ON EJS.SupervisorID = S.SupervisorID
WHERE 
    C.Meeting_Night = 'Fri';


--Query to get ‘Person hours worked’

SELECT Pay_Week_End_Date, 
	   SUM(Hours) AS [Person hours worked]
FROM PaymentDetails
GROUP BY Pay_Week_End_Date
ORDER BY 1