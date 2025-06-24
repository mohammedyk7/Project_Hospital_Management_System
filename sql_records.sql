
-- Sample Doctors 
INSERT INTO Doctors (doctor_id, name, specialization, phone, email, department_id)
VALUES
(2001, 'Dr. Marvin Taylor', 'Cardiologist', '565892760', 'doctor2001@example.com', 102),
(2002, 'Dr. Tonya Sullivan', 'Neurologist', '744995656', 'doctor2002@example.com', 103),
(2003, 'Dr. Nicole Davis', 'Pediatrician', '991562822', 'doctor2003@example.com', 104),
(2004, 'Dr. Adam Chan', 'Orthopedic', '120105766', 'doctor2004@example.com', 105),
(2005, 'Dr. Jade Huerta', 'General Practitioner', '065933455', 'doctor2005@example.com', 106),
(2006, 'Dr. Paige Neal', 'Dermatologist', '581767968', 'doctor2006@example.com', 107),
(2007, 'Dr. Kristy Tate', 'Radiologist', '548986017', 'doctor2007@example.com', 108),
(2008, 'Dr. Kelly Johnson', 'Oncologist', '788847613', 'doctor2008@example.com', 109),
(2009, 'Dr. Greg Mason', 'ENT Specialist', '284571728', 'doctor2009@example.com', 110),
(2010, 'Dr. Brenda Rosales', 'Emergency Medicine', '168366033', 'doctor2010@example.com', 101),
(2011, 'Dr. Sandra Medina', 'Psychiatrist', '176312025', 'doctor2011@example.com', 102),
(2012, 'Dr. William Hampton', 'Endocrinologist', '339058286', 'doctor2012@example.com', 103),
(2013, 'Dr. Thomas Peterson', 'Pulmonologist', '025822923', 'doctor2013@example.com', 104),
(2014, 'Dr. William Jenkins', 'Gastroenterologist', '176749301', 'doctor2014@example.com', 105),
(2015, 'Dr. Jill Weaver', 'Nephrologist', '974564540', 'doctor2015@example.com', 106),
(2016, 'Dr. Dana Martin', 'Urologist', '538273040', 'doctor2016@example.com', 107),
(2017, 'Dr. Michael Herrera', 'Allergist', '014793707', 'doctor2017@example.com', 108),
(2018, 'Dr. Richard Mayer', 'Rheumatologist', '019989401', 'doctor2018@example.com', 109),
(2019, 'Dr. Christina Nguyen', 'Surgeon', '213490937', 'doctor2019@example.com', 110),
(2020, 'Dr. Travis Rangel', 'Family Physician', '772056584', 'doctor2020@example.com', 101);

-- Sample Patients 
INSERT INTO Patients (patient_id, name, dob, gender, phone, email)
VALUES 
(1001, 'Ali Mansoor', '1990-01-01', 'Male', '921111111', 'ali1001@example.com'),
(1002, 'Sara Nasser', '1985-03-12', 'Female', '922222222', 'sara1002@example.com'),
(1003, 'Hassan Zayed', '1975-06-23', 'Male', '923333333', 'hassan1003@example.com'),
(1004, 'Mona Khalid', '1989-07-05', 'Female', '924444444', 'mona1004@example.com'),
(1005, 'Yousef Hamdan', '2000-11-15', 'Male', '925555555', 'yousef1005@example.com'),
(1006, 'Fatma Noor', '1992-10-21', 'Female', '926666666', 'fatma1006@example.com'),
(1007, 'Salim Rashid', '1988-08-09', 'Male', '927777777', 'salim1007@example.com'),
(1008, 'Rania Fadel', '1993-12-30', 'Female', '928888888', 'rania1008@example.com'),
(1009, 'Adil Said', '1970-02-18', 'Male', '929999999', 'adil1009@example.com'),
(1010, 'Nadia Saleh', '1996-09-14', 'Female', '930000000', 'nadia1010@example.com'),
(1011, 'Khalid Badr', '1982-01-25', 'Male', '931111111', 'khalid1011@example.com'),
(1012, 'Huda Jameel', '1991-05-05', 'Female', '932222222', 'huda1012@example.com'),
(1013, 'Majid Talal', '1994-06-30', 'Male', '933333333', 'majid1013@example.com'),
(1014, 'Laila Khamis', '1999-08-01', 'Female', '934444444', 'laila1014@example.com'),
(1015, 'Bader Said', '1989-11-11', 'Male', '935555555', 'bader1015@example.com'),
(1016, 'Anna Salim', '1989-03-11', 'Female', '936666666', 'anna1016@example.com'),
(1017, 'Ibrahim Rashed', '1995-06-12', 'Male', '937777777', 'ibrahim1017@example.com'),
(1018, 'Noura Hadi', '1987-10-20', 'Female', '938888888', 'noura1018@example.com'),
(1019, 'Talib Zahir', '1986-04-04', 'Male', '939999999', 'talib1019@example.com'),
(1020, 'Dina Rami', '1993-11-20', 'Female', '940000000', 'dina1020@example.com');


