create database company
use company
--DDL
--Create 
create table Emp(
 Eid int primary key identity ,
 Fname varchar(10) not null,
 lname varchar(10) ,
 Hiredate date default getdate(),
 Eaddress varchar(20) default 'Menofia'
)
create table Dep(
 Did int  ,
 Dname varchar(10) 
 constraint c2 unique(Dname) ,
 constraint c3 primary key (Did) ,
)
alter table Emp add Salary real ;
alter table Emp add Age int ;
alter table Emp add Did  int ;
alter table Emp alter column Salary int  ;
alter table Emp alter column Salary bigint  ;
alter table Emp drop column Salary   ;
alter table Emp add constraint c1 --unique in DB Level
 foreign key (did) references department(did)
drop table Emp;
--DML 
--insert
insert into Emp 
 values (1,'Reem','Ahmed','2024-08-30','Cairo')
 insert into Emp (Fname,Eid)
 values ('Ahmed',2)
 --insert constructor
insert into Emp (Fname,Eid)
 values ('Ahmed',3),('mina',4),('Abderhman',5)
 insert into Emp (Fname,Eid,Age)
 values ('Ahmed',6,20),('mina',7,23),('Abderhman',8,24)
 --update
update Emp
  set Fname ='mohmed';
update Emp
  set Fname ='Reem'
  where Eid =1;
 update Emp
  set Age +=1;
 update Emp
  set Fname =Null;
--Delete 
delete from Emp
 where  Eid in (7,6,5);
---DQL 
  use ITI
select * from Student ;
select St_Fname,st_lname from Student ;
select St_Fname+' '+st_lname  as FULL_NAME from Student ;
select concat(St_Fname,'  ',st_lname ) as FULL_NAME from Student ;
select * from Student
  where st_age between 20 and 25;
select * from Student
  where st_age > 20 and st_age < 25;
select * from Student
  where st_lname is not null;
select * from Student
  where st_address='cairo' or st_address like'm%';
select * from Student
  where st_address in('cairo' ,'alex','mansoura')
select * from Student
  where st_address='cairo' And st_address= 'mansoura';
select * from Student
  order by st_age desc ;
select St_fname,st_lname from Student
  order by 1;
select * from Student
  order by st_fname,st_lname;
  ----------------------------------------------------
  --Relation
  use company
  go 
  create table Ins(
  Ins_id int ,
  Fname varchar(10),
  lname varchar(10),
  Date_of_birth date,
  Age as year(getdate())-year(Date_of_birth),
 gender char(1),
 telephone char(11),
 sall real ,
 mg_id int,
 constraint c4 primary key (Ins_id) ,
 constraint c5 check (gender ='M'or gender ='F') ,
 constraint c6 unique (telephone),
 constraint c7 foreign key (mg_id) references Ins(Ins_id) 
 )
 drop table Ins
 select * from Ins
 insert into Ins (ins_id,Fname,Lname,Date_of_birth,Gender,Sall,mg_id)
  values(1,'Mohamed','Ahmed','2002-05-30','M',1000,1)
--------------------------------------------------------
--Joins 

