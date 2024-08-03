create table dbo.log
(
    LogName varchar(255) not null,
    LogDate datetime not null,
    LogMessage nvarchar(max) null
)

create index IdxLogNameLogDate on dbo.log (LogName, LogDate)

--select * 
--from log
--where LogName = 'GetAverageEmployeeVacationHours'
--order by logdate desc