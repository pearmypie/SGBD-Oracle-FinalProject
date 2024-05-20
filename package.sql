CREATE OR REPLACE PACKAGE ALL_INCLUSIVE AS
    PROCEDURE display_doctor_specialization(p_doctor_id IN doctor.doctor_id%TYPE);
    PROCEDURE display_treatments_for_year(p_year IN NUMBER);
    PROCEDURE age_of_pacients;
    FUNCTION maximum_admission_duration RETURN admission%ROWTYPE;
    FUNCTION compute_years_of_employment(p_doctor_id IN doctor.doctor_id%TYPE) RETURN NUMBER;
    FUNCTION compute_age(p_id_number IN pacient.id_number%TYPE) RETURN NUMBER;
END ALL_INCLUSIVE;
