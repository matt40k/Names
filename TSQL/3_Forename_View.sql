if ((select count(1) from sys.views where name = 'vw_Forename' and SCHEMA_NAME(schema_id) = 'Names') = 0)
BEGIN
	EXECUTE(N'
	CREATE VIEW [Names].[vw_Forename]
	AS
	select
		Forename_ID
		,Forename=case (charindex('''', forename))
			when 0 then upper(substring(forename,1,1)) + lower(substring(forename,2,49))
			when 2 then upper(substring(forename,1,1)) + '''' + upper(substring(forename,3,1)) + lower(substring(forename,4,47))
			else upper(substring(forename,1,1)) + lower(substring(forename,2,49))
		end
		,Count
	from
		names.forename')
END
GO