

SELECT * FROM Patients WHERE patient_id = 1;

INSERT INTO Patients (patient_id, name, dob, gender, phone, email)
VALUES (1, 'Ali Al-Kindi', '1995-07-12', 'Male', '91234567', 'ali.kindi@example.com');

-- Insert required department for FK
INSERT INTO Departments (department_id, name)
VALUES (201, 'General');

-- Insert Doctor (doctor_id = 301 must match your other inserts)
INSERT INTO Doctors (doctor_id, name, specialization, phone, email, department_id)
VALUES (301, 'Dr. Sameer', 'Internal Medicine', '933445678', 'dr.sameer@example.com', 201);

-- Insert Medical Record after doctor and patient exist
INSERT INTO MedicalRecords (record_id, patient_id, doctor_id, diagnosis, treatment, date)
VALUES (1001, 1, 301, 'Routine Checkup', 'Paracetamol', GETDATE());


-- Transaction block
BEGIN TRY
    BEGIN TRANSACTION;

    -- Insert into Admissions
    INSERT INTO Admissions (admission_id, patient_id, staff_id, room_number, date_in, date_out)
    VALUES (101, 1, 201, 301, GETDATE(), NULL);

    -- Update Room Availability
    UPDATE Rooms
    SET isAvailable = 0
    WHERE room_number = 301;

    -- Insert into Billing
    INSERT INTO Billing (bill_id, patient_id, record_id, date, services, total_cost)
    VALUES (501, 1, 1001, GETDATE(), 'Admission charges', 200.00);

    COMMIT;
    PRINT ' Transaction committed successfully.';
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK;

    PRINT ' Transaction failed.';
    PRINT ERROR_MESSAGE();
END CATCH;
