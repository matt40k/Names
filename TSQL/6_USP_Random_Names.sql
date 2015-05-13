if ((select count(1) from sys.procedures where name = 'USP_Random_Names' and SCHEMA_NAME(schema_id) = 'Names') <> 0)
	DROP PROCEDURE [Names].[USP_Random_Names]
go
-- =============================================
-- Author:		Matt Smith
-- Create date: 12 May 2015
-- Description:	Creates random names
-- =============================================
CREATE PROCEDURE [Names].[USP_Random_Names]
	@Count int = 1
AS
BEGIN
	SET NOCOUNT ON;

	IF OBJECT_ID('tempdb..#names') IS NOT NULL
		DROP TABLE #names
	CREATE TABLE #names(
			name varchar(101)
			,forename varchar(50)
			,surname varchar(50)
		)
	 
	declare @counter int
	set @counter = 0
	while @counter < @Count
	BEGIN
	
		declare @maxRandValue1 smallint
		declare @maxRandValue2 smallint
		declare @minRandValue smallint = 0
		declare @surname varchar(50)
		declare @forename varchar(50)
		
		declare @forenameInt smallint
		declare @surnameInt smallint
		
		Set @maxRandValue1 = (select count(1) from Names.vw_Forename)
		Set @maxRandValue2 = (select count(1) from Names.vw_Surname)
		
		Set @forenameInt = (select cast(((@maxRandValue1 + 1) - @minRandValue) * Rand() + @minRandValue As smallint))
		Set @surnameInt = (select cast(((@maxRandValue2 + 1) - @minRandValue) * Rand() + @minRandValue As smallint))
		
		Set @forename = (select forename from Names.vw_Forename where Forename_ID = @forenameInt)
		Set @surname = (select surname from Names.vw_Surname where Surname_ID = @surnameInt)
		
		insert into #names (name, forename, surname) select @forename + ' ' + @surname, @forename, @surname
		
		set @counter = @counter + 1
	end
	
	select name, forename, surname from #names

END
GO
