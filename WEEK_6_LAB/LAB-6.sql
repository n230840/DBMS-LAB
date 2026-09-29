use gram_panchayat_db;
SHOW TABLES;

SELECT * FROM citizen;

SELECT * FROM certificate_type;

SELECT * FROM panchayat_office;

SELECT * FROM certificate_application;

select  application_date 
from certificate_application 
where application_date = (
select max(application_date)
from certificate_application); --


select application_date
from certificate_application
where application_date = (
select min(application_date)
from certificate_application); --



select *
from certificate_application
where application_date = (
select max(application_date)
from certificate_application); --


select application_id 
from certificate_application
where application_date = (
select min(application_date)
from certificate_application); --


select full_name
from  citizen
where citizen_id in (
select citizen_id
from certificate_application
where application_status = "approved" ); -- 


select application_id
from certificate_application
where application_date > any (
select min(application_date)
from certificate_application); --


select application_id
from certificate_application
where application_date < any (
select max(application_date)
from certificate_application); --



select full_name
from citizen
where citizen_id in (
select citizen_id
from certificate_application
where application_status = "submitted"); --




select full_name
from citizen
where citizen_id not in (
select citizen_id
from certificate_application
where application_status = "submitted");--

select certificate_name 
from certificate_type 
where certificate_id in (
select certificate_id
from certificate_application
where application_status = "approved"); --

select certificate_name 
from certificate_type 
where certificate_id not in (
select certificate_id
from certificate_application
where application_status = "approved"); --


select application_id
from certificate_application
where application_date > any (
select avg(application_date)
from certificate_application); --


select ct.certificate_name , ca.application_date
from certificate_type ct 
join certificate_application ca
on ct.certificate_id = ca.certificate_id
where ca.application_date in (
select max(application_date)
from certificate_application); --


select certificate_name
from certificate_type ct
join certificate_application ca
on ct.certificate_id = ca.certificate_id
group by ct.certificate_id,certificate_name
having count(ca.application_id) = 
( select max(total)
	from(
		select count(application_id) as total
        from certificate_application
        group by certificate_id
        ) as X
);



select po.office_name 
from panchayat_office po
join certificate_application ca
on po.office_id = ca.office_id
group by po.office_id 
having count(po.office_id) =
(select max(total) 
	from(
		select count(application_id) as total
		from certificate_application
		group by office_id
    )as X
);


select ct.certificate_name 
from certificate_type ct
join certificate_application ca
on ct.certificate_id = ca.certificate_id
group by ct.certificate_id
having count(ca.application_id) >
( select avg(total)
	from (
		select count(application_id) as total
        from certificate_application
        group by certificate_id
        ) as X
	);
    

select po.office_name 
from panchayat_office po
join certificate_application ca
on po.office_id = ca.office_id
group by po.office_id
having count(ca.application_id) > any (
	select count(application_id)
    from certificate_application
    group by office_id
    );
    
    
select po.office_name 
from panchayat_office po
join certificate_application ca
on po.office_id = ca.office_id
group by po.office_id
having count(ca.application_id) >= all (
	select count(ca2.application_id)
    from certificate_application ca2
    group by office_id
    );




select ct.certificate_name
from certificate_type ct
join certificate_application ca
on ct.certificate_id = ca.certificate_id
where ca.application_date = (
	select max(application_date)
    from certificate_application
    );



select c.full_name 
from citizen c
where citizen_id in
(	select citizen_id
    from certificate_application
    group by citizen_id
    having count(application_id) > 1
    );



select  ca.application_status 
from certificate_application ca
group by application_status
having count(*) = 
(
	select max(total) 
    from ( 
			select count(application_id) as total 
            from certificate_application 
            group by application_status
            ) as X
	);
		