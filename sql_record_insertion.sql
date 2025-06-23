INSERT INTO Departments VALUES
(1, 'Cardiology'), (2, 'Dermatology'), (3, 'Pediatrics'), (4, 'Neurology'), (5, 'Oncology');

-- Doctors
INSERT INTO Doctors VALUES
(1, 'Dr. Smith', 'Cardiologist', '1234567890', 1),
(2, 'Dr. John', 'Dermatologist', '1234567891', 2),
(3, 'Dr. Alice', 'Pediatrician', '1234567892', 3),
(4, 'Dr. Lee', 'Neurologist', '1234567893', 4),
(5, 'Dr. Clark', 'Oncologist', '1234567894', 5);

-- Patients
INSERT INTO Patients VALUES
(1, 'Alice', '1990-01-01', 'Female', '9991110000'),
(2, 'Bob', '1985-02-15', 'Male', '9991110001'),
(3, 'Cathy', '1978-03-22', 'Female', '9991110002'),
(4, 'David', '1992-04-10', 'Male', '9991110003'),
(5, 'Eva', '2000-05-30', 'Female', '9991110004'),
(6, 'Frank', '1991-06-18', 'Male', '9991110005'),
(7, 'Grace', '1995-07-07', 'Female', '9991110006'),
(8, 'Henry', '1980-08-25', 'Male', '9991110007'),
(9, 'Isla', '1993-09-13', 'Female', '9991110008'),
(10, 'Jack', '1988-10-29', 'Male', '9991110009');

-- Rooms
INSERT INTO Rooms VALUES
(101, 'ICU', 1), (102, 'General', 1), (103, 'ICU', 1), (104, 'General', 1), (105, 'ICU', 1);

-- Admissions
INSERT INTO Admissions VALUES
(1, 1, 101, '2024-06-01', '2024-06-05'),
(2, 2, 102, '2024-06-02', '2024-06-06');

-- Appointments
INSERT INTO Appointments VALUES
(1, 1, 1, '2024-06-01 10:00'), (2, 2, 2, '2024-06-02 11:00'), (3, 3, 3, '2024-06-03 09:00'),
(4, 4, 1, '2024-06-04 14:00'), (5, 5, 2, '2024-06-05 13:00');

-- MedicalRecords
INSERT INTO MedicalRecords VALUES
(1, 1, 1, 'Hypertension', 'Medication A', '2024-06-01'),
(2, 2, 2, 'Eczema', 'Ointment X', '2024-06-02');

-- Billing
INSERT INTO Billing VALUES
(1, 1, 250.00, 'Consultation + Medication', '2024-06-01'),
(2, 2, 180.00, 'Consultation + Ointment', '2024-06-02');

-- Staff
INSERT INTO Staff VALUES
(1, 'Nurse Joy', 'Nurse', 'Day', 1),
(2, 'Admin Max', 'Admin', 'Night', 2);

-- Users
INSERT INTO Users VALUES
(1, 'doctor1', 'pass123', 'DoctorUser'),
(2, 'admin1', 'adminpass', 'AdminUser');