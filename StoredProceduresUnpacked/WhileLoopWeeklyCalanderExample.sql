alter proc dbo.WeekCreate
as
begin
    declare @myTable table(weekNumber int, dateStarting smallDateTime);

    declare @n int = 0;
    declare @firstWeek smallDateTime = '12/31/2023'

    --while @n <= 52
    while 1 = 1 -- doing this to use break command
    begin
        insert into @myTable values (@n, DATEADD(wk, @n, @firstWeek));
        select @n += 1;

        if @n > 52 break;
    end

    Select *
    from @myTable
end