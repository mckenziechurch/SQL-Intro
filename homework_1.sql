alter table employee modify ssn char(9) not null;
alter table employee modify fname varchar(45) not null;
alter table employee modify lname varchar(45) not null;
alter table dependent modify emplayID int unsigned not null;
alter table dependent modify depFullName varchar(100) not null;
insert into dependent
(emplayID, depFullName, bdate, relationship)
values
(1, 'Ted Smith', 2000-10-10, 'son');

insert into employee
(fname, lname, ssn, bdate)
values
('Chase', 'White', 123456789, 1969-09-09);

insert into dependent
(emplayID, depFullName, bdate, relationship)
values
(6, 'Henry Bank', 2002-09-10, 'son');

delete from dependent
(emplayID, depFullName, bdate, relationship)
values
(1, 1, 'Ted Smith', 2000-10-10);

delete from employee
(fname, lname, ssn, bdate)
values
(1, John, Smith, 123456789, 1968-09-09);