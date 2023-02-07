#drop database moviereservation;
#create database moviereservation;

use moviereservation;

create table online_user(
	id varchar(10),
    first_name varchar(100),
    last_name varchar(100),
    email varchar(100),
    phone varchar(10) not null,
    primary key(id)
);

create table cinema(
	id varchar (10),
    cinema_name varchar(50) not null,
    no_of_theatre int,
    primary key (id)
);

create table theatre(
	id varchar(10),
    cinema_id varchar(10),
    no_of_seats int not null,
    primary key(id),
    foreign key(cinema_id) references cinema(id)
);

create table movie(
	id varchar(10),
    title varchar(100) not null,
    subtitle varchar(10),
    genre varchar(20),
    primary key (id)
);

create table screening (
	id int not null auto_increment,
    show_date date not null,
    show_time time not null,
    seats_left int not null,
    theatre_id varchar(10),
    movie_id varchar(10),
    primary key (id),
    foreign key (theatre_id) references theatre(id),
    foreign key (movie_id) references movie(id)
);

create table booking (
	id varchar(20),
    no_of_tickets int not null,
    total_cost int not null,
    online_user_id varchar(10),
    screening_id int,
    primary key(id),
    foreign key(online_user_id) references online_user(id),
    foreign key(screening_id) references screening(id)
);

