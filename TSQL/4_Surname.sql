if ((select count(1) from sys.tables where name = 'Surname' and SCHEMA_NAME(schema_id) = 'Names') = 0)
BEGIN
	CREATE TABLE [Names].[Surname] (
		[Surname_ID] [int] identity(1,1) NOT NULL PRIMARY KEY
		,[Surname] varchar(50) NOT NULL
		,[Count] varchar(5) NOT NULL
	)
END
ELSE
BEGIN
	TRUNCATE TABLE [Names].[Surname]
END
GO
