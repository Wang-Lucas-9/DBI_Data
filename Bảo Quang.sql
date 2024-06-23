USE [master]
GO

/****** Object:  Database [FUH_COMPANY]    Script Date: 6/20/2024 10:41:29 PM ******/
CREATE DATABASE [FUH_COMPANY]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'I2DBCOMPANY', FILENAME = N'D:\LAB3_DBI\FUH_COMPANY.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'I2DBCOMPANY_log', FILENAME = N'D:\LAB3_DBI\FUH_COMPANY_1.ldf' , SIZE = 8384KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FUH_COMPANY].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO

ALTER DATABASE [FUH_COMPANY] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [FUH_COMPANY] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [FUH_COMPANY] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [FUH_COMPANY] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [FUH_COMPANY] SET ARITHABORT OFF 
GO

ALTER DATABASE [FUH_COMPANY] SET AUTO_CLOSE ON 
GO

ALTER DATABASE [FUH_COMPANY] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [FUH_COMPANY] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [FUH_COMPANY] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [FUH_COMPANY] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [FUH_COMPANY] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [FUH_COMPANY] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [FUH_COMPANY] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [FUH_COMPANY] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [FUH_COMPANY] SET  DISABLE_BROKER 
GO

ALTER DATABASE [FUH_COMPANY] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [FUH_COMPANY] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [FUH_COMPANY] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [FUH_COMPANY] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [FUH_COMPANY] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [FUH_COMPANY] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [FUH_COMPANY] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [FUH_COMPANY] SET RECOVERY FULL 
GO

ALTER DATABASE [FUH_COMPANY] SET  MULTI_USER 
GO

ALTER DATABASE [FUH_COMPANY] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [FUH_COMPANY] SET DB_CHAINING OFF 
GO

ALTER DATABASE [FUH_COMPANY] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [FUH_COMPANY] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [FUH_COMPANY] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [FUH_COMPANY] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [FUH_COMPANY] SET QUERY_STORE = OFF
GO

ALTER DATABASE [FUH_COMPANY] SET  READ_WRITE 
GO

USE FUH_COMPANY;
GO
SELECT * FROM dbo.tblProject;
SELECT * FROM dbo.tblDepartment;
SELECT * FROM dbo.tblDependent;
SELECT * FROM dbo.tblDepLocation;
SELECT * FROM dbo.tblEmployee;
SELECT * FROM dbo.tblLocation;
SELECT * FROM dbo.tblProject;
SELECT * FROM dbo.tblWorksOn;


--- Câu 1
SELECT 
    e.empSSN AS [Mã số nhân viên],
    e.empName AS [Họ tên nhân viên],
    d.mgrSSN AS [Mã số phòng ban],
    d.depName AS [Tên phòng ban]
FROM
    dbo.tblEmployee e
JOIN 
    dbo.tblDepartment d ON e.empSSN = d.mgrSSN
WHERE 
    d.depName = N'Phòng Nghiên cứu và phát triển';

--- Câu 2
SELECT 
    d.proNum AS [Mã số dự án],
    d.proName AS [Tên dự án],
    e.depName AS [Tên phòng ban]
FROM
    dbo.tblDepartment e
JOIN 
    dbo.tblProject d ON e.depNum = d.depNum
WHERE 
    e.depName = N'Phòng Nghiên cứu và phát triển';
-- Câu 3
SELECT 
    p.proNum AS [Mã số dự án],
    p.proName AS [Tên dự án],
    d.depName AS [Tên phòng ban quản lý]
FROM 
    dbo.tblProject p
INNER JOIN 
    dbo.tblDepartment d ON p.depNum = d.depNum
WHERE 
    p.proName = N'ProjectB';

-- Câu 4
select 
	e.empSSN as [Mã số nhân viên],
	e.empName as [Tên nhân viên]
from dbo.tblEmployee e

JOIN dbo.tblEmployee sup ON e.supervisorSSN = sup.empSSN
where sup.empName = N'Mai Duy An'

--Câu 5
SELECT 
    supervisor.empSSN AS [Mã số nhân viên giám sát],
    supervisor.empName AS [Họ tên nhân viên giám sát]
FROM 
    dbo.tblEmployee e
INNER JOIN 
    dbo.tblEmployee supervisor ON e.supervisorSSN = supervisor.empSSN
WHERE 
    e.empName = N'Mai Duy An';
-- Câu 6
SELECT 
    p.proNum AS [Mã số dự án],
    p.proName AS [Tên vị trí làm việc]
FROM 
    dbo.tblProject p
INNER JOIN 
    dbo.tblLocation l ON p.proNum = l.locNum
WHERE 
    p.proName = N'ProjectA';
-- Câu 7
SELECT 
    p.proNum AS [Mã số dự án],
    p.proName AS [Tên dự án]
FROM 
    dbo.tblProject p
INNER JOIN 
    dbo.tblLocation l ON p.locNum = l.locNum
WHERE 
    l.locName = N'Tp Hồ Chí Minh';
-- Câu 8
SELECT 
	d.depName as [Tên],
	d.depBirthdate as [Ngày tháng năm sinh],
	e.empName as [Tên người phụ thuộc vào]
FROM dbo.tblDependent d
JOIN dbo.tblEmployee e ON e.empSSN = d.empSSN
WHERE 
	d.depBirthdate > 18

-- Câu 9
select 
	d.depName as [Tên],
	d.depBirthdate as [Ngày tháng năm sinh],
	e.empName as [Tên người phụ thuộc vào]
from dbo.tblDependent d
JOIN dbo.tblEmployee e ON d.empSSN = e.empSSN
where d.depSex = 'M'

-- Câu 10
select
	d.mgrSSN as [Mã phòng ban],
	d.depName as [Tên phòng ban],
	l.locName as [Nơi làm việc]
from tblDepartment d
INNER JOIN dbo.tblDepLocation dl ON d.depNum = dl.depNum
INNER JOIN dbo.tblLocation l ON dl.locNum = l.locNum
where d.depName = N'Phòng Nghiên cứu và phát triển'

-- Câu 11
select
	p.proNum  as [Mã dự án],
	p.proName as [Tên dự án],
	d.depName as [Phòng ban chịu trách nhiệm]
from tblLocation l
INNER JOIN dbo.tblProject p ON p.locNum = l.locNum
INNER JOIN dbo.tblDepartment d ON p.depNum = d.depNum
where l.locName = N'TP Hồ Chí Minh'

--Câu 12
select * from tblDepartment
select * from tblDependent
select * from tblEmployee
select 
	e.empName as [Tên nhân viên],
	de.depName as [Tên người phụ thuộc],
	de.depRelationship as [Mối liên hệ]
from dbo.tblDependent de
INNER JOIN dbo.tblEmployee e ON de.empSSN = e.empSSN
INNER JOIN dbo.tblDepartment d ON d.depNum = e.depNum
where de.depSex = 'F' AND d.depName = N'Phòng Nghiên cứu và phát triển'

-- Câu 13
select * from tblDepartment
select * from tblDependent
select * from tblEmployee
select 
	e.empName as [Tên nhân viên],
	de.depName as [Tên người phụ thuộc],
	de.depRelationship as [Mối liên hệ]
from dbo.tblDependent de
INNER JOIN dbo.tblEmployee e ON de.empSSN = e.empSSN
INNER JOIN dbo.tblDepartment d ON d.depNum = e.depNum
where DATEDIFF(YEAR, depBirthdate, GETDATE()) > 18  AND d.depName = N'Phòng Nghiên cứu và phát triển'