-- Insert required Departments
INSERT INTO Departments (department_id, name) VALUES
(101, 'Emergency'),
(102, 'Cardiology'),
(103, 'Neurology'),
(104, 'Pediatrics'),
(105, 'Orthopedics'),
(106, 'General Medicine'),
(107, 'Dermatology'),
(108, 'Radiology'),
(109, 'Oncology'),
(110, 'ENT');
(111, 'Pulmonology'),
(112, 'Nephrology'),
(113, 'Urology'),
(114, 'Gastroenterology'),
(115, 'Endocrinology'),
(116, 'Psychiatry'),
(117, 'Rheumatology'),
(118, 'Infectious Diseases'),
(119, 'Hematology'),
(120, 'Plastic Surgery');


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


-- SAMPLE ROOM 
INSERT INTO Rooms (room_number, type, isAvailable)
VALUES
(2001, 'ICU', 1),
(2002, 'General', 1),
(2003, 'Private', 1),
(2004, 'ICU', 1),
(2005, 'General', 1),
(2006, 'Private', 1),
(2007, 'General', 1),
(2008, 'ICU', 1),
(2009, 'General', 1),
(2010, 'Private', 1),
(2011, 'General', 1),
(2012, 'Private', 1),
(2013, 'General', 1),
(2014, 'ICU', 1),
(2015, 'General', 1),
(2016, 'Private', 1),
(2017, 'ICU', 1),
(2018, 'General', 1),
(2019, 'Private', 1),
(2020, 'General', 1);


INSERT INTO MedicalRecords (record_id, patient_id, doctor_id, diagnosis, treatment, date)
VALUES 
(3001, 1, 2001, 'Flu', 'Rest and hydration', GETDATE()),
(3002, 2, 2002, 'Fever', 'Paracetamol', GETDATE()),
(3003, 3, 2004, 'Sprain', 'Physiotherapy', GETDATE()),
(3004, 1001, 2005, 'Diabetes', 'Insulin', GETDATE()),
(3005, 1002, 2006, 'Asthma', 'Inhaler', GETDATE()),
(3006, 1003, 2007, 'High BP', 'Lifestyle change', GETDATE()),
(3007, 1004, 2008, 'Headache', 'Painkillers', GETDATE()),
(3008, 1005, 2009, 'Allergy', 'Antihistamines', GETDATE()),
(3009, 1006, 2010, 'Migraine', 'Triptans', GETDATE()),
(3010, 1007, 2011, 'Anemia', 'Iron supplements', GETDATE()),
(3011, 1008, 2012, 'Acne', 'Topical cream', GETDATE()),
(3012, 1009, 2013, 'Ulcer', 'PPI', GETDATE()),
(3013, 1010, 2014, 'COVID-19', 'Isolation', GETDATE()),
(3014, 1011, 2017, 'Checkup', 'Routine exam', GETDATE()),
(3015, 1012, 2018, 'Back pain', 'Physio & rest', GETDATE()),
(3016, 1013, 2019, 'Cough', 'Syrup', GETDATE()),
(3017, 1014, 2020, 'Skin rash', 'Cream', GETDATE()),
(3018, 1015, 301, 'Thyroid', 'Levothyroxine', GETDATE()),
(3019, 1016, 2004, 'Joint pain', 'NSAIDs', GETDATE()),
(3020, 2, 2005, 'Insomnia', 'Melatonin', GETDATE());





-- Users Insert (all roles mapped to allowed values)
INSERT INTO Users (user_id, username, password, role, staff_id) VALUES
(1,  'admin1',     'admin123',     'Admin',  2),
(2,  'admin2',     'basma123',     'Admin',  7),
(3,  'admin3',     'tariq123',     'Admin',  11),
(4,  'admin4',     'saif123',      'Admin',  17),

(5,  'nurse1',     'mariam123',    'Staff',  1),
(6,  'nurse2',     'laila123',     'Staff',  4),
(7,  'nurse3',     'nawal123',     'Staff', 10),
(8,  'nurse4',     'amina123',     'Staff', 12),
(9,  'nurse5',     'dalia123',     'Staff', 14),
(10, 'nurse6',     'shaima123',    'Staff', 16),
(11, 'nurse7',     'amal123',      'Staff', 20),

(12, 'tech1',      'samir123',     'Staff',  3),
(13, 'tech2',      'hatem123',     'Staff',  9),
(14, 'tech3',      'faisal123',    'Staff', 13),
(15, 'tech4',      'mazin123',     'Staff', 18),

(16, 'support1',   'jameel123',    'Staff',  5),
(17, 'support2',   'khamis123',    'Staff',  8),
(18, 'support3',   'adel123',      'Staff', 15),
(19, 'support4',   'waleed123',    'Staff', 19),

(20, 'nurse8',     'nada123',      'Staff',  6);


