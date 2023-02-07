use adventureworks;

select * from employee;

select e.* 
from employee e 
where e.Title like '%a%' ;

select e.* 
from employee e 
where e.Gender like 'M' ;

select Gender, count(*) 
from employee 
where Gender = 'M'
union
select Gender, count(*) 
from employee 
where Gender = 'F' ;