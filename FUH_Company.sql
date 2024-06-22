﻿USE [master]
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
SELECT * FROM dbo.tblDepartment;
SELECT * FROM dbo.tblDependent;
SELECT * FROM dbo.tblDepLocation;
SELECT * FROM dbo.tblEmployee;
SELECT * FROM dbo.tblLocation;
SELECT * FROM dbo.tblProject;
SELECT * FROM dbo.tblWorksOn;
-- Câu 3	
select 
	e.empSSN as [Mã số nhân viên],
	e.empName as [Tên nhân viên]
from dbo.tblEmployee e

JOIN dbo.tblEmployee sup ON e.supervisorSSN = sup.empSSN
where sup.empName = N'Mai Duy An'