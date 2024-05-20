-- PL/SQL EXCEPTIONS example
declare
	cursor c (p_gender pacient.gender%type) is
	select last_name, first_name, round((sysdate - date_of_birth) / 365) age
	  from pacient
	 where gender = p_gender;

	v_record          c%rowtype;
	v_gender          pacient.gender%type default 'f';
	pacient_doesnt_exist exception;
	too_many_characters  exception;
	pragma exception_init (too_many_characters, -06502);

begin
	open c(v_gender);
	loop
		fetch c into v_record;
		exit when c%notfound;

		dbms_output.put_line(v_record.last_name
		                     || ' '
		                     || v_record.first_name
		                     || ' '
		                     || v_record.age);
	end loop;

	if
		c%rowcount = 0
		and ( v_gender = 'm' or v_gender = 'f' or v_gender = 'n' )
	then
		raise pacient_doesnt_exist;
	else
		dbms_output.put_line(c%rowcount
		                     || ' pacients have been printed');
	end if;

	close c;
    
exception
	when pacient_doesnt_exist then
		dbms_output.put_line('No pacient of this gender exists.');
	when too_many_characters then
		dbms_output.put_line('Too many characters');
	when others then
		dbms_output.put_line('An error has occured.');
end;
/