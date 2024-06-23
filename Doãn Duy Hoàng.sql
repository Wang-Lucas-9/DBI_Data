USE FUH_COMPANY;
--	Câu 40:
SELECT 
    e.empSSN AS [Mã số nhân viên],
    e.empName AS [Họ tên nhân viên],
    d.depName AS [Tên phòng ban]
FROM 
    tblEmployee e
JOIN 
    tblDepartment d ON e.depNum = d.depNum
LEFT JOIN 
    tblDependent dep ON e.empSSN = dep.empSSN
WHERE 
    dep.empSSN IS NULL;


--  Câu 41:
SELECT 
    d.depNum AS [Mã số phòng ban],
    d.depName AS [Tên phòng ban]
FROM 
    tblDepartment d
LEFT JOIN 
    tblEmployee e ON d.depNum = e.depNum
LEFT JOIN 
    tblDependent dep ON e.empSSN = dep.empSSN
GROUP BY 
    d.depNum, d.depName
HAVING 
    COUNT(dep.empSSN) = 0;


--  Câu 42:
SELECT 
    e.empSSN AS [Mã số nhân viên],
    e.empName AS [Họ tên nhân viên],
    d.depName AS [Tên phòng ban]
FROM 
    tblEmployee e
JOIN 
    tblDepartment d ON e.depNum = d.depNum
LEFT JOIN 
    tblWorksOn w ON e.empSSN = w.empSSN
WHERE 
    w.proNum IS NULL;


--  Câu 43:
SELECT 
    d.depNum AS [Mã số phòng ban],
    d.depName AS [Tên phòng ban]
FROM 
    tblDepartment d
LEFT JOIN 
    tblEmployee e ON d.depNum = e.depNum
LEFT JOIN 
    tblWorksOn w ON e.empSSN = w.empSSN
WHERE 
    w.proNum IS NULL;


--  Câu 44:
SELECT 
    d.depNum AS [Mã số phòng ban],
    d.depName AS [Tên phòng ban]
FROM 
    tblDepartment d
LEFT JOIN 
    tblEmployee e ON d.depNum = e.depNum
LEFT JOIN 
    tblWorksOn w ON e.empSSN = w.empSSN
LEFT JOIN 
    tblProject p ON w.proNum = p.proNum AND p.proName = 'ProjectA'
WHERE 
    p.proNum IS NULL;


--  Câu 45:
SELECT 
    d.depNum AS [Mã số phòng ban],
    d.depName AS [Tên phòng ban],
    COUNT(p.proNum) AS [Số lượng dự án]
FROM 
    tblDepartment d
LEFT JOIN 
    tblProject p ON d.depNum = p.depNum
GROUP BY 
    d.depNum, d.depName;


--  Câu 46:
WITH ProjectCount AS (
    SELECT 
        d.depNum,
        d.depName,
        COUNT(p.proNum) AS [Số lượng dự án]
    FROM 
        tblDepartment d
    LEFT JOIN 
        tblProject p ON d.depNum = p.depNum
    GROUP BY 
        d.depNum, d.depName
)
SELECT 
    depNum AS [Mã phòng ban],
    depName AS [Tên phòng ban],
    [Số lượng dự án]
FROM 
    ProjectCount
WHERE 
    [Số lượng dự án] = (SELECT MIN([Số lượng dự án]) FROM ProjectCount);


--  Câu 47:
WITH ProjectCount AS (
    SELECT 
        d.depNum,
        d.depName,
        COUNT(p.proNum) AS [Số lượng dự án]
    FROM 
        tblDepartment d
    LEFT JOIN 
        tblProject p ON d.depNum = p.depNum
    GROUP BY 
        d.depNum, d.depName
)
SELECT 
    depNum AS [Mã phòng ban],
    depName AS [Tên phòng ban],
    [Số lượng dự án]
FROM 
    ProjectCount
WHERE 
    [Số lượng dự án] = (SELECT MAX([Số lượng dự án]) FROM ProjectCount);
	

--  Câu 48:
SELECT 
    d.depNum AS [Mã phòng ban],
    d.depName AS [Tên phòng ban],
    COUNT(e.empSSN) AS [Số lượng nhân viên],
    p.proName AS [Tên dự án]
FROM 
    tblDepartment d
JOIN 
    tblEmployee e ON d.depNum = e.depNum
JOIN 
    tblWorksOn w ON e.empSSN = w.empSSN
JOIN 
    tblProject p ON w.proNum = p.proNum
GROUP BY 
    d.depNum, d.depName, p.proName
HAVING 
    COUNT(e.empSSN) > 5;


--  Câu 49:
SELECT 
    e.empSSN AS [Mã nhân viên],
    e.empName AS [Họ tên nhân viên]
FROM 
    tblEmployee e
JOIN 
    tblDepartment d ON e.depNum = d.depNum
LEFT JOIN 
    tblDependent dep ON e.empSSN = dep.empSSN
WHERE 
    d.depName = N'Phòng nghiên cứu'
    AND dep.empSSN IS NULL;


--  Câu 50:
SELECT 
    e.empSSN AS [Mã nhân viên],
    e.empName AS [Họ tên nhân viên],
    SUM(w.workHours) AS [Tổng số giờ làm]
FROM 
    tblEmployee e
LEFT JOIN 
    tblDependent dep ON e.empSSN = dep.empSSN
JOIN 
    tblWorksOn w ON e.empSSN = w.empSSN
WHERE 
    dep.empSSN IS NULL
GROUP BY 
    e.empSSN, e.empName;


--  Câu 51:
SELECT 
    e.empSSN AS [Mã nhân viên],
    e.empName AS [Họ tên nhân viên],
    COUNT(dep.empSSN) AS [Số lượng người phụ thuộc],
    SUM(w.workHours) AS [Tổng số giờ làm]
FROM 
    tblEmployee e
JOIN 
    tblDependent dep ON e.empSSN = dep.empSSN
JOIN 
    tblWorksOn w ON e.empSSN = w.empSSN
GROUP BY 
    e.empSSN, e.empName
HAVING 
    COUNT(dep.empSSN) > 3;


--  Câu 52:
SELECT 
    e.empSSN AS [Mã nhân viên],
    e.empName AS [Họ tên nhân viên],
    SUM(w.workHours) AS [Tổng số giờ làm]
FROM 
    tblEmployee e
JOIN 
    tblWorksOn w ON e.empSSN = w.empSSN
WHERE 
    e.supervisorSSN = (SELECT empSSN FROM tblEmployee WHERE empName = N'Mai Duy An')
GROUP BY 
    e.empSSN, e.empName;