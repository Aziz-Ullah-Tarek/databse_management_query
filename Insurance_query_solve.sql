select driver_id
from participated 
where damage_amount>100000;

select name 
from person
natural join participated
where driver_id in (
select driver_id
from participated
);

select license_plate,count(report_number)as accident_per_car
from participated
group by license_plate;

create view avg_acci_perloc as
select location,avg(damage_amount)as avg_dam_amount
from participated
natural join accident
group by location;

select *
from driver_car_deatils;

create view driver_car_deatils as
select *
from person
natural join car
natural join owns;

select count(distinct report_number)as total_accidents
from participated
natural join person
where name='tarek';

update participated
set damage_amount=3000
where license_plate='aabb2000' and report_number='ar2197';

select * from participated;

select driver_id,name
from participated
natural join person
group by driver_id
having sum(damage_amount)>
(
select avg(damage_amount)
from participated
);