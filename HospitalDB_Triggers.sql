
-- 1. AFTER INSERT on Appointments -> auto log in MedicalRecords
-- Fixed Trigger for Auto MedicalRecord Logging
CREATE TRIGGER trg_AutoLogMedicalRecord
ON Appointments
AFTER INSERT
AS
BEGIN
    INSERT INTO MedicalRecords (record_id, patient_id, doctor_id, diagnosis, treatment, date)
    SELECT 
        ABS(CHECKSUM(NEWID())) % 1000000,
        i.patient_id,
        i.doctor_id,
        'Initial Diagnosis',
        'Initial Treatment Plan',
        CAST(i.datetime AS DATE)
    FROM inserted i;
END;

-- 2. BEFORE DELETE on Patients -> prevent deletion if pending bills exist
CREATE TRIGGER trg_PreventPatientDeleteWithBills
ON Patients
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM Billing B 
        WHERE B.patient_id IN (SELECT patient_id FROM deleted)
    )
    BEGIN
        RAISERROR ('Cannot delete patient with existing billing records.', 16, 1);
        RETURN;
    END

    -- No bills, safe to delete
    DELETE FROM Patients
    WHERE patient_id IN (SELECT patient_id FROM deleted);
END;

-- 3. AFTER UPDATE on Rooms -> ensure no two patients occupy the same room
GO
CREATE TRIGGER trg_EnsureRoomAvailability
ON Rooms
AFTER UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT room_number
        FROM Admissions
        WHERE room_number IN (SELECT room_number FROM inserted)
        GROUP BY room_number
        HAVING COUNT(*) > 1
    )
    BEGIN
        RAISERROR('Room conflict: More than one patient is assigned to the same room.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO

