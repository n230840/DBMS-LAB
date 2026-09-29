use gram_panchayat_db;
SHOW TABLES;

SELECT * FROM citizen;

SELECT * FROM certificate_type;

SELECT * FROM panchayat_office;

SELECT * FROM certificate_application;

create view all_certificate_applications as
select application_id,certificate_id,application_date
from certificate_application;
select * from all_certificate_applications;

create view application_citizen as
select application_id,citizen_id,application_status
from certificate_application;
select * from application_citizen;

create view approved_applications as
select application_id 
from certificate_application
where application_status = "approved";
select * from approved_applications;
select * from approved_applications;

show full tables
where table_type = 'VIEW' ;

create view certificate_date as 
select ct.certificate_name,ca.application_date
from certificate_application ca
join certificate_type ct 
on ca.certificate_id = ct.certificate_id;
select * from certificate_date;

select * from certificate_date; 


create view citizen_status as
select c.full_name ,ca.application_status 
from citizen c
join certificate_application ca 
on ca.citizen_id = c.citizen_id;

select * from citizen_status;


create view application_office as 
select po.office_name , count(ca.application_id) 
from panchayat_office po
join certificate_application ca
on po.office_id = ca.office_id
group by po.office_name;

select * from application_office;


create view application_certificate as 
select ct.certificate_name , count(ca.application_id)
from certificate_type ct 
join certificate_application ca
on ct.certificate_id = ca.certificate_id
group by ct.certificate_name;

select * from application_certificate;


create view office_application as 
select po.office_name , count(ca.application_id) 
from panchayat_office po
join certificate_application ca
on po.office_id = ca.office_id
group by po.office_name,po.office_name;

select * from office_application;



create view pending_applications as
select ct.certificate_name 
from certificate_type ct 
join certificate_application ca
on ct.certificate_id = ca.certificate_id
where ca.application_status = "pending" ;

select * from pending_applications;

-- task 7
select full_name from citizen_status;

-- task 8
show create view pending_applications;

-- medium to advanced

-- task 1
create view task_1 as 
select ct.certificate_name , count(ca.application_id)
from certificate_type ct 
join certificate_application ca
on ct.certificate_id = ca.certificate_id
group by ct.certificate_name;
select * from task_1;

-- task 2

create view task_2 as 
select po.office_name 
from panchayat_office po
join certificate_application ca
on po.office_id = ca.office_id
group by po.office_name
having count(ca.application_id) > 1;

select * from task_2;

-- task 3

create view task_3 as
select ct.certificate_name , min(ca.application_date) as earliest_date,max(ca.application_date) as latest_date
from certificate_type ct
join certificate_application ca
on ca.certificate_id = ct.certificate_id
group by ct.certificate_name;

select * from task_3;


-- task_4
create view task_4 as
select c.full_name , count(ca.application_id)
from citizen c 
join certificate_application ca
on c.citizen_id = ca.citizen_id
group by c.full_name;

select * from task_4;


-- task 5 

create view task_5 as
select c.citizen_id ,c.full_name ,ct.certificate_name,ca.application_id ,ca.application_date
from citizen c
join certificate_application ca
on c.citizen_id = ca.citizen_id
join certificate_type ct
on ct.certificate_id = ca.certificate_id;

select * from task_5;


-- task 6
create view task_6 as
select ca.application_id,c.full_name , ct.certificate_name 
from citizen c 
join certificate_application ca
on ca.citizen_id = c.citizen_id
join certificate_type ct
on ct.certificate_id = ca.certificate_id
where ca.application_status = "approved"; 

select * from task_6;


-- task_7

select * from task_6
where certificate_name = "Income certificate";

-- task 8
drop  view task_6;

show full tables
where table_type = "VIEW";

