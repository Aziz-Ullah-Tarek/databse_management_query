CREATE DATABASE BANKING_SYSTEM;
USE banking_system;
create table customer(
customer_id varchar(20) primary key,
customer_name varchar(50),
phone_number varchar(15),
address text,
dob date
);
create table branch(
branch_id varchar(10)primary key,
branch_name varchar(50),
branch_address varchar(50)
);

create table account(
account_id varchar(10) primary key,
account_type varchar(10),
balance numeric(10,2),
branch_id varchar(10),
foreign key(branch_id)references branch(branch_id)
);
create table transaction(
transaction_id varchar(10)primary key,
transaction_type varchar(10),
amount numeric(8,2),
transaction_date date,
account_id varchar(10),
foreign key(account_id) references account(account_id)
);
create table loan(
loan_id varchar(10) primary key,
loan_type varchar(10),
loan_amount numeric(8,2),
issue_date date,
branch_id varchar(10),
customer_id varchar(10),
foreign key(branch_id)references branch(branch_id),
foreign key(customer_id)references customer(customer_id)
);

insert into customer
values('c-1','tarek','01643884854','chandpur','2002-07-02'),
('c-2','fatin','01643884855','coxs bazar','2000-07-03'),
('c-3','ijaj','01643884774','munshigonj','2001-07-22');

insert into branch
values('b-1','mirpur','dhaka'),
('b-2','kandirpar','coumilla'),
('b-3','hazigonj','chandpur');


insert into account
values('a-101','saving',200000,'b-1'),
('a-102','current',300000,'b-2'),
('a-103','saving',50000,'b-3');

insert into transaction
values('t-51','credit',20000,'2024-04-26','a-101'),
('t-52','debit',15000,'2022-04-25','a-102'),
('t-53','credit',50000,'2011-04-01','a-103');

insert into loan
values('l-1001','home',21000,'2024-04-26','b-1','c-1'),
('l-1002','car',27000,'2022-04-16','b-2','c-2'),
('l-1003','home',71000,'2025-04-01','b-3','c-3');




