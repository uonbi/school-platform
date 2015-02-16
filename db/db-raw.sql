CREATE TABLE school(
	scid int primary key auto_increment,
	name varchar(100)
);

CREATE TABLE user_level(
	ulid int primary key auto_increment,
	level int,
	level_name varchar(40)
);

CREATE TABLE user(
	uid int primary key auto_increment,
	ulid int,
	scid int,
	username varchar(40),
	email varchar(50),
	designation varchar(20),
	photo varchar(200),
	password varchar(50),
	date_time timestamp default current_timestamp,
	foreign key(ulid) references user_level(ulid),
	foreign key(scid) references school(scid)
);

CREATE TABLE student(
	sid int primary key auto_increment,
	scid int,
	admin_number varchar(40),
	surname varchar(20),
	other_names varchar(100),
	year_of_admin year,
	email varchar(50),
	email_uni varchar(50),
	phone varchar(20),
	date_time timestamp default current_timestamp,
	uid int,
	foreign key (scid) references school(scid)
);

CREATE TABLE student_next_of_kin(
	nkid int primary key auto_increment,
	sid int,
	name varchar(50),
	relationship varchar(20),
	email varchar(50),
	location varchar(50),
	date_time timestamp default current_timestamp,
	foreign key (sid) references student(sid)
);

CREATE TABLE st_event_category(
	ecid int primary key auto_increment,
	event_category varchar(20),
	description text
);

CREATE TABLE st_event(
	eid int primary key auto_increment,
	sid int,
	ecid int,
	description text,
	event_date date,
	date_time timestamp default current_timestamp,
	uid int,
	foreign key(sid) references student(sid),
	foreign key(ecid) references st_event_category(ecid)
);


CREATE TABLE st_event_document(
	did int primary key auto_increment,
	eid int,
	label varchar(30),
	description text,
	date_time timestamp default current_timestamp,
	uid int,
	foreign key(eid) references st_event(eid)
);

CREATE TABLE st_event_comment(
	cid int primary key auto_increment,
	eid int,
	uid int,
	comment text,
	date_time timestamp default current_timestamp,
	foreign key(uid) references user(uid),
	foreign key(eid) references st_event(eid)
);