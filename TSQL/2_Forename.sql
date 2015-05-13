if ((select count(1) from sys.tables where name = 'Forename' and SCHEMA_NAME(schema_id) = 'Names') = 0)
BEGIN
	CREATE TABLE [Names].[Forename] (
		[Forename_ID] [int] identity(1,1) NOT NULL PRIMARY KEY
		,[Forename] varchar(50) NOT NULL
		,[Count] varchar(5) NOT NULL
	)
END
ELSE
BEGIN
	TRUNCATE TABLE [Names].[Forename]
END
GO