use [Easy-FlyDB];
go
create table users
(
users_id int,
first_name varchar(20) not null,
last_name varchar(20) not null,
username varchar(20) not null,
email_address varchar(20) not null,
user_password varchar(20) not null ,
constraint users_primary primary key (users_id),
constraint chk_password_length check (len(user_password) >= 8)

);