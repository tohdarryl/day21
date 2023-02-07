# create database hotelreservation;

use hotelreservation;
/*
create table employee (
	id int not null auto_increment,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    salary int not null,
	primary key (id)
);

create table room (
	id int not null auto_increment,
    room_type enum ('standard', 'deluxe','president','suite') not null,
    price int not null,
    primary key (id)
);

create table customer (
	id int not null auto_increment,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    primary key (id)
);

create table reservation (
	id int not null auto_increment,
    customer_id int not null,
    room_id int not null,
    start_date date,
    end_date date,
    total_cost decimal(8,2) not null,
    primary key(id),
    foreign key(customer_id) references customer(id),
    foreign key(room_id) references room(id)
);
*/

create table dependant (
	id int not null auto_increment,
    employee_id int not null,
    first_name varchar(100) not null,
    last_name varchar(100) not null,
    # fullname varchar(100) not null,
    relationship enum('father', 'mother','brother','sister'),
    # relationshop varchar(30) not null,
    birth_date date,
    primary key(id),
    foreign key(employee_id) references employee(id)
);

select count(*) from room;

select * from room
