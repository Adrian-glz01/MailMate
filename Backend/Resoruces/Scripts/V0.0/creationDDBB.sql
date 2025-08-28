-- Creamos la base de datos MailMateDB
CREATE DATABASE MailMateDB
GO 

USE MailMateDB
GO

-- Creamos la tabla User
CREATE TABLE Users (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Name NVARCHAR(100) NOT NULL,
	Email NVARCHAR(100) UNIQUE NOT NULL
);
GO

-- Habilitar login SQL Server
CREATE LOGIN mailm_user WITH PASSWORD = 'mailmateSECPASS123!';
CREATE USER mailm_user FOR LOGIN mailm_user;
ALTER ROLE db_datareader ADD MEMBER mailm_user;
ALTER ROLE db_datawriter ADD MEMBER mailm_user;