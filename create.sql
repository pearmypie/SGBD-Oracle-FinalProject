DROP TABLE Pacient          CASCADE CONSTRAINTS; --
DROP TABLE Doctor           CASCADE CONSTRAINTS; --
DROP TABLE Alergy           CASCADE CONSTRAINTS; --
DROP TABLE MedicalCondition CASCADE CONSTRAINTS; --
DROP TABLE Diagnostic       CASCADE CONSTRAINTS; --
DROP TABLE Treatament       CASCADE CONSTRAINTS; 
DROP TABLE Admission        CASCADE CONSTRAINTS; --

CREATE TABLE Pacient (
    id_number     VARCHAR2(13) CONSTRAINT pk_pacient PRIMARY KEY,
    last_name     VARCHAR2(30) NOT NULL,
    first_name    VARCHAR2(30) NOT NULL,
    gender        VARCHAR2(30),
    date_of_birth Date
);

CREATE TABLE Doctor (
    doctor_id          VARCHAR2(10) CONSTRAINT pk_doctor PRIMARY KEY,
    last_name          VARCHAR2(30) NOT NULL,
    first_name         VARCHAR2(30) NOT NULL,
    date_of_employment Date,
    specialization     VARCHAR2(30),
    department         VARCHAR2(30)
 );

CREATE TABLE MedicalCondition (
    condition_id    VARCHAR2(10) CONSTRAINT pk_medicalCondition PRIMARY KEY,
    condition_name  VARCHAR2(30),
    treatment_id    VARCHAR2(10)
);

CREATE TABLE Diagnostic (
    diagnostic_id   VARCHAR2(10) CONSTRAINT pk_diagnostic PRIMARY KEY,
    condition_id    VARCHAR2(10) CONSTRAINT fk_diagnostic_1 REFERENCES MedicalCondition(condition_id),
    id_number       VARCHAR2(13) CONSTRAINT fk_diagnostic_2 REFERENCES Pacient(id_number),
    diagnostic_date Date,
    doctor_id       VARCHAR2(10) CONSTRAINT fk_diagnostic_3 REFERENCES Doctor(doctor_id)
);

CREATE TABLE Treatment (
    treatment_id     CHAR(10) CONSTRAINT pk_treatament PRIMARY KEY,
    date_begin       Date NOT NULL,
    date_end         Date NOT NULL,
    medication_price NUMBER(8,2) NOT NULL,
    diagnostic_id    VARCHAR2(10) CONSTRAINT fk_treatament REFERENCES Diagnostic(diagnostic_id)
);

CREATE TABLE Admission (
    admission_id  VARCHAR(10) CONSTRAINT pk_admission PRIMARY KEY,
    date_begin    Date NOT NULL,
    date_end      Date NOT NULL,
    diagnostic_id VARCHAR2(10) CONSTRAINT fk_admission REFERENCES Diagnostic(diagnostic_id),
    room_number   VARCHAR2(5)
);

CREATE TABLE Alergy (
    allergy_id   VARCHAR2(10) CONSTRAINT pk_alergie PRIMARY KEY,
    allergy_name VARCHAR2(20) NOT NULL,
    severity     VARCHAR2(10) NOT NULL,
    id_number    VARCHAR2(13) CONSTRAINT fk_alergy REFERENCES Pacient(id_number)
);