SET AUTOCOMMIT = 0 ;
SELECT @@AUTOCOMMIT ;
use gram_panchayat_db;

select current_user();

select user,host
from mysql.user
where user = 'clerk1';

start transaction;
update certificate_application 
set application_status = "approved"
where application_id = 1002;
commit;

start transaction;
update certificate_application 
set application_status = "rejected"
where application_id = 1002;
rollback;


start transaction;
update certificate_application 
set application_status = "pending"
where application_id = 1002;
rollback;
select * from certificate_application;

start transaction ;
insert into certificate_application values(1013,4,"2026-02-24","college admisiion","pending",40,"GP2026000013",3,6);
rollback;

start transaction;
delete from certificate_application 
where application_id = 1012;
rollback;


start transaction;
update certificate_application 
set application_status = "rejected"
where application_id = 1002;
update certificate_application 
set application_status = "pending"
where application_id = 1003;
commit;
select * from certificate_application;


-- part c

start transaction ;
update certificate_application 
set application_status = "pending"
where application_id = 1003;
savepoint application_update;
update certificate_application 
set application_status = "pending"
where application_id = 1002;
rollback to savepoint  application_update;


start transaction ;
insert into certificate_application values(1013,4,"2026-02-24","college admisiion","pending",40,"GP2026000013",3,6);
savepoint application_update;
update certificate_application 
set application_status = "pending"
where application_id = 1002;
rollback to savepoint application_update ;
commit;
select * from certificate_application;


start transaction;
update certificate_application 
set application_status = "pending"
where application_id = 1002;
savepoint sp1;
update certificate_application 
set application_status = "pending"
where application_id = 1001;
savepoint sp2;
update certificate_application 
set application_status = "pending"
where application_id = 1003;
rollback to savepoint sp1;
commit;
select * from certificate_application;


start transaction;
insert into certificate_application values(1014,4,"2026-02-24","college admisiion","pending",40,"GP2026000013",3,6);
update certificate_application 
set application_status = "pending"
where application_id = 1010;
savepoint sp1;
delete from certificate_application 
where application_id = 1007;
rollback to savepoint sp1;
commit;


start transaction;
delete from certificate_application 
where application_id = 1012;
savepoint sp1;
release savepoint sp1;
rollback to savepoint sp1;


start transaction;
delete from certificate_application 
where application_id = 1004;
savepoint sp1;
delete from certificate_application 
where application_id = 1008;
rollback to savepoint sp1;
rollback;
select * from certificate_application;


-- part D

create user 'clerk1'@'localhost'
identified by 'Clerk@123';

select user , host 
from mysql.user
where user ='clerk1' ;

show grants for 
'clerk'@'localhost';

select current_user();

-- task 2
grant select on 
certificate_application to 
'clerk1'@'localhost';

show grants for 
'clerk1'@'localhost' ;

-- task 3

grant insert on 
certificate_application to 
'clerk1'@'localhost' ;

-- task 4

-- task 5

grant select on 
approved_applications to 
'clerk1'@'localhost' ; 

show full tables where table_type = "VIEW";

-- task 6 

revoke insert on
certificate_application from
'clerk1'@'localhost' ;

show grants for 'clerk1'@'localhost' ;

-- part E 

-- task 1

-- task 2
create user 'officer1'@'localhost'
identified by 'officer1@123';

grant select,insert,update on
certificate_application to 
'officer1'@'localhost';
-- task 3
grant select on
approved_applications to 
'officer1'@'localhost';
-- task 4
revoke insert on
certificate_application from
'officer1'@'localhost' ;

-- task 5 
show grants for 'clerk1'@'localhost' ;
show grants for 'officer1'@'localhost' ;

-- task 6

create user 'clerk2'@'localhost'
identified by 'clerk2@123' ;

grant select,insert on
certificate_application to 
'clerk2'@'localhost' ;


-- part F 
-- task 1
start transaction ;
insert into certificate_application(application_id , certificate_id,office_id, application_status) values(102,1,1,"pending");
commit;

select * from certificate_application;

-- task 2

start transaction ;
update certificate_application set application_status = "approved" where application_id = 102;
rollback;

-- task 3

start transaction ;
insert into certificate_application(application_id , certificate_id,office_id, application_status) values(103,1,1,"pending");
savepoint sp1;
insert into certificate_application(application_id , certificate_id,office_id, application_status) values(105,1,1,"pending");
rollback to savepoint sp1;

-- task 4
create user 'clerk0'@'localhost'
identified by 'clerk0@123';

grant select ,insert on 
certificate_application to 
'clerk0'@'localhost';

-- task 5
grant select on 
approved_applications to 
'clerk0'@'localhost';

show grants for 'clerk0'@'localhost';

-- task 6

revoke insert on 
certificate_application from
'clerk0'@'localhost';