USE HOSPITAL;
GO

CREATE PROCEDURE sp_CheckDoctorOverload
AS
BEGIN
    DECLARE @Body NVARCHAR(MAX)

    IF EXISTS (
        SELECT doctor_id, appointment_date, COUNT(*) AS appointment_count
        FROM Appointments
        GROUP BY doctor_id, appointment_date
        HAVING COUNT(*) > 10
    )
    BEGIN
        SET @Body = 'Alert: One or more doctors have more than 10 appointments today.'

        EXEC msdb.dbo.sp_send_dbmail
            @profile_name = 'mohammedyk',
            @recipients = 'mohammedyk7@gmail.com',
            @subject = 'Doctor Appointment Overload Alert',
            @body = @Body;
    END
END;


SELECT TOP 5 * FROM Appointments;

USE HOSPITAL;
GO

CREATE OR ALTER PROCEDURE sp_CheckDoctorOverload
AS
BEGIN
    DECLARE @Body NVARCHAR(MAX);

    IF EXISTS (
        SELECT doctor_id, CAST([datetime] AS DATE) AS appointment_day, COUNT(*) AS appointment_count
        FROM Appointments
        GROUP BY doctor_id, CAST([datetime] AS DATE)
        HAVING COUNT(*) > 10
    )
    BEGIN
        SET @Body = '⚠️ Alert: One or more doctors have more than 10 appointments today.';

        EXEC msdb.dbo.sp_send_dbmail
            @profile_name = 'YourMailProfile',  -- 🔁 Replace with your real Database Mail profile name
            @recipients = 'admin@example.com',  -- 🔁 Replace with your target email
            @subject = 'Doctor Appointment Overload Alert',
            @body = @Body;
    END
END;

-- Enable advanced options
EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;

-- Enable xp_cmdshell
EXEC sp_configure 'xp_cmdshell', 1;
RECONFIGURE;

USE msdb;
GO

-- Step 1: Create the Job
EXEC sp_add_job
@job_name = N'Weekly_Billing_Export_V2'

GO

EXEC sp_add_jobstep  
    @job_name = N'Weekly_Billing_Export_V2',   -- ✅ comma added here
    @step_name = N'Export Billing to CSV',  
    @subsystem = N'TSQL',  
    @command = N'
        EXEC xp_cmdshell ''bcp "SELECT * FROM HOSPITAL.dbo.Billing" queryout "C:\Backups\BillingExport.csv" -c -t, -T -S DESKTOP-LGMTEMH''  
    ';
GO


-- Step 3: Create the Weekly Schedule (Sunday 6:00 AM)
EXEC sp_add_schedule  
    @schedule_name = N'Every_Sunday_6AM',  
    @freq_type = 8,  -- Weekly  
    @freq_interval = 1,  -- Sunday (1 = Sunday)  
    @freq_recurrence_factor = 1, -- Every 1 week  
    @active_start_time = 060000;  -- 6:00 AM
GO

EXEC sp_attach_schedule  
    @job_name = N'Weekly_Billing_Export_V2',   -- ← Add comma here
    @schedule_name = N'Every_Sunday_6AM';
GO

-- Step 5: Add Job to SQL Server Agent
EXEC sp_add_jobserver  
  @job_name = N'Weekly_Billing_Export_V2'

GO


-- Replace with your actual job name
EXEC msdb.dbo.sp_start_job @job_name = N'Weekly_Billing_Export_V2';





EXEC msdb.dbo.sp_help_jobhistory 
    @job_name = N'Weekly_Billing_Export_V2';






--delted export v1 so i can apply the v2 

USE msdb;
GO
EXEC sp_delete_job @job_name = N'Weekly_Billing_Export';
