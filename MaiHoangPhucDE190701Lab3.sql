













USE FUH_COMPANY;
--14
Select depSex,count(*) from tblDependent
group by depSex;
--15
Select depRelationship,count(*) from tblDependent
group by depRelationship;
--16
Select d.depNum,d.depName,count(*) from tblDepartment d join tblEmployee e ON d.depNum = e.depNum left join tblDependent dep ON e.empSSN = dep.empSSN
group by d.depNum,d.depName;
--17
SELECT d.depNum,d.depName,COUNT(dep.depName) AS DependentCount
FROM tblDepartment d JOIN tblEmployee e ON d.depNum = e.depNum LEFT JOIN tblDependent dep ON e.empSSN = dep.empSSN
GROUP BY d.depNum,d.depName
HAVING 
    COUNT(dep.depName) = (SELECT MIN(DependentCount) FROM (
	SELECT COUNT(dep.depName) AS DependentCount 
	FROM tblDepartment d JOIN tblEmployee e ON d.depNum = e.depNum LEFT JOIN tblDependent dep ON e.empSSN = dep.empSSN
	GROUP BY 
          d.depNum) AS DependentCounts);
--18
SELECT d.depNum,d.depName,COUNT(dep.depName) AS DependentCount
FROM tblDepartment d JOIN tblEmployee e ON d.depNum = e.depNum LEFT JOIN tblDependent dep ON e.empSSN = dep.empSSN
GROUP BY d.depNum,d.depName
HAVING 
    COUNT(dep.depName) = (SELECT MAX(DependentCount) FROM (
	SELECT COUNT(dep.depName) AS DependentCount 
	FROM tblDepartment d JOIN tblEmployee e ON d.depNum = e.depNum LEFT JOIN tblDependent dep ON e.empSSN = dep.empSSN
	GROUP BY 
          d.depNum) AS DependentCounts);
--19
SELECT e.empSSN,e.empName,d.depName,SUM(w.workHours) AS TotalWorkHours 
FROM tblEmployee e JOIN tblWorksOn w ON e.empSSN = w.empSSN JOIN  tblDepartment d ON e.depNum = d.depNum 
GROUP BY e.empSSN,e.empName,d.depName;
--20
SELECT d.depNum,d.depName,SUM(w.workHours) AS TotalWorkHours
FROM tblDepartment d JOIN tblEmployee e ON d.depNum = e.depNum JOIN tblWorksOn w ON e.empSSN = w.empSSN
GROUP BY d.depNum,d.depName;
--21
SELECT e.empSSN,e.empName,SUM(w.workHours) AS TotalWorkHours
FROM tblEmployee e JOIN tblWorksOn w ON e.empSSN = w.empSSN
GROUP BY e.empSSN,e.empName
HAVING SUM(w.workHours) = (SELECT MIN(TotalWorkHours)
        FROM (
            SELECT 
                SUM(w.workHours) AS TotalWorkHours
            FROM 
                tblEmployee e
            JOIN 
                tblWorksOn w ON e.empSSN = w.empSSN
            GROUP BY 
                e.empSSN
        ) AS WorkHours);
--22
SELECT e.empSSN,e.empName,SUM(w.workHours) AS TotalWorkHours
FROM tblEmployee e JOIN tblWorksOn w ON e.empSSN = w.empSSN
GROUP BY e.empSSN,e.empName
HAVING SUM(w.workHours) = (SELECT MAX(TotalWorkHours)
        FROM (
            SELECT 
                SUM(w.workHours) AS TotalWorkHours
            FROM 
                tblEmployee e
            JOIN 
                tblWorksOn w ON e.empSSN = w.empSSN
            GROUP BY 
                e.empSSN
        ) AS WorkHours);
--23
SELECT e.empSSN,e.empName,d.depName 
FROM tblEmployee e JOIN tblWorksOn w ON e.empSSN = w.empSSN JOIN tblDepartment d ON e.depNum = d.depNum 
GROUP BY e.empSSN, e.empName, d.depName
HAVING COUNT(w.proNum) = 1;
--24
SELECT e.empSSN,e.empName,d.depName 
FROM tblEmployee e JOIN tblWorksOn w ON e.empSSN = w.empSSN JOIN tblDepartment d ON e.depNum = d.depNum 
GROUP BY e.empSSN, e.empName, d.depName
HAVING COUNT(w.proNum) = 2;
--25
SELECT e.empSSN,e.empName,d.depName 
FROM tblEmployee e JOIN tblWorksOn w ON e.empSSN = w.empSSN JOIN tblDepartment d ON e.depNum = d.depNum 
GROUP BY e.empSSN, e.empName, d.depName
HAVING COUNT(w.proNum) >= 2;
--26
SELECT p.proNum,p.proName,COUNT(w.empSSN) AS MemberCount
FROM tblProject p JOIN tblWorksOn w ON p.proNum = w.proNum
GROUP BY p.proNum,p.proName;
Select * from tblDepartment;
select * from tblDependent;
