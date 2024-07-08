create database hospital_Management2
use hospital_Management2

-----------------------------------Patients---------------------------
create table Patients(
Patient_ID int IDENTITY(1,1) not null  primary key ,
Patient_Name varchar(20),
P_Gender varchar(20),
Patient_Contact BIGINT ,
Patient_Age varchar(20),
Patient_Height varchar(20),
Patient_Weight varchar(20),
Admission_date date
)

insert into Patients values
('Minal	Ali','Female','03200923448','21','5 FT','70 KG','2022-03-12'),
('Kinza Khan','Female','03221874006','18','4"4 FT','50 KG','2022-03-12'),
('Adil Malik','Male','03020927883','10','6 FT','66 KG','2022-03-12'),
('Hammad Shafeeq','Male','03337635220','23','5"8 FT','70 KG','2022-03-12')
('Sana','Female','030247890','85','5"7 FT','58 KG','2022-03-14'),
('Esha','Female','046785890','23','4"7 FT','78 KG','2022-03-15'),
(' Atifa','Female','0304567890','67','5"7 FT','34 KG','2022-03-16'),
('Maira ','Female','032345890','89','6 FT','67 KG','2022-03-23')


select * from Patients

--------------------------------LOGIN--------------------------------------

create table loginForm
( Id int primary key identity,
Name varchar (50),
Passward varchar (50),
status varchar(678)
)
drop table loginForm
insert into loginForm values ('Doctor','roctod!@#','Doctor'),
('Receptionist','!@#$%','Receptionist'),
('Admin','1@3$%6','Admin')

select * from  loginForm

------------------------------------DEPARTMENT-------------------------------
create table Department 
(
Dept_ID int IDENTITY(1,1) not null  primary key,
Dept_Name varchar(200),
) 

insert into Department values( 'Oncology'),
( 'ENT'),( 'Endocrinology'),( 'Neurology'),( 'Gynoecology')
insert into Department values('General Physician')

select * from Department 

---------------------------------DOCTORS----------------------------
create table Doctors
(
Doc_id int IDENTITY(1,1) not null  primary key,
Doc_name varchar(50),
Contact BIGINT,
salary int ,
Designation varchar(200),
joining_date date,
doc_sitting_time varchar(20),
Dept_ID int ,Foreign Key (Dept_ID) REFeRENCES Department(Dept_ID)  

)

insert into  Doctors values ( 'Asim','056794500',100000,'Onchologist','2022-03-12','12:00-5:00',1),
( 'Mazhar','056004500',80000,'Gynoecologist','2022-03-12','5:00-8:00',5),( 'Samra','058791110',70000,'ENT specialist','2022-03-12','12:00-5:00',2),
( 'NOOR','056793450',70000,'EndoCrinologist','2022-03-12','12:00-5:00',3),( 'Azam','056794500',100000,'Onchologist','2022-03-12','12:00-5:00',1),
( 'Saad','056794500',500000,'Neurologist','2022-03-12','5:00-8:00',4)

select* from Doctors


----------------------------------------PROCEDURE-----------------------------------------------------
create table Proced(
doc_id int,
Code int IDENTITY(1000,1)not null  primary key,
Name varchar(100),
Cost int,
 foreign key (doc_id) references doctors (doc_id)
)
alter table Proced
add doc_id int,
 foreign key (doc_id) references doctors (doc_id)

insert into Proced values ('Reverse Rhinopodoplasty', 50000),
('C-section', 70000),('Reversible Pancreomyoplasty ', 80000),
('Bone Marrow Transplant', 300000),('Anterior cervical discectomy', 200000)

select * from Proced

-------------------------------------APPOINTMENT------------------------------------------------
create table Appointment(
app_id int Identity(1,1) not null,
Patient_ID int not null,
Doc_id int not null ,
Dated datetime2 not null,
A_Status varchar(20) not null,
FOREIGN KEY (Doc_id) REFERENCES Doctors(Doc_id),
FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID)

)

