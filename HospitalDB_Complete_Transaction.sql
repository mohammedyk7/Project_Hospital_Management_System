
-- Clean slate: Drop all tables if they exist
DROP TABLE IF EXISTS Billing, MedicalRecords, Appointments, Admissions, Rooms, Staff, Users, Doctors, Patients, Departments;

-- Create schema (tables only with required fields for this test)
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    dob DATE,
    gender VARCHAR(10),
    phone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100),
    specialization VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    name VARCHAR(100),
    role VARCHAR(50),
    shift VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Rooms (
    room_number INT PRIMARY KEY,
    type VARCHAR(50),
    isAvailable BIT DEFAULT 1
);

CREATE TABLE MedicalRecords (
    record_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    diagnosis TEXT,
    treatment TEXT,
    date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Admissions (
    admission_id INT PRIMARY KEY,
    patient_id INT,
    staff_id INT,
    room_number INT,
    date_in DATE,
    date_out DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
    FOREIGN KEY (room_number) REFERENCES Rooms(room_number)
);

CREATE TABLE Billing (
    bill_id INT PRIMARY KEY,
    patient_id INT,
    record_id INT,
    date DATE,
    services TEXT,
    total_cost DECIMAL(10, 2),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (record_id) REFERENCES MedicalRecords(record_id)
);

-- Insert prerequisite data
INSERT INTO Departments VALUES (101, 'Emergency');
INSERT INTO Departments VALUES (201, 'General');

INSERT INTO Patients VALUES (1, 'Ali Al-Kindi', '1995-07-12', 'Male', '91234567', 'ali.kindi@example.com');

INSERT INTO Doctors VALUES (301, 'Dr. Sameer', 'Internal Medicine', '933445678', 'dr.sameer@example.com', 201);

INSERT INTO Staff VALUES (201, 'Aisha Said', 'Nurse', 'Morning', 101);

INSERT INTO Rooms VALUES (301, 'General', 1);

INSERT INTO MedicalRecords VALUES (1001, 1, 301, 'Routine Checkup', 'Paracetamol', GETDATE());

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
