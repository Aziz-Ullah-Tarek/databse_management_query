-- query1
select account_id,balance
from account 
natural join branch
where account_type='saving' and branch_name='mirpur';

-- query2
select customer_name
from customer
where address like'%hand%';



-- query3
select customer_name
from customer
natural join loan
where issue_date='2024-04-26'
order by customer_name;

-- query4
select transaction_type,max(amount) as highest_trans_amount
from transaction
where transaction_type in ('debit','credit')
group by transaction_type;

-- query5
select branch_name,count(transaction_id)as number_transaction
from transaction
natural join account
natural join branch
group by branch_name;

-- query6
select customer_name
from customer
where customer_id not in(
select customer_id
from transaction
natural join account
natural join customer
);

-- query7
create view customerBranchview as
select customer_name,branch_name
from customer
natural join loan
natural join branch;

select* from customerBranchview;


