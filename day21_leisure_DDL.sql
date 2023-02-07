# create database leisure;

use leisure;

create table tv_shows (
	prog_id int not null,
    title char(64) not null,
    lang char(16) not null,
    official_site varchar(256),
    rating enum('G', 'PG', 'NC16', 'M18', 'R21') not null,
    user_rating float default '0.0',
    release_date date,
    image blob,
    constraint pk_prog_id primary key (prog_id),
    constraint chk_user_ratingtv_showstv_shows
		check(user_rating between 0.0 and 10.0)
);

create table tutorials (
	id int not null auto_increment,
    title varchar(100) not null,
    author varchar(80) not null,
    submission_date date,
    constraint pk_tutorial_id primary key (id)
);
select * from tv_shows
