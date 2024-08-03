-- structured error handling
declare @a float, @b float, @c float;

set @a = 10;
set @b = 0;

begin try
    set @c = @a / @b;
    print @c;
end try
begin catch
    set @b = 2;
    set @c = @a / @b;
    print @c;
end catch


-- unstructure error handling
declare @a float = 10, @b float = 0, @c float;

set @c = @a / @b;

if (@@error <> 0) begin
    set @b = 2;
    set @c = @a / @b;
end

print @c
GO