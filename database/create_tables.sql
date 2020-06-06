
/* create table EMP */
create table EMP (
    id varchar(255),
    firstname varchar(255),
    lastname varchar(255),PRIMARY KEY (id)
);

/* create table PROJECT */
create table PROJECT (
    id int auto_increment,
    name varchar(255),
    PRIMARY KEY(id)
);


/* create table EMP_HR */
create table EMP_HR (
    id varchar(255) unique,
    age int,
    doj date,
	salary varchar(255),
    department varchar(255),
    FOREIGN KEY (id) REFERENCES EMP(id)
);

/* create table EMP_PROJECT */
create table EMP_PROJECT (
    id varchar(255),
    project_id int,
    FOREIGN KEY (id) REFERENCES EMP(id),
     FOREIGN KEY (project_id) REFERENCES PROJECT(id)
);

/** insert data **/

/*EMP*/

insert into EMP(id,firstname,lastname) values('E1024','John','D’ Costa');
insert into EMP(id,firstname,lastname) values('E1158','Rohit','Sharma');
insert into EMP(id,firstname,lastname) values('E1011','Rajesh','Verma');
insert into EMP(id,firstname,lastname) values('E1019','Anil','Yadav');

/* project */

insert into PROJECT(name) values('BTPX');
insert into PROJECT(name) values('OSR');
insert into PROJECT(name) values('OTIS');
insert into PROJECT(name) values('ASF');
insert into PROJECT(name) values('CBS');
insert into PROJECT(name) values('CBSX');
insert into PROJECT(name) values('MWC-2');
 
 
/* emp_hr */
insert into EMP_HR(id,age,doj,salary,department) values('E1024',34,date('2003-04-12'),'Rs.10,00,000','Technical');
insert into EMP_HR(id,age,doj,salary,department) values('E1158',25,date('2006-07-14'),'Rs. 4,00,000','Technical');
insert into EMP_HR(id,age,doj,salary,department) values('E1011',43,date('1998-08-19'),'Rs.8,00,000','Technical');
insert into EMP_HR(id,age,doj,salary,department) values('E1019',36,date('2003-04-12'),'Rs.12,00,000','Technical');
 
 
 /* emp_project */
 
insert into EMP_PROJECT(id,project_id) values ('E1024',1);
insert into EMP_PROJECT(id,project_id) values ('E1024',2);
insert into EMP_PROJECT(id,project_id) values ('E1024',3);

insert into EMP_PROJECT(id,project_id) values ('E1158',2);
insert into EMP_PROJECT(id,project_id) values ('E1158',4);
insert into EMP_PROJECT(id,project_id) values ('E1158',1);

insert into EMP_PROJECT(id,project_id) values ('E1011',5);
insert into EMP_PROJECT(id,project_id) values ('E1011',6);
insert into EMP_PROJECT(id,project_id) values ('E1011',7);
insert into EMP_PROJECT(id,project_id) values ('E1011',4);

insert into EMP_PROJECT(id,project_id) values ('E1019',1);
insert into EMP_PROJECT(id,project_id) values ('E1019',4);
 
 
 
 
 
 select * from emp_HR;
 select * from PROJECT;
/* */
drop table emp_project;
drop table emp_hr;
drop table project;
drop table emp;


select e.id,e.firstname,e.lastname,eh.age,eh.doj,eh.department,eh.salary,p.name from emp e inner join emp_hr eh on e.id =eh.id inner join emp_project ep on e.id = ep.id inner join project p on
p.id = ep.project_id ; 


USE `fnp`;
DROP procedure IF EXISTS `retrieveEMPData`;

DELIMITER $$
USE `fnp`$$
CREATE PROCEDURE `retrieveEMPData` ()
BEGIN
  select e.id,e.firstname,e.lastname,eh.age,eh.doj,eh.department,eh.salary,p.name from emp e inner join emp_hr eh on e.id =eh.id inner join emp_project ep on e.id = ep.id inner join project p on
p.id = ep.project_id ; 	
END$$

DELIMITER ;


/* */
CREATE DEFINER=`root`@`localhost` PROCEDURE `retrieveEMPData`()
BEGIN
  select e.id,e.firstname,e.lastname,eh.age,eh.doj,eh.department,eh.salary,p.name from emp e inner join emp_hr eh on e.id =eh.id inner join emp_project ep on e.id = ep.id inner join project p on
p.id = ep.project_id ; 	
ENDs


















