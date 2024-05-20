-- insert allergies
INSERT INTO Alergy(allergy_id, allergy_name, severity, id_number) values ('123', 'Hay fever', 'mild'    ,'5263484920214');
INSERT INTO Alergy(allergy_id, allergy_name, severity, id_number) values ('124', 'Aspirin'  , 'severe'  ,'6854776390251');
INSERT INTO Alergy(allergy_id, allergy_name, severity, id_number) values ('125', 'Nuts'     , 'moderate','2656666778958');

-- insert pacients
INSERT INTO Pacient(id_number, last_name, first_name, gender, date_of_birth) values ('5263484920214', 'Catana' , 'Ioan'   , 'm', to_date('13-03-2001', 'dd-mm-yyyy'));
INSERT INTO Pacient(id_number, last_name, first_name, gender, date_of_birth) values ('6889923847201', 'Ion'    , 'Mihaela', 'f', to_date('04-04-1995', 'dd-mm-yyyy'));
INSERT INTO Pacient(id_number, last_name, first_name, gender, date_of_birth) values ('2658742153958', 'Catana' , 'Florin' , 'm', to_date('09-01-1947', 'dd-mm-yyyy'));
INSERT INTO Pacient(id_number, last_name, first_name, gender, date_of_birth) values ('5263408315869', 'Popescu', 'Marcel' , 'm', to_date('21-06-1998', 'dd-mm-yyyy'));
INSERT INTO Pacient(id_number, last_name, first_name, gender, date_of_birth) values ('6854776390251', 'Ionescu', 'Mihai'  , 'm', to_date('15-12-1995', 'dd-mm-yyyy'));
INSERT INTO Pacient(id_number, last_name, first_name, gender, date_of_birth) values ('5439860973658', 'Popa'   , 'Miruna' , 'f', to_date('05-11-1997', 'dd-mm-yyyy'));
INSERT INTO Pacient(id_number, last_name, first_name, gender, date_of_birth) values ('5266969690214', 'Titeche', 'Ana'    , 'f', to_date('25-04-2000', 'dd-mm-yyyy'));
INSERT INTO Pacient(id_number, last_name, first_name, gender, date_of_birth) values ('6854544477551', 'Rosca'  , 'Laura'  , 'f', to_date('22-04-1977', 'dd-mm-yyyy'));
INSERT INTO Pacient(id_number, last_name, first_name, gender, date_of_birth) values ('2656666778958', 'Geany'  , 'Felix'  , 'm', to_date('28-10-1980', 'dd-mm-yyyy'));

-- insert medical conditions
INSERT INTO MedicalCondition(condition_id, condition_name, treatment_id) values ('120', 'appendicitis'  , '125');
INSERT INTO MedicalCondition(condition_id, condition_name, treatment_id) values ('140', 'blood pressure', '145');
INSERT INTO MedicalCondition(condition_id, condition_name, treatment_id) values ('220', 'sclerosis'     , '215');
INSERT INTO MedicalCondition(condition_id, condition_name, treatment_id) values ('320', 'bronchitis'    , '665');
INSERT INTO MedicalCondition(condition_id, condition_name, treatment_id) values ('420', 'depression'    , '695');
INSERT INTO MedicalCondition(condition_id, condition_name, treatment_id) values ('540', 'otitis'        , '705');
INSERT INTO MedicalCondition(condition_id, condition_name, treatment_id) values ('710', 'COVID-19'      , '815');
INSERT INTO MedicalCondition(condition_id, condition_name, treatment_id) values ('720', 'food poisoning', '825');
INSERT INTO MedicalCondition(condition_id, condition_name, treatment_id) values ('730', 'sinusitis'     , '835');

-- insert diagnostics
INSERT INTO Diagnostic(diagnostic_id, condition_id, id_number, diagnostic_date, doctor_id) values ('223', '120', '5263484920214', to_date('12-01-2023', 'dd-mm-yyyy'), '2781');
INSERT INTO Diagnostic(diagnostic_id, condition_id, id_number, diagnostic_date, doctor_id) values ('333', '120', '6889923847201', to_date('05-01-2023', 'dd-mm-yyyy'), '4689');
INSERT INTO Diagnostic(diagnostic_id, condition_id, id_number, diagnostic_date, doctor_id) values ('413', '140', '2658742153958', to_date('27-02-2023', 'dd-mm-yyyy'), '4689');
INSERT INTO Diagnostic(diagnostic_id, condition_id, id_number, diagnostic_date, doctor_id) values ('423', '140', '5263408315869', to_date('14-02-2023', 'dd-mm-yyyy'), '9075');
INSERT INTO Diagnostic(diagnostic_id, condition_id, id_number, diagnostic_date, doctor_id) values ('453', '220', '6854776390251', to_date('15-03-2023', 'dd-mm-yyyy'), '6666');
INSERT INTO Diagnostic(diagnostic_id, condition_id, id_number, diagnostic_date, doctor_id) values ('603', '320', '5439860973658', to_date('17-09-2022', 'dd-mm-yyyy'), '6964');
INSERT INTO Diagnostic(diagnostic_id, condition_id, id_number, diagnostic_date, doctor_id) values ('803', '420', '5266969690214', to_date('28-10-2022', 'dd-mm-yyyy'), '4200');
INSERT INTO Diagnostic(diagnostic_id, condition_id, id_number, diagnostic_date, doctor_id) values ('183', '420', '6854544477551', to_date('24-11-2021', 'dd-mm-yyyy'), '8945');
INSERT INTO Diagnostic(diagnostic_id, condition_id, id_number, diagnostic_date, doctor_id) values ('993', '540', '2656666778958', to_date('12-01-2021', 'dd-mm-yyyy'), '7887');

