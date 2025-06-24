
-- Sample Departments
INSERT INTO Departments VALUES 
(1, 'Cardiology'), (2, 'Neurology'), (3, 'Pediatrics'), (4, 'Orthopedics'), 
(5, 'Emergency'), (6, 'Oncology'), (7, 'Radiology'), (8, 'Dermatology'), 
(9, 'ENT'), (10, 'General Medicine');

DELETE FROM Departments WHERE name IN ('Cardiology', 'Neurology', 'Pediatrics', 'Orthopedics', 
                                       'Emergency', 'Oncology', 'Radiology', 'Dermatology', 'ENT', 'General Medicine');

									   -- Step 1: Remove staff linked to these departments
SELECT * FROM Staff
WHERE department_id IN (
    SELECT department_id
    FROM Departments
    WHERE name IN ('Cardiology', 'Neurology', 'Pediatrics', 'Orthopedics', 
                   'Emergency', 'Oncology', 'Radiology', 'Dermatology', 'ENT', 'General Medicine')
);

DELETE FROM Staff
WHERE staff_id = 201;

-- Disable constraint temporarily (example)
ALTER TABLE Staff NOCHECK CONSTRAINT ALL;

-- Run your delete
DELETE FROM Staff
WHERE department_id IN (
    SELECT department_id FROM Departments
    WHERE name IN (
        'Cardiology', 'Neurology', 'Pediatrics', 'Orthopedics',
        'Emergency', 'Oncology', 'Radiology', 'Dermatology',
        'ENT', 'General Medicine'
    )
);

-- Re-enable constraints
ALTER TABLE Staff CHECK CONSTRAINT ALL;



-- Step 2: Now you can safely delete from Departments
DELETE FROM Departments
WHERE name IN ('Cardiology', 'Neurology', 'Pediatrics', 'Orthopedics', 
               'Emergency', 'Oncology', 'Radiology', 'Dermatology', 'ENT', 'General Medicine');

			   SELECT 
    request_session_id AS SessionID,
    resource_type,
    resource_description,
    request_mode,
    request_status
FROM sys.dm_tran_locks
WHERE resource_associated_entity_id = OBJECT_ID('Staff');

DELETE FROM Staff WHERE staff_id = 201;

SELECT * FROM Admissions WHERE staff_id = 201;
SELECT * FROM Users WHERE staff_id = 201;


SELECT * 
FROM sys.dm_exec_requests 
WHERE status = 'running';




SELECT patient_id FROM Patients ORDER BY patient_id;




-- Sample Rooms
INSERT INTO Rooms VALUES
(1011, 'ICU', 1), (102, 'General', 1), (103, 'Private', 1), (104, 'ICU', 1), (105, 'General', 1),
(1062, 'Private', 1), (107, 'General', 1), (108, 'ICU', 1), (109, 'General', 1), (110, 'Private', 1),
(1112, 'General', 1), (112, 'Private', 1), (113, 'General', 1), (114, 'ICU', 1), (115, 'General', 1),
(1161, 'Private', 1), (117, 'ICU', 1), (118, 'General', 1), (119, 'Private', 1), (120, 'General', 1);



-- Sample Staff
INSERT INTO Staff VALUES 
(1, 'Nurse Mariam', 'Nurse', 'Morning', 1),
(2, 'Admin Fawzi', 'Admin', 'Morning', 1),
(3, 'Tech Samir', 'Technician', 'Night', 2),
(4, 'Nurse Laila', 'Nurse', 'Evening', 2),
(5, 'Support Jameel', 'Support', 'Morning', 3),
(6, 'Nurse Nada', 'Nurse', 'Morning', 4),
(7, 'Admin Basma', 'Admin', 'Evening', 5),
(8, 'Support Khamis', 'Support', 'Night', 6),
(9, 'Tech Hatem', 'Technician', 'Night', 7),
(10, 'Nurse Nawal', 'Nurse', 'Morning', 8),
(11, 'Admin Tariq', 'Admin', 'Evening', 9),
(12, 'Nurse Amina', 'Nurse', 'Morning', 10),
(13, 'Tech Faisal', 'Technician', 'Night', 1),
(14, 'Nurse Dalia', 'Nurse', 'Evening', 2),
(15, 'Support Adel', 'Support', 'Morning', 3),
(16, 'Nurse Shaima', 'Nurse', 'Morning', 4),
(17, 'Admin Saif', 'Admin', 'Evening', 5),
(18, 'Tech Mazin', 'Technician', 'Night', 6),
(19, 'Support Waleed', 'Support', 'Night', 7),
(20, 'Nurse Amal', 'Nurse', 'Morning', 8);