ALTER TABLE Users DROP CONSTRAINT CK__Users__role__5FB337D6;

ALTER TABLE Users
ADD CONSTRAINT CK__Users__role__custom
CHECK (role IN ('Admin', 'Doctor', 'Receptionist', 'Staff', 'Technician', 'Support'));


INSERT INTO Admissions (admission_id, patient_id, staff_id, room_number, date_in, date_out) VALUES
(1001, 1, 1, 301, GETDATE(), NULL),
(1002, 2, 2, 302, GETDATE(), NULL),
(1003, 3, 3, 303, GETDATE(), NULL),
(1004, 4, 4, 304, GETDATE(), NULL),
(1005, 5, 5, 305, GETDATE(), NULL),
(1006, 6, 6, 306, GETDATE(), NULL),
(1007, 7, 7, 307, GETDATE(), NULL),
(1008, 8, 8, 308, GETDATE(), NULL),
(1009, 9, 9, 309, GETDATE(), NULL),
(1010, 10, 10, 310, GETDATE(), NULL),
(1011, 11, 11, 311, GETDATE(), NULL),
(1012, 12, 12, 312, GETDATE(), NULL),
(1013, 13, 13, 313, GETDATE(), NULL),
(1014, 14, 14, 314, GETDATE(), NULL),
(1015, 15, 15, 315, GETDATE(), NULL),
(1016, 16, 16, 316, GETDATE(), NULL),
(1017, 17, 17, 317, GETDATE(), NULL),
(1018, 18, 18, 318, GETDATE(), NULL),
(1019, 19, 19, 319, GETDATE(), NULL),
(1020, 20, 20, 320, GETDATE(), NULL),
(1021, 3, 3, 321, GETDATE(), NULL);


INSERT INTO Appointments (appointment_id, patient_id, doctor_id, appointment_date, reason) VALUES
(1, 1, 2017, GETDATE(), 'Routine checkup'),
(2, 2, 2018, GETDATE(), 'Follow-up'),
(3, 3, 2013, GETDATE(), 'Flu symptoms'),
(4, 4, 2005, GETDATE(), 'Injury'),
(5, 5, 2004, GETDATE(), 'Fever'),
(6, 6, 2010, GETDATE(), 'Allergy'),
(7, 7, 2014, GETDATE(), 'Vaccination'),
(8, 8, 2009, GETDATE(), 'Chest pain'),
(9, 9, 2012, GETDATE(), 'Skin rash'),
(10, 10, 2001, GETDATE(), 'Blood test'),
(11, 11, 2006, GETDATE(), 'Consultation'),
(12, 12, 2020, GETDATE(), 'Diabetes follow-up'),
(13, 13, 2008, GETDATE(), 'Kidney issue'),
(14, 14, 2003, GETDATE(), 'Asthma'),
(15, 15, 2015, GETDATE(), 'Thyroid'),
(16, 16, 2007, GETDATE(), 'Nutrition advice'),
(17, 17, 2011, GETDATE(), 'Eye checkup'),
(18, 18, 2002, GETDATE(), 'Hearing loss'),
(19, 19, 2000, GETDATE(), 'Burn'),
(20, 20, 2019, GETDATE(), 'General health'),
(21, 2, 2017, GETDATE(), 'X-Ray');




INSERT INTO Billing (bill_id, patient_id, record_id, date, services, total_cost) VALUES
(1, 1, 1001, GETDATE(), 'Consultation', 50.00),
(2, 2, 1002, GETDATE(), 'X-ray', 75.00),
(3, 3, 1003, GETDATE(), 'Blood test', 30.00),
(4, 4, 1004, GETDATE(), 'MRI', 120.00),
(5, 5, 1005, GETDATE(), 'CT scan', 100.00),
(6, 6, 1006, GETDATE(), 'ECG', 45.00),
(7, 7, 1007, GETDATE(), 'Ultrasound', 70.00),
(8, 8, 1008, GETDATE(), 'Admission charges', 200.00),
(9, 9, 1009, GETDATE(), 'Medication', 40.00),
(10, 10, 1010, GETDATE(), 'Physiotherapy', 60.00),
(11, 11, 1011, GETDATE(), 'Vaccination', 20.00),
(12, 12, 1012, GETDATE(), 'Checkup', 35.00),
(13, 13, 1013, GETDATE(), 'Blood sugar test', 15.00),
(14, 14, 1014, GETDATE(), 'BP check', 10.00),
(15, 15, 1015, GETDATE(), 'Dialysis', 250.00),
(16, 16, 1016, GETDATE(), 'Operation charges', 300.00),
(17, 17, 1017, GETDATE(), 'Cardiac Test', 180.00),
(18, 18, 1018, GETDATE(), 'Biopsy', 90.00),
(19, 19, 1019, GETDATE(), 'ENT service', 70.00),
(20, 20, 1020, GETDATE(), 'Skin treatment', 95.00),
(21, 3, 1021, GETDATE(), 'Oxygen Therapy', 110.00);
