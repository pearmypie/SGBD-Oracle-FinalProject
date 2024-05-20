   SET SERVEROUTPUT ON;

-- PL/SQL block that calculates the final price of the medication for a treatment
-- and updates the database with the new price
-- The initial price of the medication is doubled if it is less than 150,
-- increased by 50% if it is between 150 and 300, and increased by 25% if it is greater than 300
declare -- (EXECUTE IMMEDIATE DML)
	v_price treatment.medication_price%type;
	v_id    treatment.treatment_id%type default 705;
begin
	select medication_price
	  into v_price
	  from treatment
	 where treatment_id = v_id;
	dbms_output.put_line('The initial price of the medication for the treatment with code '
	                     || v_id
	                     || ' is: '
	                     || v_price);
	if v_price < 150 then
		v_price := 2 * v_price;
	elsif v_price between 150 and 300 then
		v_price := 1.5 * v_price;
	else
		v_price := 1.25 * v_price;
	end if;

	dbms_output.put_line('The final price of the medication for the treatment with code'
	                     || v_id
	                     || '  is: '
	                     || v_price);
	execute immediate 'UPDATE treatment SET medication_price = :1 WHERE treatment_id = :2'
		using v_price,v_id;
	commit;
exception
	when no_data_found then
		dbms_output.put_line('The treatment does not exist.');
end;
/

-- PL/SQL block that updates the date of employment for all doctors with a doctor_id less than 6667
-- by adding 30 days to the current date of employment
begin -- (UPDATE STATEMENT)
	update doctor
	   set
		date_of_employment = date_of_employment + 30
	 where doctor_id < 6667;

	if sql%notfound then
		dbms_output.put_line('No doctors have an ID less than 6667');
	else
		dbms_output.put_line('The employment date has been modified for '
		                     || sql%rowcount
		                     || ' doctors.');
	end if;
	commit;
end;
/

-- PL/SQL block that displays information about each patient and their doctor.
declare -- (CURSOR EXPLICIT, NO PARAMETERS)
	cursor c is
	select last_name,
	       first_name,
	       gender,
	       date_of_birth,
	       id_number
	  from pacient;
	v_record            c%rowtype;
	v_doctor_last_name  doctor.last_name%type;
	v_doctor_first_name doctor.first_name%type;
begin
	open c;
	loop
		fetch c into v_record;
		exit when c%notfound;
		select dr.last_name into v_doctor_last_name
		  from doctor dr,
		       pacient p,
		       diagnostic d
		 where p.id_number = d.id_number
		   and d.doctor_id = dr.doctor_id
		   and v_record.id_number = p.id_number;

		dbms_output.put_line('The patient '
		                     || v_record.last_name
		                     || ' '
		                     || v_record.first_name
		                     || ' born on '
		                     || v_record.date_of_birth
		                     || ' has the doctor '
		                     || v_doctor_last_name);
	end loop;
	close c;
end;
/

-- PL/SQL block that displays the name, surname, code, and years of employment for a doctor
declare -- (CURSOR WITH PARAMETERS)
	cursor c (p_doctor_id doctor.doctor_id%type) is
        select last_name, first_name, doctor_id, round((sysdate - date_of_employment) / 365) years_of_employment
	    from doctor
	    where doctor_id = p_doctor_id;

	v_record c%rowtype;
	v_doctor_id doctor.doctor_id%type default 6666;
begin
	open c(v_doctor_id);
	loop
		fetch c into v_record;
		exit when c%notfound;
		dbms_output.put_line('Dr. '
		                     || v_record.first_name
		                     || ' '
		                     || v_record.last_name
		                     || ' has the code '
		                     || v_record.doctor_id
		                     || ' and has been employed for '
		                     || v_record.years_of_employment
		                     || ' years');
	end loop;
	close c;
end;
/

-- PL/SQL block that displays the name and the number of allergies for each patient
-- Yes, I know the table is `Alergy` and not `Alergy` but I'm not going to change it now
DECLARE -- (CURSOR, AGGREGATE FUNCTION)
    CURSOR c IS SELECT pacient.id_number, pacient.last_name, pacient.first_name, COUNT(alergy.allergy_id) no_of_allergies 
                FROM pacient JOIN alergy 
                ON pacient.id_number = alergy.id_number
                GROUP BY pacient.id_number, pacient.last_name, pacient.first_name
                ORDER BY no_of_allergies DESC;
BEGIN
    FOR v_record IN c LOOP
        DBMS_OUTPUT.PUT_LINE(v_record.first_name||' '||v_record.last_name||' --> '|| v_record.no_of_allergies || ' allergies');
    END LOOP;
END;
/




