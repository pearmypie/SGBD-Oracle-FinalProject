-- 1
CREATE OR REPLACE PROCEDURE PRINT_DOCTOR_SPECIALIZATION_AND_NUMBER_OF_PACIENTS(p_doctor_id IN doctor.doctor_id%TYPE) IS
    v_specialization doctor.specialization%TYPE;
    v_no_pacients NUMBER;

BEGIN
    SELECT specialization INTO v_specialization
    FROM doctor
    WHERE doctor_id = p_doctor_id;
    
    SELECT COUNT(*) INTO v_no_pacients
    FROM diagnostic
    WHERE doctor_id = p_doctor_id;
    
    DBMS_OUTPUT.PUT_LINE('The doctor that has the code ' || p_doctor_id || ' has the specialization: ' || v_specialization || '; and he has ' || v_no_pacients || ' pacients.');

EXCEPTION
    WHEN TOO_MANY_ROWS THEN        
       DBMS_OUTPUT.PUT_LINE('Somehow, there are too many rows!');

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found!');
END;
/

-- 2
CREATE OR REPLACE PROCEDURE DISPLAY_TREATMENTS_FOR_YEAR(p_year IN NUMBER)
AS
    CURSOR c(p_year NUMBER) IS SELECT treatment_id, date_end - date_begin treatment_duration
        FROM treatment
        WHERE EXTRACT(YEAR FROM date_end)=p_year;
    r c%ROWTYPE;

    year_doesnt_exist EXCEPTION;

BEGIN 
    OPEN c (p_year);
  LOOP
    FETCH c INTO r;
    EXIT WHEN c%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Treatment ' || r.treatment_id || ' has had a duration of ' || r.treatment_duration || ' days.');
    END LOOP;
    
    IF c%rowcount = 0 THEN 
    RAISE year_doesnt_exist;
    END IF;
    
    CLOSE C;
EXCEPTION
    WHEN year_doesnt_exist THEN DBMS_OUTPUT.PUT_LINE('No treatments for this year.');    
END;
/

-- 3
CREATE OR REPLACE PROCEDURE AGE_OF_PACIENTS
AS
    CURSOR c IS SELECT first_name||' '||last_name full_name , id_number, compute_age(id_number) age FROM pacient;
    r c%ROWTYPE;

BEGIN
    OPEN c;
  LOOP
    FETCH c INTO r;
    EXIT WHEN c%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Pacient ' || r.full_name || ' has the age of ' || r.age || ' years.');
  END LOOP;
  
  CLOSE c;
  
  EXCEPTION
  WHEN TOO_MANY_ROWS THEN DBMS_OUTPUT.PUT_LINE('Exista prea multi oameni cu acest cnp');
  WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('A aparut o eroare');
  
END;
/

EXECUTE AGE_OF_PACIENTS;
