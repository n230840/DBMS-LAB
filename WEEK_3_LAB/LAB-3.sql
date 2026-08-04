use gram_panchayat_db;
show tables;
select * from citizen;
select * from certificate_type;
select * from certificate_application;
select * from panchayat_office;
update certificate_application set certificate_id = 7 where application_id = 1006;
alter table gram_panchayat rename citizen;
alter table certificate_application drop column certificate_name;
alter table certificate_application drop column issued_date;
alter table certificate_application add certificate_id int , add office_id int;
update certificate_application set certificate_id = 1, office_id = 1 where citizen_id = 1;
update certificate_application set certificate_id = 2, office_id = 2 where citizen_id = 2;
update certificate_application set certificate_id = 3, office_id = 3 where citizen_id = 3;
update certificate_application set certificate_id = 4, office_id = 4 where citizen_id = 4;
update certificate_application set certificate_id = 5, office_id = 5 where citizen_id = 5;
update certificate_application set certificate_id = 6, office_id = 6 where citizen_id = 6;
alter table certificate_application add constraint fk_citizen foreign key (citizen_id) references citizen(citizen_id);
show create table certificate_application;
insert into certificate_application(application_id , citizen_id ) values(2000,999);
insert into certificate_application(certificate_id,citizen_id) values(2000,999);
alter table certificate_type rename column certificate_type_id to certificate_id;
alter table certificate_application add constraint fk_certificate_id foreign key (certificate_id) references certificate_type(certificate_id);
alter table certificate_application add constraint fk_office_id foreign key (office_id) references panchayat_office(office_id);
alter table certificate_type add column citizen_id int;
alter table certificate_type add constraint fk_citizen_id foreign key (citizen_id) references citizen(citizen_id);
update certificate_type set citizen_id = 1 where certificate_id = 1;
update certificate_type set citizen_id = 2 where certificate_id = 2;
update certificate_type set citizen_id = 3 where certificate_id = 3;
update certificate_type set citizen_id = 4 where certificate_id = 4;
update certificate_type set citizen_id = 5 where certificate_id = 5;
update certificate_type set citizen_id = 6 where certificate_id = 6;
update certificate_type set citizen_id = 7 where certificate_id = 7;
 

-- part c
-- basic retrival queries	

select full_name from citizen order by full_name ;
select distinct village_name from citizen;
select distinct certificate_name from certificate_type order by certificate_name;
select distinct office_name from panchayat_office order by office_name;
select  purpose,application_status from certificate_application where application_status = "under review";
select full_name from citizen where village_name = "ramapuram";
select * from certificate_application where year(application_date) = 2026;
select * from certificate_application order by date(application_date) desc;
select * from certificate_application where office_id = ( select office_id from panchayat_office where office_name = "Lakshmipuram gram panchayat"); 
select * from citizen where citizen_id = (select citizen_id from certificate_type where certificate_name = "Income Certificate"); 


-- set operations
select c.full_name from citizen c join certificate_application ca on c.citizen_id = ca.citizen_id  join certificate_type ct on ca.certificate_id = ct.certificate_id  where ct.certificate_name = "Income certificate" union select c.full_name from citizen c join certificate_application ca on c.citizen_id = ca.citizen_id  join certificate_type ct on ca.certificate_id = ct.certificate_id  where ct.certificate_name = "Residence Certificate" ;
desc certificate_type;
select * from certificate_application where month(application_date) =1 union select * from certificate_application where month(application_date) = 2;
select full_name from citizen where village_name = "Ramapuram" union select full_name from citizen where village_name = "Lakshmipuram" ;
select full_name from citizen where citizen_id in (select citizen_id from certificate_application where certificate_id = 7) and citizen_id in(select citizen_id from certificate_application where certificate_id = 1);
select application_id from certificate_application where year(application_date) = 2025 and application_id in (select application_id from certificate_application where year(application_date) = 2026);
select full_name from citizen where citizen_id in (select citizen_id from certificate_application where certificate_id = 7) and citizen_id not in (select citizen_id from certificate_application where certificate_id = 1);
select full_name from citizen where village_name = "Ramapuram" and citizen_id not in (select full_name from citizen where village_name = "Lakshmipuram") ;
select full_name from citizen where citizen_id in (select citizen_id from certificate_application) ;
select full_name from citizen where citizen_id not in (select citizen_id from certificate_application) ;
select full_name from citizen c where exists (select * from certificate_application ca where ca.citizen_id = c.citizen_id);
select full_name from citizen c where not exists (select * from certificate_application ca where ca.citizen_id = c.citizen_id);
select full_name from citizen where citizen_id in (select citizen_id from certificate_application where fee_paid > any (select fee_paid from certificate_application));
select full_name from citizen where citizen_id in (select citizen_id from certificate_application where fee_paid >= all (select fee_paid from certificate_application));
select full_name from citizen where village_name in(select village_name from citizen where citizen_id in (select citizen_id from certificate_application where certificate_id = 7));
select office_name from panchayat_office where office_id not in (select office_id from certificate_application);
select certificate_name from certificate_type ct where not exists ( select * from certificate_application ca where ca.certificate_id= ct.certificate_id);
select full_name from citizen where date_of_birth > any (select date_of_birth from citizen where village_name = "Ramapuram"); 
select full_name from citizen where date_of_birth > all (select date_of_birth from citizen where village_name = "Ramapuram"); 
select ct.processing_days from certificate_type ct join certificate_application ca on ct.certificate_id = ca.certificate_id join panchayat_office po on ca.office_id = po.office_id where po.office_name = "Nuzvid Panchayt Office";
select * from certificate_application where certificate_id in (select certificate_id from certificate_type where processing_days > all (select processing_days from certificate_type));