insert into Appointment values
(1,1,SYSDATETIME(),'Pending'),
(2,2,SYSDATETIME(),'Cancelled'),
(3,3,SYSDATETIME(),'Completed'),
(4,4,SYSDATETIME(),'Cancelled'),
(5,5,SYSDATETIME(),'Pending'),
(6,5,SYSDATETIME(),'Cancelled'),
(7,4,SYSDATETIME(),'Pending'),
(8,2,SYSDATETIME(),'Completed'),
(9,3,SYSDATETIME(),'Cancelled'),
(10,1,SYSDATETIME(),'Completed'),
(11,4,SYSDATETIME(),'Pending'),
(12,5,SYSDATETIME(),'Completed'),
(13,2,SYSDATETIME(),'Completed'),
(14,1,SYSDATETIME(),'Completed'),
(15,1,SYSDATETIME(),'Cancelled')




select * from Appointment



--------------------------------Emp_Audit--------------------------------------------------------------

create table emp_audit
(Audit_report varchar (100),
Doc_id int,
Foreign Key (Doc_id) REFeRENCES Doctors(Doc_id)  
)



CREATE TABLE DB_Errors
         (ErrorID        INT IDENTITY(1, 1),
          UserName       VARCHAR(100),
          ErrorNumber    INT,
          ErrorState     INT,
          ErrorSeverity  INT,
          ErrorLine      INT,
          ErrorProcedure VARCHAR(MAX),
          ErrorMessage   VARCHAR(MAX),
          ErrorDateTime  DATETIME)




----------------------------------------procedure to insert patient info---------------------------------------
create proc spPatientInsert
@Patient_Name varchar(20),
@P_Gender varchar(20),
@Patient_Contact BIGINT,
@Patient_Age varchar(20),
@Patient_Height varchar(20),
@Patient_Weight varchar(20),
@Admission_date date
as
begin 
insert into Patients(Patient_Name,P_Gender,Patient_Contact,Patient_Age,Patient_Height,Patient_Weight,Admission_date)values
(@Patient_Name,@P_Gender,@Patient_Contact,@Patient_Age,@Patient_Height,@Patient_Weight,@Admission_date)
end

exec spPatientInsert 'asim','Male','0334665678','14','5"8 FT','70 KG', '2022-03-12'
exec spPatientInsert 'ameena','Female','03349901223','39','5 FT','65 KG', '2022-06-10'

select * from Patients

-----front end work-----
create proc listPatient_SP
as
begin 
select *from Patients
end
exec listPatient_SP

create proc spPatientUpdate
@Patient_Name varchar(20),
@P_Gender varchar(20),
@Patient_Contact BIGINT,
@Patient_Age varchar(20),
@Patient_Height varchar(20),
@Patient_Weight varchar(20),
@Admission_date date
as
begin 
update Patients set Patient_Name=@Patient_Name,P_Gender=@P_Gender,Patient_Contact=@Patient_Contact,Patient_Age=@Patient_Age,Patient_Height=@Patient_Height,Patient_Weight=@Patient_Weight,Admission_date=@Admission_date where Patient_Name=@Patient_Name

end

----delete
create proc spPatientDelete
@Patient_Name varchar(20)
as
begin 
delete Patients  where Patient_Name=@Patient_Name
end






----------------------------------------Applying clustered index on proced cost,name-----------------------
drop index [PK_Proced_A25C5AA6350BF60B] on proced

CREATE clustered Index IX_procedure_pricing
ON proced (cost ASC, name desc)


select * from Proced


----------------------------------------Applying clustered index on Appointment Status-----------------------

drop index [PK__Appointm__97502BFA3CFCB8E3] on appointment

create clustered index ix_appointment_cl
on Appointment ( a_status asc,app_id desc)

select * from Appointment



create table employee_audit1
(audit_data varchar (1000),
doc_id int ,
foreign key (doc_id) references doctors (doc_id)
)
select * from employee_audit1


