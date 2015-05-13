if ((select count(1) from sys.views where name = 'vw_Surname' and SCHEMA_NAME(schema_id) = 'Names') = 0)
BEGIN
	EXECUTE(N'
	CREATE VIEW [Names].[vw_Surname]
	AS
	select
		Surname_ID
		,Surname=case (charindex('''', surname))
			when 0 then upper(substring(surname,1,1)) + lower(substring(surname,2,49))
			when 2 then upper(substring(surname,1,1)) + '''' + upper(substring(surname,3,1)) + lower(substring(surname,4,47))
			else upper(substring(surname,1,1)) + lower(substring(surname,2,49))
		end
		,Count
	from
		names.surname')
END
GO