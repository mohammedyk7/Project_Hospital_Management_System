
-- 1. vw_DoctorSchedule: Upcoming appointments per doctor
CREATE VIEW vw_DoctorSchedule AS
SELECT 
    D.doctor_id,
    D.name AS doctor_name,
    A.appointment_id,
    A.datetime,
    P.name AS patient_name
FROM 
    Doctors D
JOIN 
    Appointments A ON D.doctor_id = A.doctor_id
JOIN 
    Patients P ON A.patient_id = P.patient_id
WHERE 
    A.datetime > GETDATE();


-- 2. vw_PatientSummary: Patient info with their latest visit
CREATE VIEW vw_PatientSummary AS
SELECT 
    P.patient_id,
    P.name,
    P.gender,
    P.dob,
    MAX(MR.date) AS last_visit_date,
    MR.diagnosis,
    MR.treatment,
    D.name AS doctor_name
FROM 
    Patients P
JOIN 
    MedicalRecords MR ON P.patient_id = MR.patient_id
JOIN 
    Doctors D ON MR.doctor_id = D.doctor_id
GROUP BY 
    P.patient_id, P.name, P.gender, P.dob, MR.diagnosis, MR.treatment, D.name;


-- 3. vw_DepartmentStats: Number of doctors and patients per department
CREATE VIEW vw_DepartmentStats AS
SELECT 
    Dept.department_id,
    Dept.name AS department_name,
    COUNT(DISTINCT Doc.doctor_id) AS num_doctors,
    COUNT(DISTINCT Pat.patient_id) AS num_patients
FROM 
    Departments Dept
LEFT JOIN 
    Doctors Doc ON Dept.department_id = Doc.department_id
LEFT JOIN 
    Appointments A ON Doc.doctor_id = A.doctor_id
LEFT JOIN 
    Patients Pat ON A.patient_id = Pat.patient_id
GROUP BY 
    Dept.department_id, Dept.name;
