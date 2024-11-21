Create database Store;
use Store;
/* creating the table named as Products*/
Create table Products(
Product_ID numeric(10),
Product_Name varchar(20),
Quantity numeric(10),
price numeric(10)
);

/* Insering the data into the table */
insert into products values(101,"Laptop",4,80000);

insert into products values(102,"Mobile",1,10000),
(103,"Mouse",5,1000),(104,"Keyboard",2,1500),(105,"Headphone",1,300);

/* Getting all the data what ever stored in the Tables */
Select * from Products;

/* procedure for get all the data from the table */

Delimiter //
create procedure get_product()
begin
select * from Products;
end //

/* Calling the procedure */

call get_product();

/* Procedure that takes a product ID and it return the product Details */
Delimiter //
create procedure get_detail(in id numeric)
begin
select * from Products Where Product_ID =id;
end//

call get_detail(101);

Delimiter //
create procedure getQty(in quantity numeric,out id numeric)
begin
select sum(Product_ID) from Products where Quantity =  quantity ;
end //

call getQty(2,@Products);

Delimiter //
create procedure getPrices(in id numeric,out prices numeric)
begin
select sum(price) from Products where Product_ID = id;
end//

call getPrices(101,@Products);

/* Procedure for geting the price for the product and it want to return the Product name that 
more than the given price */

delimiter // 
create function getproductdemo3(priceofproduct numeric) returns varchar(50)
deterministic
begin
declare pname varchar(50);
select group_concat(product_name separator ', ') as Product_Name into pname from Products where price > priceofproduct ;
return pname;
end //

select getproductdemo3(5000);



/* Created the table named as Employee */
create table Employee(
	Employee_name varchar(20),
    Employee_Id  numeric(10) primary key,
    Department_Id numeric(10) ,
    Employee_salary decimal(10,2))
    
    select * from Employee;
/* Inserting the data into the table */    
    insert into Employee values('Sargunan',101,1,25000.00),
		('Sanker',102,1,25000.00),('Subu',103,2,26000.00),('Praveen',104,1,25000.00);
        
  /* Creating the triger procedure for counting the rows in the tables      */
  
  delimiter //
create trigger get_trigger
after insert on emp
for each row
begin
update department
set emp_count = emp_count+1
where department_id = new.dep_id;
end;
//
 
insert into emp values(105 , 'sedhu', 2);
  
  select * from department;
  
  
  
  
  
  create table emp (
emp_id numeric primary key,
emp_name varchar(50),
dep_id numeric,
constraint fk_dept foreign key (dep_id) references department(department_id)
);
 
create table department(
department_id numeric primary key,
dept_name varchar(50),
emp_count numeric
);
 insert into department value(1,'ES',1),(2,'DA',1);
    
    
  --   Creating the views
  
  create table Employee_Data(
	Employee_name varchar(20),
    Employee_id numeric(10),
    Location varchar(20),
    Team varchar(20));
    
  insert into Employee_Data value('Sargunan',101,'Chennai','TN'),
  ('Sankar',102,'kochi','TN'),('Subu',103,'Chennai','DA'),('Praveen',104,'chennai','TN');
 insert into Employee_Data value('Praveen',104,'kochi','DA');
  
  create view ChennaiEmployees
  As
  Select Employee_name,Employee_id,Location,Team from Employee_Data 
  where Location='chennai' and Team ='TN';
  
  select * from ChennaiEmployee;
  
  
  