use lecture4;
create table if not exists expenses 
(id bigint unsigned auto_increment, 
expense_amt numeric not null,
exp_date date not null,
expense_type varchar(20),
user_id integer not null,
primary key (id),
foreign key (user_id) references users(user)	
);
-- this is a comment
create table if not exists incomes 
(id bigint unsigned auto_increment, 
income_amt numeric not null,
inc_date date not null,
inc_type varchar(20),
user_id integer not null,
primary key (id),
foreign key (user_id) references users(user)	
);

-- to change something, do "alter table tableName modify elementName element_attributes";
insert into users
(country, email, user, phonenum) -- to insert
values -- specify values to insert, respective to col above
('USA', 'user@username.com', 'user', '1111111111');

alter table users modify phone_num varchar(20) not null unique;

insert into expenses
(expense_amt, exp_date, expense_type, user_id)
values
(100.50, '2022-05-05', 'internet bill', 4); -- sent an error saying that user w/ id 10 exists, but it actually doesn't; referential violation

-- 100.50 created error bc we did not specify decimal amt for this col
alter table expenses modify expense_amt numeric(10,2) -- can have up to 10 digits w/ 2 decimal points