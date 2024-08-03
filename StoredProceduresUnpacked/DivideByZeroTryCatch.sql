create proc dbo.divideByZeroTryCatch
as 
begin

print 'Stored procedure starts'

begin try
    select 1/0
end try
begin catch
    select 
        ERROR_NUMBER() as ErrorNumber,
        ERROR_SEVERITY() as ErrorSeverity,
        ERROR_STATE() as ErrorState,
        ERROR_PROCEDURE() as ErrorProcedure,
        ERROR_LINE() as ErrorLine,
        ERROR_MESSAGE() as ErrorMessage

    print 'Divide by Zero Error!'
end catch
    print 'Stored procedure completed'
end
