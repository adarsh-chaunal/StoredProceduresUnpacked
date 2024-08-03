CREATE PROCEDURE dbo.GetAverageEmployeeVacationHours
AS
BEGIN TRY
    declare @logMsg varchar(max);
    declare @logKey varchar(255) = 'GetAverageEmployeeVacationHours';
    declare @now as datetime;

    declare @totalHours float,
            @totalEmployees float,
            @avgHours float;

    select @totalHours = sum(vacationHours)
    from HumanResources.Employee;

    select @totalEmployees = count(*)
    from HumanResources.Employee
    where HireDate > '2020-01-01';

    set @AvgHours = @TotalHours / @TotalEmployees;

    print 'Average Vacation Hours For Employees Are: ' + cast(@AvgHours as varchar);
END TRY
BEGIN CATCH
    set @now = getdate();
    set @logMsg = 'Error: ' + cast(ERROR_NUMBER() as varchar(50))
            + ' State' + cast(ERROR_STATE() as varchar(50))
            + ' Proc : ' + cast(isnull(ERROR_PROCEDURE(), '') as varchar(100))
            + ' Msg : ' + cast(isnull(ERROR_MESSAGE(), '') as varchar(max))

    insert into dbo.log (LogName, LogDate, LogMessage)
        values (@LogKey, @now, @logMsg);

    throw;
END CATCH