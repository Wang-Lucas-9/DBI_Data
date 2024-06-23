--27.   Cho biết tổng số giờ làm của mỗi dự án. Thông tin yêu cầu: mã dự án, tên dự án, tổng số giờ làm
SELECT
    p.proNum AS 'Mã dự án',
    p.proName AS 'Tên dự án',
    SUM(w.workHours) AS 'Tổng số giờ làm'
FROM
    dbo.tblWorksOn w
    INNER JOIN dbo.tblProject p ON w.proNum = p.proNum
GROUP BY
    p.proNum, p.proName
ORDER BY
    p.proNum;

-- 28.   Cho biết dự án nào có số lượng thành viên là ít nhất. Thông tin yêu cầu: mã dự án, tên dự án, số lượng thành viên
SELECT TOP 1
    p.proNum AS 'Mã dự án',
    p.proName AS 'Tên dự án',
    COUNT(w.empSSN) AS 'Số lượng thành viên'
FROM
    dbo.tblWorksOn w
    INNER JOIN dbo.tblProject p ON w.proNum = p.proNum
GROUP BY
    p.proNum, p.proName
ORDER BY
    COUNT(w.empSSN);

-- 29.   Cho biết dự án nào có số lượng thành viên là nhiều nhất. Thông tin yêu cầu: mã dự án, tên dự án, số lượng thành viên
SELECT TOP 1
    p.proNum AS 'Mã dự án',
    p.proName AS 'Tên dự án',
    COUNT(w.empSSN) AS 'Số lượng thành viên'
FROM
    dbo.tblWorksOn w
    INNER JOIN dbo.tblProject p ON w.proNum = p.proNum
GROUP BY
    p.proNum, p.proName
ORDER BY
    COUNT(w.empSSN) DESC;

-- 30.   Cho biết dự án nào có tổng số giờ làm là ít nhất. Thông tin yêu cầu: mã dự án, tên dự án, tổng số giờ làm
SELECT TOP 1
    p.proNum AS 'Mã dự án',
    p.proName AS 'Tên dự án',
    SUM(w.workHours) AS 'Tổng số giờ làm'
FROM
    dbo.tblWorksOn w
    INNER JOIN dbo.tblProject p ON w.proNum = p.proNum
GROUP BY
    p.proNum, p.proName
ORDER BY
    SUM(w.workHours);
 
--31.   Cho biết dự án nào có tổng số giờ làm là nhiều nhất. Thông tin yêu cầu: mã dự án, tên dự án, tổng số giờ làm
SELECT TOP 1
    p.proNum AS 'Mã dự án',
    p.proName AS 'Tên dự án',
    SUM(w.workHours) AS 'Tổng số giờ làm'
FROM
    dbo.tblWorksOn w
    INNER JOIN dbo.tblProject p ON w.proNum = p.proNum
GROUP BY
    p.proNum, p.proName
ORDER BY
    SUM(w.workHours) DESC;
 
--32.   Cho biết số lượng phòng ban làm việc theo mỗi nơi làm việc. Thông tin yêu cầu: tên nơi làm việc, số lượng phòng ban
 SELECT
    l.locName AS 'Tên nơi làm việc',
    COUNT(DISTINCT d.depNum) AS 'Số lượng phòng ban'
FROM
    dbo.tblDepLocation d
    INNER JOIN dbo.tblLocation l ON d.locNum = l.locNum
GROUP BY
    l.locName;

-- 33.   Cho biết số lượng chỗ làm việc theo mỗi phòng ban. Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng chỗ làm việc
 SELECT
    d.depNum AS 'Mã phòng ban',
    d.depName AS 'Tên phòng ban',
    COUNT(e.empSSN) AS 'Số lượng chỗ làm việc'
FROM
    dbo.tblEmployee e
    INNER JOIN dbo.tblDepartment d ON e.depNum = d.depNum
GROUP BY
    d.depNum, d.depName;

-- 34.   Cho biết phòng ban nào có nhiều chỗ làm việc nhất. Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng chỗ làm việc
 SELECT TOP 1
    d.depNum AS 'Mã phòng ban',
    d.depName AS 'Tên phòng ban',
    COUNT(e.empSSN) AS 'Số lượng chỗ làm việc'
FROM
    dbo.tblEmployee e
    INNER JOIN dbo.tblDepartment d ON e.depNum = d.depNum
GROUP BY
    d.depNum, d.depName
ORDER BY
    COUNT(e.empSSN) DESC;

-- 35.   Cho biết phòng ban nào có it chỗ làm việc nhất. Thông tin yêu cầu: mã phòng ban, tên phòng ban, số lượng chỗ làm việc
 SELECT TOP 1
    d.depNum AS 'Mã phòng ban',
    d.depName AS 'Tên phòng ban',
    COUNT(e.empSSN) AS 'Số lượng chỗ làm việc'
FROM
    dbo.tblEmployee e
    INNER JOIN dbo.tblDepartment d ON e.depNum = d.depNum
GROUP BY
    d.depNum, d.depName
ORDER BY
    COUNT(e.empSSN);

-- 36.   Cho biết địa điểm nào có nhiều phòng ban làm việc nhất. Thông tin yêu cầu: tên nơi làm việc, số lượng phòng ban
 SELECT TOP 1
    l.locName AS 'Tên nơi làm việc',
    COUNT(DISTINCT d.depNum) AS 'Số lượng phòng ban'
FROM
    dbo.tblDepLocation dl
    INNER JOIN dbo.tblLocation l ON dl.locNum = l.locNum
    INNER JOIN dbo.tblDepartment d ON dl.depNum = d.depNum
GROUP BY
    l.locName
ORDER BY
    COUNT(DISTINCT d.depNum) DESC;

-- 37.   Cho biết địa điểm nào có ít phòng ban làm việc nhất. Thông tin yêu cầu: tên nơi làm việc, số lượng phòng ban
 SELECT TOP 1
    l.locName AS 'Tên nơi làm việc',
    COUNT(DISTINCT d.depNum) AS 'Số lượng phòng ban'
FROM
    dbo.tblDepLocation dl
    INNER JOIN dbo.tblLocation l ON dl.locNum = l.locNum
    INNER JOIN dbo.tblDepartment d ON dl.depNum = d.depNum
GROUP BY
    l.locName
ORDER BY
    COUNT(DISTINCT d.depNum);

-- 38.   Cho biết nhân viên nào có nhiều người phụ thuộc nhất. Thông tin yêu cầu: mã số, họ tên nhân viên, số lượng người phụ thuộc
 SELECT TOP 1
    e.empSSN AS 'Mã số',
    e.empName AS 'Họ tên nhân viên',
    COUNT(*) AS 'Số lượng người phụ thuộc'
FROM
    dbo.tblEmployee e
    INNER JOIN dbo.tblDependent d ON e.empSSN = d.empSSN
GROUP BY
    e.empSSN, e.empName
ORDER BY
    COUNT(*) DESC;

-- 39.   Cho biết nhân viên nào có ít người phụ thuộc nhất. Thông tin yêu cầu: mã số, họ tên nhân viên, số lượng người phụ thuộc
SELECT TOP 1
    e.empSSN AS 'Mã số',
    e.empName AS 'Họ tên nhân viên',
    COUNT(d.empSSN) AS 'Số lượng người phụ thuộc'
FROM
    dbo.tblEmployee e
    LEFT JOIN dbo.tblDependent d ON e.empSSN = d.empSSN
GROUP BY
    e.empSSN, e.empName
ORDER BY
    COUNT(d.empSSN) ASC;
