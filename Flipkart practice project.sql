-- Below code for creating the database
create database Flipkart_data;
use Flipkart_data;
show tables;
select * from prod;	
select * from prod_category;
create table cust_1(
c_name char(30),
c_id int primary key not null,
c_add varchar(20),
c_cont bigint unique,
c_age char(4) not null
);

create table emp_1(
e_id int primary key not null,
e_name char(10),
e_add varchar(30),
e_salary bigint not null,
e_dept char(20),
e_age int not null,
e_con bigint unique
);

create table prod_category(
cat_name char(30),
cat_id int primary key not null,
cat_price bigint not null
);

create table prod(
prod_id int not null,
cat_id int,
foreign key (cat_id) references prod_category(cat_id),
prod_name int not null,
prod_cat_name char(30),
prod_price int not null
);

create table payments1(
pay_id int not null unique,
e_id int,
foreign key (e_id) references emp_1(e_id),
c_id int,
foreign key (c_id) references cust_1 (c_id),
cat_id int,
foreign key (cat_id) references prod_category (cat_id),
payment_meth char(15) not null,
pay_receipt varchar(50) primary key unique not null,
Discount varchar(20)
);


use Flipkart_data;
show tables;
select * from cust_1;
select * from emp_1;
desc cust_1;

insert into cust_1 values("Anil Rao",123,"Uttam Nagar, Nashik",792131651,23);
insert into cust_1 values("Mahesh Deshmukh",234,"Madiwali Colony,Pune",843874143,56);
insert into cust_1 values("Pallavi Rane",546,"Rane nagar,Kolhapur",879653121,41);
insert into cust_1 values("Rohan Jaware",892,"Chaskar Galli,Nagpur",5632896453,26);
insert into cust_1 values("mangesh Joshi",136,"MahalungeRoad,Chakan",78983541,58);
insert into cust_1 values("Kritika Changle",884,"JoshiColony,Yavatmal",897865132,47);

desc emp_1;
insert into emp_1 values(1458,"Monali","Satara road",56000,"Production",40,461521368);
insert into emp_1 values(8974,"Tejas","Hadapasar",89756,"Taxation",29,7132132631);
insert into emp_1 values(7489,"Erica","Kothurd",98999,"Grocery",39,8796453123);
insert into emp_1 values(5678,"Dwayne","KarveNagar",124589,"Fruits",47,85631246586);
insert into emp_1 values(8026,"Johnson","Sinhgad road",897453,"Shirtings",57,97886541145);
insert into emp_1 values(1478,"Rock","Nal Stop",1478952,"Staples",47,9846513212);
show tables;
desc payments1;
desc prod_category;
insert into prod_category values("Groceries",124789,64514);
insert into prod_category values("Staples",954624,70000);
insert into prod_category values("Snacks",474532,80000);
insert into prod_category values("Trousers",7451233,90000);
insert into prod_category values("Electronic Items",697423,40000);
desc prod;
insert into prod values(15,954624,"Aashirvad Aata","Staples",60);
show databases;
use Flipkart_data;
desc prod;
alter table prod modify prod_name char(20);
show tables;
desc payments1;
select * from prod;
select * from prod_category;
insert into prod values(7854321,954624,"Aashirvad Aata","Staples",60);
insert into prod values(545,474532,"Balaji Wafers","Snacks",20);
insert into prod values(982645,7451233,"Peter England","Trousers",999);
insert into prod values(741220,124789,"Lifebuoy","Groceries",88);
insert into prod values(896120,697423,"Pihilips","Electronic Items",256);
select * from prod;
desc payments1;
show tables;
alter table payments1 drop column pay_id;
show databases;
use Flipkart_data;
insert into payments1 values(1458,123,954624,"Cash","AC8561V","10%");
insert into payments1 values(1478,136,474532,"Google Pay","UTG897","30%");
insert into payments1 values(5678,234,7451233,"PayTM","8970XX","No Discount");
insert into payments1 values(7489,546,124789,"Credit Card","VCSDTYU","0-5 %");
insert into payments1 values(8026,884,697423,"Debit Card","8925TRE6","8%");
select * from payments1;
show tables;
desc prod_category;
desc prod;
-- inner join
select prod.prod_name, prod_category.cat_name, prod.cat_id from
prod inner join prod_category on prod.cat_id=prod_category.cat_id;
show tables;
select * from prod_category;
select * from payments1;
-- left join
select cat_name, prod_category.cat_id, prod_name, prod_price from prod_category
left join prod on prod_category.cat_id=prod.cat_id;
-- left join 2nd example
select cat_name, prod_category.cat_id, e_id, pay_method from prod_category left join
payments1 on prod_category.cat_id=payments1.cat_id;
-- left join 3rd example
select prod_category.cat_id, prod.prod_id,prod.prod_name, prod.prod_cat_name, prod.prod_price from prod_category
left join prod on prod_category.cat_id=prod.cat_id;
-- right join
select prod_category.cat_id, prod.prod_id,prod.prod_name, prod.prod_cat_name, prod.prod_price from prod_category
right join prod on prod_category.cat_id=prod.cat_id;
-- Full join
select prod_category.cat_id, prod.prod_id,prod.prod_name, prod.prod_cat_name, prod.prod_price from prod_category
full join prod on prod_category.cat_id=prod.cat_id;
-- Above query is not executed as the full join is removed from MySQL version 7 onwards. it is used in 
-- oraccle and my seequel database.
-- Cross join 1st exmplae
select prod_category.cat_id, prod.prod_id,prod.prod_name, prod.prod_cat_name, prod.prod_price from prod_category
cross join prod on prod_category.cat_id=prod.cat_id;
-- Cross join 2nd example
select prod_category.cat_id, prod.prod_id,prod.prod_name, prod.prod_cat_name, prod.prod_price from prod_category
cross join prod;
-- Cross join 3rd example
select prod_category.cat_id, prod.prod_id,prod.prod_name, prod.prod_cat_name, prod.prod_price from prod
cross join prod_category;

