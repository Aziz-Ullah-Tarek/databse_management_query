CREATE DATABASE insurance;
use insurance;

create table person(
driver_id varchar(20) primary key,
name varchar(50),
address varchar(50)
);

create table car(
license_plate varchar(20) primary key,
model varchar(50),
year int 
);


create table accident(
report_number varchar(20) primary key,
year int,
location varchar(50)
);

create table owns(
driver_id varchar(20),
license_plate varchar(20),
primary key (driver_id,license_plate),
foreign key(driver_id) references person(driver_id),
foreign key(license_plate) references car(license_plate)
);

create table participated(
report_number varchar(20),
license_plate varchar(20),
driver_id varchar(20),
damage_amount decimal(10,2),
primary key (report_number,license_plate),
foreign key(report_number)references accident(report_number),
foreign key(license_plate) references car(license_plate)
);

insert into person
values('d-1','tarek','chandpur'),
('d-2','fatin','chittagong'),
('d-3','ijaj','munshigonj');
insert into car
values('AABB2000','toyota',2024),
('BB200','corolla',2022),
('abc20','honda civic',2020);

insert into accident
values('AR2197',2024,'dhaka'),
('AR2020',2025,'cumilla'),
('AR2022',2026,'new york');

insert into owns
values('d-1','AABB2000'),
('d-2','BB200'),
('d-1','abc20');
insert into participated
values('AR2197','AABB2000','d-1',200000),
('AR2020','BB200','d-2',200000),
('AR2022','abc20','d-3',50000);

select*
from accident
where year=2024;

select report_number, SUM(damage_amount) as total_dam_ammount
from participated
group by report_number;

select license_plate
from participated
natural join accident
where location='new york';

select driver_id,count(license_plate) as num_cars
from owns
natural join person
group by driver_id;

delete from car
where license_plate NOT IN
(select license_plate
from participated);
                           
select license_plate
from car;

update car
set model='mahindra'
where license_plate='BB200';

select* from car;

select MAX(damage_amount) as maximumdam_amo,
       MIN(damage_amount) as minimumsam_amo
       from participated;

select driver_id
from participated 
where damage_amount>100000;



delete from person;
set sql_safe_updates=0;
