#  Hospital Management System - SQL Server Project

##  Overview

This project is a complete SQL Server-based database solution for managing a hospital's daily operations. It includes:

- A normalized relational schema
- Views, triggers, procedures, and functions
- Sample data population (20+ per table)
- SQL Server Agent Jobs for automation
- Bonus automation tasks like alerts and exports

---

##  Database Schema

The following tables were created and populated:

- `Departments`
- `Patients`
- `Doctors`
- `Staff`
- `Rooms`
- `Appointments`
- `Admissions`
- `Billing`
- `MedicalRecords`
- `Users`

Each table includes appropriate primary keys, foreign keys, data types, and constraints (including check and unique).

---

##  Business Logic

###  Stored Procedures
- `sp_CheckDoctorOverload`: Checks if any doctor has more than 10 appointments/day and logs alerts.

###  Triggers
- Example: A trigger to automatically mark a room unavailable upon patient admission.

###  Functions
- Scalar and table-valued functions for computing stats or extracting subsets (e.g., available rooms).

---

##  Views

- `vw_PatientSummary`: Shows patient details with their latest visit.
- `vw_DoctorSchedule`: Summarizes today's appointments per doctor.
- `vw_DepartmentStats`: Counts doctors and patients per department.

---

##  Sample Data

20+ records inserted into each of the main entities:
- 20+ patients
- 20+ doctors
- 20+ staff
- 20+ rooms
- 20+ appointments, billing, admissions, medical records

Populated using `INSERT` DML statements in `HospitalDB_SampleData_DML.sql`.

---

## SQL Server Agent Jobs

### Job 1: Daily Backup
- **Name**: `Daily_HospitalDB_Backup`
- **Time**: Daily at 2:00 AM
- **Action**: Performs full backup to `C:\Backups\HospitalDB_backup.bak`

### Job 2: Weekly Billing Export
- **Name**: `Weekly_Billing_Export_V2`
- **Time**: Every Sunday at 6:00 AM
- **Action**: Exports `Billing` table to CSV using `bcp` via `xp_cmdshell`

### Bonus: Doctor Overload Alert
- **Stored Procedure**: `sp_CheckDoctorOverload`
- **Logic**: Identifies doctors with >10 appointments/day and logs alerts

---

## Execution Logs

- Manual executions of the jobs were tested using:
```sql
EXEC msdb.dbo.sp_start_job @job_name = 'YourJobName';
