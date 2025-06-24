
-- 1. Scalar function to calculate patient age from DOB
CREATE FUNCTION dbo.CalculateAge (@dob DATE)
RETURNS INT
AS
BEGIN
    RETURN DATEDIFF(YEAR, @dob, GETDATE()) - 
           CASE WHEN MONTH(GETDATE()) < MONTH(@dob) OR 
                     (MONTH(GETDATE()) = MONTH(@dob) AND DAY(GETDATE()) < DAY(@dob)) 
                THEN 1 ELSE 0 END;
END;

-- 2. Stored procedure to admit a patient and update room availability
CREATE PROCEDURE dbo.AdmitPatient
    @admission_id INT,
    @patient_id INT,
    @staff_id INT,
    @room_number INT,
    @date_in DATE,
    @date_out DATE = NULL
AS
BEGIN
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Insert into Admissions
        INSERT INTO Admissions (admission_id, patient_id, staff_id, room_number, date_in, date_out)
        VALUES (@admission_id, @patient_id, @staff_id, @room_number, @date_in, @date_out);

        -- Update Room Availability
        UPDATE Rooms
        SET isAvailable = 0
        WHERE room_number = @room_number;

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        THROW;
    END CATCH
END;

-- 3. Procedure to generate invoice (Billing) based on treatment record
CREATE PROCEDURE dbo.GenerateInvoice
    @bill_id INT,
    @patient_id INT,
    @record_id INT,
    @date DATE,
    @services TEXT,
    @total_cost DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO Billing (bill_id, patient_id, record_id, date, services, total_cost)
    VALUES (@bill_id, @patient_id, @record_id, @date, @services, @total_cost);
END;

-- 4. Procedure to assign doctor to department and shift (assuming shift is stored in Staff or other relation)
-- If Doctors table doesn’t have shift, this assumes inserting into Staff if needed
CREATE PROCEDURE dbo.AssignDoctorToDepartment
    @doctor_id INT,
    @department_id INT
AS
BEGIN
    UPDATE Doctors
    SET department_id = @department_id
    WHERE doctor_id = @doctor_id;
END;
