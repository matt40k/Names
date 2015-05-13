if ((select count(1) from sys.schemas where name = 'Names') = 0)
BEGIN
	EXEC sp_executesql N'CREATE SCHEMA [Names] AUTHORIZATION [dbo]'
END
GO
