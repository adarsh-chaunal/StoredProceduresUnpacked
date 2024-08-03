create proc dbo.DivideErrorCheck
as
begin

    declare @a float = 10.0,
            @b float = 2.0,
            @c float;

    set @c = @a / @b;

    if @@ERROR != 0 print 'Result: Division Error';
    else print 'Result: ' + cast(@c as VARCHAR);

    set @b = 0.0;
    set @c = @a/@b;
    if @@ERROR != 0 print 'Result: Division Error';
    else print 'Result: ' + cast(@c as VARCHAR);

end

--select * 
--from sys.messages
--order by message_id