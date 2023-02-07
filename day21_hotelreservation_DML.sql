use hotelreservation;
/*
insert into customer (first_name, last_name) values ('James' , 'Bond');
insert into customer (first_name, last_name) values ('Lawrence' , 'Wong');
insert into customer (first_name, last_name) values ('Swee Kiat' , 'Ng');
insert into customer (first_name, last_name) values ('Darryl' , 'Toh');
insert into customer (first_name, last_name) values ('Justin' , 'Beaver');
insert into customer (first_name, last_name) values ('Justin', 'Timberlake');
insert into customer (first_name, last_name) values ('Lady', 'Gaga');
insert into customer (first_name, last_name) values ('Sam', 'Smith');
insert into customer (first_name, last_name) values ('Conor', 'Mcgregor');

insert into room (room_type, price) values ('standard', 100);
insert into room (room_type, price) values ('deluxe', 200);
insert into room (room_type, price) values ('president', 300);
insert into room (room_type, price) values ('suite', 400);
*/

select * from customer;

select * from room;


insert into reservation (customer_id, room_id, start_date, end_date, total_cost)
values (1, 1, '2023-03-01','2023-03-02',100);
insert into reservation (customer_id, room_id, start_date, end_date, total_cost)
values (2, 2, '2023-03-01','2023-03-02',200);
insert into reservation (customer_id, room_id, start_date, end_date, total_cost)
values (3, 3, '2023-03-01','2023-03-02',300);
insert into reservation (customer_id, room_id, start_date, end_date, total_cost)
values (4, 4, '2023-03-01','2023-03-02',400);
insert into reservation (customer_id, room_id, start_date, end_date, total_cost)
values (5, 4, '2023-03-01','2023-03-02',400);
insert into reservation (customer_id, room_id, start_date, end_date, total_cost)
values (1, 1, '2023-03-01','2023-03-02',100);
insert into reservation (customer_id, room_id, start_date, end_date, total_cost)
values (2, 2, '2023-03-01','2023-03-02',200);
insert into reservation (customer_id, room_id, start_date, end_date, total_cost)
values (3, 3, '2023-03-01','2023-03-02',300);
insert into reservation (customer_id, room_id, start_date, end_date, total_cost)
values (4, 4, '2023-03-01','2023-03-02',400);
insert into reservation (customer_id, room_id, start_date, end_date, total_cost)
values (5, 2, '2023-03-01','2023-03-02',200);

/* ALTER TABLE reservation AUTO_INCREMENT = value;
*/

delete from reservation where first_name = 'James';


select * from reservation;

Select * from customer
inner join reservation
on customer.id = reservation.customer_id
inner join room
on reservation.room_id = room.id;

Select resv.id resv_id, cust.id cust_id, cust.first_name, cust.last_name,
resv.start_date, resv.end_date, resv.total_cost, room.price, room.room_type
from customer cust
inner join reservation resv
on cust.id = resv.customer_id
inner join room
on resv.room_id = room.id
where first_name like "%Darryl%";

Select distinct cust.first_name, cust.last_name
from customer cust
inner join reservation resv
on cust.id = resv.customer_id
inner join room
on resv.room_id = room.id;

select start_date, sum(total_cost) from reservation
where start_date = '2023-02-01';

select start_date, avg(total_cost) from reservation
where start_date = '2023-02-01';

select *, length(first_name) from customer;

# For union, have to be repeated methods
select 'Mar 2023' as period, room_id, count(*) cnt
from reservation
where start_date between '2023-03-01' and '2023-03-31' 
group by room_id
union
select 'Feb 2023' as period, room_id, count(*) cnt
from reservation
where start_date between '2023-02-01' and '2023-02-28'
group by room_id
order by cnt desc;

select 'Mar 2023' as period, room_id, count(*) cnt
from reservation
where start_date between '2023-03-01' and '2023-03-31' 
group by room_id
having cnt > 2;


select * from customer
order by first_name asc, last_name desc;

select * from reservation
where start_date between '2023-02-01' and '2023-02-28';

create table customer2(
	id int not null auto_increment,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    primary key (id)
);


insert into customer2 (first_name, last_name) values ('James' , 'Bond');
insert into customer2 (first_name, last_name) values ('Lawrence' , 'Wong');
insert into customer2 (first_name, last_name) values ('Swee Kiat' , 'Ng');
insert into customer2 (first_name, last_name) values ('Darryl' , 'Toh');
insert into customer2 (first_name, last_name) values ('Justin' , 'Beaver');
insert into customer2 (first_name, last_name) values ('Justin', 'Timberlake');
insert into customer2 (first_name, last_name) values ('Lady', 'Gaga');
insert into customer2 (first_name, last_name) values ('Sam', 'Smith');
insert into customer2 (first_name, last_name) values ('Conor', 'Mcgregor');
insert into customer2 (first_name, last_name) values ('DJ', 'Khaled');

select * from customer2;

update customer2
set first_name = 'Travis',
last_name = 'Scott'
where id = 8;

delete from customer2
where id = 6;

delete from customer2;
/*
create table customer3 as select * from customer;
select * from customer3;
*/