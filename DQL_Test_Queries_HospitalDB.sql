
-- 1. List all patients who visited a certain doctor
DECLARE @DoctorID INT = 1;
SELECT DISTINCT P.name AS PatientName, P.patient_id
FROM Patients P
JOIN Appointments A ON P.patient_id = A.patient_id
WHERE A.doctor_id = @DoctorID;

-- 2. Count of appointments per department
SELECT D.name AS Department, COUNT(A.appointment_id) AS AppointmentCount
FROM Appointments A
JOIN Doctors Doc ON A.doctor_id = Doc.doctor_id
JOIN Departments D ON Doc.department_id = D.department_id
GROUP BY D.name;

-- 3. Retrieve doctors who have more than 5 appointments in a month
DECLARE @Month INT = 6;
DECLARE @Year INT = 2025;
SELECT Doc.name AS DoctorName, COUNT(A.appointment_id) AS TotalAppointments
FROM Appointments A
JOIN Doctors Doc ON A.doctor_id = Doc.doctor_id
WHERE MONTH(A.datetime) = @Month AND YEAR(A.datetime) = @Year
GROUP BY Doc.name
HAVING COUNT(A.appointment_id) > 5;

-- 4. JOINs across 3–4 tables (appointments with doctor, patient, department)
SELECT A.appointment_id, P.name AS Patient, D.name AS Doctor, Dept.name AS Department, A.datetime
FROM Appointments A
JOIN Patients P ON A.patient_id = P.patient_id
JOIN Doctors D ON A.doctor_id = D.doctor_id
JOIN Departments Dept ON D.department_id = Dept.department_id;

-- 5. GROUP BY, HAVING, aggregate functions (patients with multiple admissions)
SELECT P.name, COUNT(Adm.admission_id) AS AdmissionCount
FROM Patients P
JOIN Admissions Adm ON P.patient_id = Adm.patient_id
GROUP BY P.name
HAVING COUNT(Adm.admission_id) > 1;

-- 6. SUBQUERIES and EXISTS (patients who have billing records)
SELECT P.name
FROM Patients P
WHERE EXISTS (
    SELECT 1
    FROM Billing B
    WHERE B.patient_id = P.patient_id
);
