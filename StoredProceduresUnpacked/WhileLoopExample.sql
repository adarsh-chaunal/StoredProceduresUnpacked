alter proc dbo.Count20By2
as
begin
    declare @i int;
    set @i = 2;
    while @i <= 20  begin
        print 'Current count: ' + cast(@i as varchar);
        set @i += 2;
    end

end