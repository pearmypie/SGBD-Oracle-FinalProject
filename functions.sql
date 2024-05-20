-- FUNCTION 1
CREATE OR REPLACE FUNCTION maximum_admission_duration RETURN VARCHAR2 IS
    v_message VARCHAR2(100);
    v_pacient VARCHAR2(100);

BEGIN
    SELECT 'The pacient ' || p.first_name || ' ' || p.last_name || ' has stayed in the hospital ' || TRUNC((o.date_end- o.date_begin)) || ' days.', p.first_name || ' ' || p.last_name INTO v_message, v_pacient
    FROM admission o
    JOIN diagnostic d ON o.diagnostic_id = d.diagnostic_id
    JOIN pacient p ON d.id_number = p.id_number
    WHERE o.date_end IS NOT NULL
    ORDER BY (o.date_end - o.date_begin) DESC
    FETCH FIRST ROW ONLY;
    
    DBMS_OUTPUT.PUT_LINE(v_message);
    RETURN v_pacient;

EXCEPTION
    WHEN TOO_MANY_ROWS
    THEN
        DBMS_OUTPUT.PUT_LINE('Somehow, there are too many rows!');
        RETURN NULL;
        
    WHEN NO_DATA_FOUND
    THEN
        DBMS_OUTPUT.PUT_LINE('Nu există internări în baza de date.');
        RETURN NULL;
END;
/

BEGIN DBMS_OUTPUT.PUT_LINE(MAXIMUM_ADMISSION_DURATION); END;

-- FUNCTION 2
CREATE OR REPLACE FUNCTION compute_years_of_employment(p_doctor_id IN doctor.doctor_id%TYPE) RETURN number AS
    v_no_years number;
BEGIN
    SELECT ROUND((SYSDATE-date_of_employment)/365) INTO v_no_years
    FROM doctor
    WHERE doctor_id = p_doctor_id;
    
    RETURN v_no_years;

EXCEPTION
    WHEN NO_DATA_FOUND THEN RETURN NULL;

END;
/

BEGIN DBMS_OUTPUT.PUT_LINE(COMPUTE_YEARS_OF_EMPLOYMENT(6666)); END;

-- FUNCTION 3
CREATE OR REPLACE FUNCTION compute_age(p_id_number IN pacient.id_number%TYPE) RETURN number
AS
    v_age number;
BEGIN
    SELECT ROUND((SYSDATE-date_of_birth)/365) INTO v_age
    FROM pacient
    WHERE id_number = p_id_number;
    
    RETURN v_age;

EXCEPTION
    WHEN NO_DATA_FOUND THEN RETURN NULL;

END;
/

BEGIN DBMS_OUTPUT.PUT_LINE(COMPUTE_AGE('5263484920214')); END;