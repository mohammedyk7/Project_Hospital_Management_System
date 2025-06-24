USE msdb;
GO

-- Step 1: Create the job
EXEC sp_add_job  
    @job_name = N'Daily_HospitalDB_Backup';  
GO

-- Step 2: Add a job step to back up the HOSPITAL database
EXEC sp_add_jobstep  
    @job_name = N'Daily_HospitalDB_Backup',  
    @step_name = N'Backup Hospital DB',  
    @subsystem = N'TSQL',  
    @command = N'
        BACKUP DATABASE [HOSPITAL]
        TO DISK = N''C:\Backups\HospitalDB_backup.bak''
        WITH NOFORMAT, INIT, NAME = ''Full Backup'', SKIP, NOREWIND, NOUNLOAD, STATS = 10;
    ',  
    @retry_attempts = 1,  
    @retry_interval = 5;  
GO

-- Step 3: Schedule the job daily at 2:00 AM
EXEC sp_add_schedule  
    @schedule_name = N'Daily_2AM',  
    @freq_type = 4,  -- daily  
    @freq_interval = 1,  
    @active_start_time = 020000;  -- 2:00 AM  
GO

-- Step 4: Attach the schedule to the job
EXEC sp_attach_schedule  
   @job_name = N'Daily_HospitalDB_Backup',  
   @schedule_name = N'Daily_2AM';  
GO

-- Step 5: Add the job to SQL Server Agent
EXEC sp_add_jobserver  
    @job_name = N'Daily_HospitalDB_Backup';  
GO

USE msdb;
GO

-- Delete all schedules named 'Daily_2AM'
DECLARE @schedule_id INT;

WHILE EXISTS (
    SELECT 1 FROM msdb.dbo.sysschedules WHERE name = 'Daily_2AM'
)
BEGIN
    SELECT TOP 1 @schedule_id = schedule_id
    FROM msdb.dbo.sysschedules
    WHERE name = 'Daily_2AM';

    EXEC sp_delete_schedule @schedule_id = @schedule_id;
END
GO

-- Step 3: Schedule the job daily at 2:00 AM
EXEC sp_add_schedule  
    @schedule_name = N'Daily_2AM',  
    @freq_type = 4,  
    @freq_interval = 1,  
    @active_start_time = 020000;
	 --fixeddd