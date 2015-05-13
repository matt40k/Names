# Names

This contains two CSV files, forenames and surnames. They are the top 1000 names from the Autumn school census 2014 which was requested from the Department of Education (DfE) under the Freedom of Information Act 2000. The data also includes name count.

The data is licensed by the DfE under the Open Government Licence (http://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/).

Data was requested via the very excellent [What Do They Know](https://www.whatdotheyknow.com/). The original request can be view [here](https://www.whatdotheyknow.com/request/popular_forenames?nocache=incoming-650967#incoming-650967).

I have created a simple SSIS package that I used to load the data into MS-SQL Server database, I have then scripted out the data and produced a single combined file - https://github.com/matt40k/Names/blob/master/TSQL/Names_combined.sql - this includes the data as well as stored procedure that allows you to generate random names from the two.

To generate a random name
> EXEC Names.USP_Random_Names

You can also pass a int to define the quantity of names to be created, such as 
> EXEC Names.USP_Random_Names @Count=1000

You can also just pass the int
> EXEC Names.USP_Random_Names 10
