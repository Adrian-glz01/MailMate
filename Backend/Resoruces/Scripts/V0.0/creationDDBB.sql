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
CREATE LOGIN mailmate_user WITH PASSWORD = 'mailmateSECPASS123@';
CREATE USER mailmate_user FOR LOGIN mailmate_user;
ALTER ROLE db_datareader ADD MEMBER mailmate_user;
ALTER ROLE db_datawriter ADD MEMBER mailmate_user;