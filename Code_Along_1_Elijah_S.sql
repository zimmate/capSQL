# create schema 
# Drop schema if exists
drop schema if exists sandbox;
Create schema sandbox;

# use schema
use sandbox;

#create table
CREATE TABLE sandbox.person_tbl (
person_id int, first_name varchar(30), last_name varchar(50)
);

# select table


# drop table


# select table
select * from sandbox.person_tbl;

# create table
CREATE TABLE sandbox.person_tbl (
person_id int, first_name varchar(30), last_name varchar(50)
);

# select table
select * from sandbox.person_tbl;

# will drop the whole shcema - drop schema sandbox;

# describe table
desc sandbox.person_tbl;

# alter table
# add primary key
ALTER TABLE sandbox.person_tbl
MODIFY person_id int auto_increment PRIMARY KEY;


# CRUD operations (create, read, update, delete)
# really... insert, select, update, delete

# insert
INSERT INTO sandbox.person_tbl (first_name, last_name) #person_id will populate automatically
VALUES
	('Fred', 'Flinstone'), 
	('Wilma', 'Flintsone'),
	('Barney', 'Rubble'),
    ('Betty', 'Rubble');
    
# select data
select * from sandbox.person_tbl;

# select a column
select first_name from sandbox.person_tbl;

# truncate - get rid of data, keep the table
truncate sandbox.person_tbl;

# create another table
CREATE TABLE sandbox.task_tbl (
task_id int PRIMARY KEY auto_increment,
task varchar(30),
task_desc varchar(100));

# populate task table with data
INSERT INTO sandbox.task_tbl (task, task_desc) #task_id will be populatedf automatically
VALUES
	('Pick Up Trash', 'Pick up trash around the neighborhood.'),
    ('Manage Bake Sales', 'Manage all logistics for the monthly bake sales'),
    ('Welcome Newcomers', 'Greet and meet all new citizens of Bedrock'),
    ('Lead Community Meetings', 'Lead community meetings and ,anage agendas');
    
    # select data
    select * from sandbox.task_tbl;
    
   # create a join table
   CREATE TABLE sandbox.person_task_lnk (
   person_id int,
   task_id int,
   assignment_date date,
   end_date date,
   CONSTRAINT person_id_fk FOREIGN KEY (person_id)
   REFERENCES sandbox.person_tbl (person_id),
   CONSTRAINT task_id_fk FOREIGN KEY (task_id)
   REFERENCES sandbox.task_tbl (task_id),
   PRIMARY KEY (person_id, task_id)
   );
   
   select * from sandbox.person_task_lnk;
   
   
   # populate the join table
   INSERT INTO sandbox.person_task_lnk 
	(person_id, task_id, assignment_date)
   VALUES
		(1, 3, current_date()),
        (2, 4, current_date()),
        (3, 2, current_date()),
        (4, 1, current_date());
   # select date
   select * from
   sandbox.person_task_lnk;
   
   
   # join
   select first_name, last_name, task
   from
   sandbox.person_tbl a,
   sandbox.person_task_lnk b,
   sandbox.task_tbl c
   where a.person_id = b.person_id
   and b.task_id = c.task_id;
   
   # join another way
   SELECT a.first_name, a.last_name, c.task
   FROM
   sandbox.person_tbl a
   JOIN sandbox.person_task_lnk b on a.person_id = b.person_id
   JOIN sandbox.task_tbl c on b.task_id = c.task_id;
   
   # create a view 
   create view sandbox.person_task_view AS
   (select a.first_name, a.last_name, c.task
   from
   sandbox.person_tbl a,
   sandbox.person_task_lnk b,
   sandbox.task_tbl c
   where a.person_id = b.person_id
   and b.task_id = c.task_id);

   select * from sandbox.person_task_view
   order by first_name desc;
   
   # dml & ddl
   