-- insert doctors
INSERT INTO Doctor(doctor_id, last_name, first_name, date_of_employment, specialization, department) values ('2781', 'Popescu' , 'Alex'  , to_date('15-12-2014','dd-mm-yyyy'), 'neurologis'     , 'neurology'          );
INSERT INTO Doctor(doctor_id, last_name, first_name, date_of_employment, specialization, department) values ('4689', 'Ioanas'  , 'Ioana' , to_date('12-07-2013','dd-mm-yyyy'), 'surgeon'        , 'surgery'            );
INSERT INTO Doctor(doctor_id, last_name, first_name, date_of_employment, specialization, department) values ('9075', 'Tudor'   , 'Rares' , to_date('18-05-2015','dd-mm-yyyy'), 'cardiologist'   , 'cardiology'         );
INSERT INTO Doctor(doctor_id, last_name, first_name, date_of_employment, specialization, department) values ('6666', 'Mihalcea', 'Maria' , to_date('25-03-2014','dd-mm-yyyy'), 'OBGYN'          , 'Gynecology'         );
INSERT INTO Doctor(doctor_id, last_name, first_name, date_of_employment, specialization, department) values ('6964', 'Mocanu'  , 'Stefan', to_date('14-02-2013','dd-mm-yyyy'), 'paediatrician'  , 'paediatrics'        );
INSERT INTO Doctor(doctor_id, last_name, first_name, date_of_employment, specialization, department) values ('4200', 'Tudorici', 'Matei' , to_date('28-10-2015','dd-mm-yyyy'), 'endocrinologist', 'endocrinology'      );
INSERT INTO Doctor(doctor_id, last_name, first_name, date_of_employment, specialization, department) values ('8945', 'Matache' , 'Luca'  , to_date('07-11-2016','dd-mm-yyyy'), 'ENT specialist' , 'Otorhinolaryngology');
INSERT INTO Doctor(doctor_id, last_name, first_name, date_of_employment, specialization, department) values ('7887', 'Savu'    , 'Elvira', to_date('12-12-2017','dd-mm-yyyy'), 'psychiatrist'   , 'psychiatry'         );


-- insert treatments
INSERT INTO Treatment(treatment_id, date_begin, date_end, medication_price, diagnostic_id) values ('125' , to_date('13-01-2023', 'dd-mm-yyyy'), to_date('14-01-2023', 'dd-mm-yyyy'), 150 , '223');
INSERT INTO Treatment(treatment_id, date_begin, date_end, medication_price, diagnostic_id) values ('145' , to_date('06-01-2023', 'dd-mm-yyyy'), to_date('07-01-2023', 'dd-mm-yyyy'), 190 , '333');
INSERT INTO Treatment(treatment_id, date_begin, date_end, medication_price, diagnostic_id) values ('215' , to_date('28-02-2023', 'dd-mm-yyyy'), to_date('30-03-2023', 'dd-mm-yyyy'), 300 , '413');
INSERT INTO Treatment(treatment_id, date_begin, date_end, medication_price, diagnostic_id) values ('665' , to_date('15-02-2023', 'dd-mm-yyyy'), to_date('16-02-2023', 'dd-mm-yyyy'), 140 , '423');
INSERT INTO Treatment(treatment_id, date_begin, date_end, medication_price, diagnostic_id) values ('695' , to_date('16-03-2023', 'dd-mm-yyyy'), to_date('17-03-2023', 'dd-mm-yyyy'), 870 , '453');
INSERT INTO Treatment(treatment_id, date_begin, date_end, medication_price, diagnostic_id) values ('705' , to_date('18-09-2022', 'dd-mm-yyyy'), to_date('19-09-2022', 'dd-mm-yyyy'), 90  , '603');
INSERT INTO Treatment(treatment_id, date_begin, date_end, medication_price, diagnostic_id) values ('815' , to_date('29-10-2022', 'dd-mm-yyyy'), to_date('30-11-2022', 'dd-mm-yyyy'), 5400, '803');
INSERT INTO Treatment(treatment_id, date_begin, date_end, medication_price, diagnostic_id) values ('825' , to_date('25-11-2021', 'dd-mm-yyyy'), to_date('26-12-2021', 'dd-mm-yyyy'), 179 , '183');
INSERT INTO Treatment(treatment_id, date_begin, date_end, medication_price, diagnostic_id) values ('835' , to_date('13-01-2021', 'dd-mm-yyyy'), to_date('13-03-2021', 'dd-mm-yyyy'), 185 , '993');

-- insert admissions
INSERT INTO Admission(admission_id, date_begin, date_end, diagnostic_id, room_number) values ('1001' , to_date('16-03-2023', 'dd-mm-yyyy'), to_date('17-03-2023', 'dd-mm-yyyy'), '803', '2203');
INSERT INTO Admission(admission_id, date_begin, date_end, diagnostic_id, room_number) values ('1002' , to_date('18-09-2022', 'dd-mm-yyyy'), to_date('19-09-2022', 'dd-mm-yyyy'), '603', '2706');
INSERT INTO Admission(admission_id, date_begin, date_end, diagnostic_id, room_number) values ('1008' , to_date('29-10-2022', 'dd-mm-yyyy'), to_date('30-11-2022', 'dd-mm-yyyy'), '223', '2016');
INSERT INTO Admission(admission_id, date_begin, date_end, diagnostic_id, room_number) values ('1230' , to_date('25-11-2021', 'dd-mm-yyyy'), to_date('26-12-2021', 'dd-mm-yyyy'), '333', '2104');
INSERT INTO Admission(admission_id, date_begin, date_end, diagnostic_id, room_number) values ('2001' , to_date('13-01-2021', 'dd-mm-yyyy'), to_date('13-03-2021', 'dd-mm-yyyy'), '993', '2203');