-------------------------------Update Trigger for insert and delete---------
Create trigger tr_tblEmployee_ForUpdate
on doctors
for Update
as
Begin
 Select * from deleted
 Select * from inserted 
End
select * from doctors


Update Doctors set Doc_name = 'tods',Contact=3524676, Salary = 2000, 
Designation = 'pharmacist' where Doc_id = 1


create trigger tr_tbldoctors_ForUpdate
on doctors
for Update
as
Begin
      -- Declare variables to hold old and updated data
      Declare @Id int
      Declare @OldName varchar(20), @NewName varchar(20)
	  Declare @Oldcontact bigint, @Newcontact bigint
      Declare @OldSalary int, @NewSalary int
      Declare @Olddesignation varchar(200), @Newdesignation varchar(200)
      Declare @Oldjoining_date date, @Newjoining_date date
	  Declare @Oldsittingtime varchar(20), @Newsittingtime varchar(20)

     
      -- Variable to build the audit string
      Declare @AuditString varchar(1000)
      
      -- Load the updated records into temporary table
      Select *
      into #TempTable
      from inserted
     
      -- Loop thru the records in temp table
      While(Exists(Select doc_id from #TempTable))
      Begin
            --Initialize the audit string to empty string
            Set @AuditString = ''
            -- Select first row data from temp table
            Select Top 1 @Id = doc_id, @NewName = doc_name, 
            @Newcontact = contact, @NewSalary = Salary,
            @Newdesignation = designation, @Newjoining_date=joining_date,@Newsittingtime=doc_sitting_time
            from #TempTable
            -- Select the corresponding row from deleted table
            Select @OldName = doc_name,@oldcontact = contact, 
            @OldSalary = Salary, @OldDesignation = designation,@oldjoining_date=joining_date,@oldsittingtime=doc_sitting_time
            from deleted where Doc_id = @Id
   
     -- Build the audit string dynamically           
            Set @AuditString = 'Employee with Id = ' + Cast(@Id as varchar(4)) + ' changed'
            if(@OldName <> @NewName)
                  Set @AuditString = @AuditString + ' NAME from ' + @OldName + ' to ' + @NewName
                 
            if(@Oldcontact<> @Newcontact)
                  Set @AuditString = @AuditString + ' contact from ' + @Oldcontact + ' to ' + @Newcontact
                 
            if(@OldSalary <> @NewSalary)
                  Set @AuditString =  Cast(@NewSalary as varchar(10))
                  
            if(@Olddesignation <> @NewDesignation)
                  Set @AuditString =  Cast(@NewDesignation as varchar(10))
           if(@Oldjoining_date <> @Newjoining_date)
                  Set @AuditString =  Cast(@Newjoining_date as date) 
		  if(@Oldsittingtime <> @Newsittingtime)
                  Set @AuditString = Cast(@Newsittingtime as varchar(10)) 
	 
            insert into employee_audit1 values(@AuditString,@Id)
            
            -- Delete the row from temp table, so we can move to the next row
            Delete from #TempTable where Doc_id = @Id
      End
End

select * from employee_audit1
--------------------------------------View doctor details to admin----------------------------------------
create view [admin view] as
select Doc_id, Doc_name , Dept_ID, doc_sitting_time
from Doctors

select * from [dbo].[admin view]


------------------------------View the patient info of appointment with the doctor---------------------------
create view vwPatientAppointmentwithDoctor
as 
select Patient_name,P_Gender,Patient_Contact,Patient_Age,Admission_date
from Patients
join Appointment
on patients.patient_id=appointment.patient_id
join Doctors
on appointment.doc_id=doctors.doc_id

select * from vwPatientAppointmentwithDoctor


--------------------Showing at which date the doctor has joined the hospital---------------------------
create trigger tr_doc_joining
on Doctors
FOR INSERT
AS
BEGIN
 Declare @Id int
 Select @Id = Doc_id from inserted

 insert into emp_audit
 values(Cast(@Id as int) +  cast(getdate() as  datetime),@Id)
END
 
insert into Doctors values ( 'Noor','089022500',6000,'General Physician','2022-01-11','10:00-12:00',6)
select * from emp_audit



---------- front end-----------Trigger  To perform deletion first in Appointment and then in Patient Table 
create trigger tr_toDeletePatient

on appointment
after delete
AS
BEGIN
 
delete from Patients where Patients.Patient_ID=(SELECT Patient_ID FROM deleted)
END


create proc Appointment_SP
@Patient_Name varchar(500)

as
begin 
delete from Appointment  where Patient_ID IN (  select Patient_ID from Patients where Patient_Name= @Patient_Name)

end

select*from Appointment
 
 

-------------------------procedure giving doctor name by entering id and department--------------------
create procedure spGetDoctors
@dept_id int,
@designation VARCHAR(200)
with encryption
as
begin
 select doc_name,designation,Dept_ID from doctors
 where Designation=@designation
 order by doc_name , dept_id
end

execute spGetDoctors 2,'ENT specialist'

-----------------------procedure counting total doctors in a department-------------------------
alter proc spGetDoctorCountByDepartment
@Dept_id int,

@DoctorCount int output
as
begin
select @DoctorCount=Count(Doc_id) from Doctors
where Dept_id=@Dept_id
return @DoctorCount
end

Declare @DoctorTotal int
execute spGetDoctorCountByDepartment 2,@DoctorTotal Output

Print 'Total Doctors in this department:' 
Print @DoctorTotal
select*From Department 

-----------------checking on which tables this proc depends---------------
sp_depends spGetDoctorCountByDepartment


----------------------procedure counting total departments in our hospital----------------------
create proc spGetTotalDepartment
@TotalCount int Output
as
begin
select @TotalCount = Count(dept_id) from Department
end

declare @count int
exec spGetTotalDepartment @count Output
Print 'Total Departments:' 
Print @count


----------------------procedure to get patient name by id----------------------
create proc spGetNameById
@patient_id int,
@patient_name varchar(20) output
as
begin
select @patient_name=Patient_name from Patients
where Patient_ID=@patient_id
end

declare @name varchar(20)
execute spGetNameById 5,@name output
print 'Name = '+@Name


ALTER PROCEDURE  spGetNameById
@patient_id int,
@patient_name varchar(20) output
AS
  BEGIN TRY
 select @patient_name=Patient_name from Patients
 where Patient_ID=@patient_id
  END TRY
  BEGIN CATCH
    INSERT INTO DB_Errors
    VALUES
  (USER_NAME(),
   ERROR_NUMBER(),
   ERROR_STATE(),
   ERROR_SEVERITY(),
   ERROR_LINE(),
   ERROR_PROCEDURE(),
   ERROR_MESSAGE(),
   GETDATE());
  END CATCH


------------- updating appointment status----------
UPDATE Appointment
SET A_status='Completed'
WHERE app_id=5

select * from Appointment

----------------------procedure for patient appointment info----------------------
alter proc spViewPatientAppointment
@RecordCount int OUTPUT
AS
BEGIN  
    SELECT ROW_NUMBER() OVER
            (
               ORDER BY [Patients].[Patient_id]
            )AS RowNumber
            ,[Patients].[Patient_id]
			,[Patient_Name]
            ,[Patient_Contact]       
            ,[Patient_Age]
            ,[Admission_date]
        
    INTO #Results
    FROM [Patients]
    INNER JOIN Appointment
    ON  [Patients].[Patient_id] =  [Appointment].[Patient_id]
    GROUP BY [Patients].[Patient_id],[Patient_Name],[Patient_Contact],[Patient_Age],[Admission_date]  

 
    SELECT @RecordCount =COUNT(*)FROM #Results
 
    SELECT *from #Results
 
    DROP TABLE # Results
	return @RecordCount
END

declare @count int
EXEC spViewPatientAppointment @count
print @count