
-- 1. Create SQL Server login users , replace with real usernames ant passwords 
-- for example 


-- CREATE LOGIN DoctorUserLogin WITH PASSWORD = 'StrongPassword123!';
-- CREATE LOGIN AdminUserLogin WITH PASSWORD = 'StrongPassword456!';

-- 2. Create database users from logins
-- (Assume you're inside the correct database context)
CREATE USER DoctorUser FOR LOGIN DoctorUserLogin;
CREATE USER AdminUser FOR LOGIN AdminUserLogin;

-- 3. GRANT SELECT permissions to DoctorUser on Patients and Appointments
GRANT SELECT ON Patients TO DoctorUser;
GRANT SELECT ON Appointments TO DoctorUser;

-- 4. GRANT INSERT, UPDATE permissions to AdminUser on all tables
--حال كل الجداول نسوي انسرت حال الadmin user 
GRANT INSERT, UPDATE ON Patients TO AdminUser;
GRANT INSERT, UPDATE ON Doctors TO AdminUser;
GRANT INSERT, UPDATE ON Departments TO AdminUser;
GRANT INSERT, UPDATE ON Appointments TO AdminUser;
GRANT INSERT, UPDATE ON MedicalRecords TO AdminUser;
GRANT INSERT, UPDATE ON Billing TO AdminUser;
GRANT INSERT, UPDATE ON Rooms TO AdminUser;
GRANT INSERT, UPDATE ON Admissions TO AdminUser;
GRANT INSERT, UPDATE ON Staff TO AdminUser;
GRANT INSERT, UPDATE ON Users TO AdminUser;

-- 5. REVOKE DELETE permission from all users assigned to DoctorUser role
--نلغي ال permisson
REVOKE DELETE ON Patients TO DoctorUser;
REVOKE DELETE ON Doctors TO DoctorUser;
REVOKE DELETE ON Appointments TO DoctorUser;
REVOKE DELETE ON MedicalRecords TO DoctorUser;
REVOKE DELETE ON Billing TO DoctorUser;
REVOKE DELETE ON Admissions TO DoctorUser;
REVOKE DELETE ON Rooms TO DoctorUser;
REVOKE DELETE ON Departments TO DoctorUser;
REVOKE DELETE ON Staff TO DoctorUser;
REVOKE DELETE ON Users TO DoctorUser;
