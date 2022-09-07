-- lecture 6 
-- referential integrity constraints: referenced table = parent table
-- referencing table = parent table
-- foreign key of a child table should not be a part of its own primary key
-- relation example: Child(foreign_key) references Parent(primary_key) or C(fk) -> P(pk)
-- child table can have multiple parent tables (ie, two different columns point to two different parents)
-- foreign key does not have to be a pk of the child/referential table
-- foreign key can contain a set of attributes
-- in class exercise 4 do today
-- update operations: INSERT, DELETE, MODIFY
-- transaction: several update operations grouped together
-- updates may propogate to update automatically for other things
-- don't update pk; do not use cascade

-- alter table to specify foreign key:
-- alter table add constraint name foreign key(fk) references parent(pk) on delete cascade;

-- deleting items: delete from employee where ssn = 123456789; MUST DO BY PK

-- adding items: 
-- insert into employee
-- (fname, lname, ssn, bdate)
-- values
-- ('Chase', 'White', 123456789, 1969-09-09);

-- find info about table: desc name.column;

-- DO NOT USE DROP TO DELETE DATA; this will delete the entire table

-- to find something: select [category] from [tableName] where [attribute] = [value]
-- find something you don't know how to spell: where Name like 'partOfName%' -> % to include any word that begins with that part