-- self join
select prod_category.cat_id, prod.prod_id,prod.prod_name, prod.prod_cat_name, prod.prod_price
from prod, prod_category;

select prod_category.cat_id, prod.prod_id,prod.prod_name, prod.prod_cat_name, prod.prod_price
from prod_category, prod;
-- Using DDL commands
show tables;
desc payments1;
alter table payments1 modify column payment_meth char(20) default 'Cash';
alter table payments1 add column location char(10);
alter table payments1 rename column payment_meth to pay_method; 
alter table payments1 drop column Discount;
desc prod;
select * from prod;
-- DML Commands
update prod set prod_name='Syska' where prod_id=896120;
update prod set prod_name='Wipro' where prod_id=896120;
set SQL_SAFE_UPDATES=0;
update prod set prod_name='Kukure' where prod_id=545;
-- Where clause with DQL
select * from payments1 where pay_receipt='8970XX' or cat_id=474532;
select * from payments1 where pay_receipt='8970XX' and cat_id=474532;
show tables;
select * from prod;
select * from prod where prod_price>90;
-- DQL with aggregation 
select sum(prod_price) from prod;
select min(prod_price) from prod;
select max(prod_price) from prod;
select count(*) from prod;
select avg(prod_price) from prod;
select sum(prod_price)/count(prod_price) from prod;
select sum(prod_price) as Summation_of_product_price from prod;
-- Limit, having, order by and group by
select * from payments1 limit 3;
insert into prod values(1223214,7451233,"Cottonking","Trrousers",1234);
update prod set prod_cat_name="Trousers" where prod_id=1223214;
set SQL_SAFE_UPDATES=0;
select * from prod;
SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select prod_name,count(prod_price), prod_cat_name from prod group by prod_cat_name;
select prod_cat_name, count(*) from prod group by prod_cat_name having count(*)>1;
select * from prod;
select prod_cat_name, count(*) from prod group by prod_cat_name;
use Flipkart_data;
show tables;
select * from cust_1;
select * from cust_1 where c_name like '_a%';
select * from cust_1 where c_name like '__s';
select * from cust_1 where c_name like 'p%';
select * from cust_1 where c_name like 'k%';
select * from cust_1 where c_name like 'p_v%';

