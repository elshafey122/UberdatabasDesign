create database UberDB;
use UberDB;

/* create tables*/
create table Customer(
id int primary key not null,
first_name varchar(20) not null,
last_name varchar(20) not null,
gender varchar(20) ,
phone_number varchar(30) unique not null,
email varchar(30) unique not null,
city varchar(20) null ,
);


create table Car(
car_id int primary key,
reg_no int not null,
brand varchar(30) not null,
model int check (model between 1990 and 2025) not null,
color varchar(15) ,
speed int 
);


create table Driver(
id int primary key,
first_name varchar(20) not null,
last_name varchar(20) not null,
phone_number varchar(30) unique,
email varchar(30) ,
car_id int not null,
card_no varchar(30) ,
constraint driver_car foreign key(car_id)
references Car(car_id)
);


create table Payment(
payment_id int primary key,
card_no varchar(30) not null,
card_type varchar(30) not null,
amount float not null,
payment_time DATETIME,
customer_id int not null,
constraint customer_payment foreign key(customer_id)
references Customer(id)
);


create table Rating(
rating_id int primary key,
customer_rating int check(customer_rating between 0 and 10) ,
driver_rating int check(driver_rating between 0 and 10),
customer_feedback varchar(30),
driver_feedback varchar(30)
);


create table Trip(
id int primary key,
customer_id int not null,
driver_id int not null,
rating_id int ,
status varchar(20) not null,
source varchar(30),
destination varchar(30),
created_at datetime,
waiting_time int check (waiting_time between 1 and 200) ,
payment_id int,
constraint customer_trip foreign key (customer_id) 
references Customer(id),

constraint driver_trip foreign key (driver_id) 
references Driver(id),

constraint trip_rating foreign key(rating_id)
references Rating(rating_id),

constraint trip_payment foreign key(payment_id)
references Payment(payment_id)
);



/* input data in tables*/

/* customer information*/
insert into Customer values(1,'ahmed','zayed','male',01283873265,'ahmed@yaho.com','cairo');
insert into Customer values(2,'ali','mohamed','male',01287453265,'ali@yaho.com','tanta');
insert into Customer values(3,'noura','salah','female',01123873265,'salah@yaho.com','banha');
insert into Customer values(4,'adel','taha','male',01083766643,'adel@yaho.com','mansoura');
insert into Customer values(5,'amira','shaban','female',01073529735,'amira@yaho.com','6october');
insert into Customer values(6,'osama','wael','male',01126883902,'osama@yaho.com','doqi');
insert into Customer values(7,'karim','saolman','male',01287354679,'karim@yaho.com','mahala');
insert into Customer values(8,'yousry','khaled','male',01073846298,'yousry@yaho.com','minia');
insert into Customer values(9,'yasmin','sobhi','female',01183469271,'yasmin@yaho.com','suiz');
insert into Customer values(10,'yara','yasser','female',01082463890,'yara@yaho.com','salom');
insert into Customer values(11,'ibrahim','zayed','male',01283746590,'ibrahim@yaho.com','aswan');
insert into Customer values(12,'yousif','mohamed','male',01027347836,'yousif@yaho.com','luxor');
insert into Customer values(13,'mahmoud','ahmed','male',01173744281,'mahmoud@yaho.com','giza');
insert into Customer values(14,'hanan','mostafa','female',01236485902,'hanan@yaho.com','fayoum');
insert into Customer values(15,'eman','fathi','female',01063459083,'eman@yaho.com','sharmElshikh');
insert into Customer values(16,'maostafa','sherif','male',01273649561,'maostafa@yaho.com','mansoura');
insert into Customer values(17,'samar','ezzat','female',01173645091,'samar@yaho.com','cairo');
insert into Customer values(18,'gamal','adham','male',01028364411,'gamal@yaho.com','newCairo');
insert into Customer values(19,'hazem','tamer','male',01284775843,'hazem@yaho.com','tanta');
insert into Customer values(20,'dina','ashraf','female',01182736453,'dina@yaho.com','giza');

/* car information*/
insert into Car values(1,654,'Chevrolet',2000,'red',150);
insert into Car values(2,632,'Honda',2001,'green',155);
insert into Car values(3,622,'Nissan',2002,'yellow',160);
insert into Car values(4,476,'Ford',2003,'black',170);
insert into Car values(5,964,'Fiat',2004,'red',149);
insert into Car values(6,651,'Jeep',2005,'orange',120);
insert into Car values(7,412,'Volkswagen',2006,'brown',200);
insert into Car values(8,964,'Volvo',2007,'white',180);
insert into Car values(9,543,'Jaguar',2008,'green',179);
insert into Car values(10,214,'Audi',2009,'pink',188);
insert into Car values(11,323,'Toyota',2010,'grey',210);
insert into Car values(12,432,'Lexus',2011,'black',250);
insert into Car values(13,938,'Porsche',2012,'red',270);
insert into Car values(14,364,'Bugatti',2013,'blue',280);
insert into Car values(15,982,'Bentley',2014,'green',300);
insert into Car values(16,124,'Rolls Royce',2015,'white',222);
insert into Car values(17,374,'BMW',2016,'black',330);
insert into Car values(18,234,'Tesla',2017,'orange',360);
insert into Car values(19,873,'Mercedes- Benz',2018,'grey',230);
insert into Car values(20,273,'kia',2019,'green',340);

/* driver information*/
insert into Driver values(1,'zayed','ahmed',01283873265,'zayed@yaho.com',1,'6382 7283 4672 9928');
insert into Driver values(2,'mohamed','ali',01287453265,'mohamed@yaho.com',2,'9838 8480 7280 2379');
insert into Driver values(3,'salah','adel',01123873265,'salah@yaho.com',3,'8208 3627 8482 1704');
insert into Driver values(4,'taha','adel',01083766643,'taha@yaho.com',4,'0103 9884 1847 1987');
insert into Driver values(5,'shaban','yasin',01073529735,'shaban@yaho.com',5,'7382 9928 2782 7018');
insert into Driver values(6,'wael','osama',01126883902,'wael@yaho.com',6,'0833 3764 1739 2197');
insert into Driver values(7,'karim','saber',01287354679,'karim@yaho.com',7,'0298 3748 6329 7489');
insert into Driver values(8,'khaled','yousry',01073846298,'khaled@yaho.com',8,'8738 8034 7294 7028');
insert into Driver values(9,'sobhi','shadi',01183469271,'sobhi@yaho.com',9,'8743 2389 2803 7489');
insert into Driver values(10,'yasser','sayed',01082463890,'yasser@yaho.com',10,'8938 9297 6648 2047');
insert into Driver values(11,'ziad','ibrahim',01283746590,'ziad@yaho.com',11,'8923 7283 1604 8732');
insert into Driver values(12,'mohamed','yousif',01027347836,'mohamed@yaho.com',12,'8923 0274 7327 4633');
insert into Driver values(13,'ahmed','mahmoud',01173744281,'ahmed@yaho.com',13,'9833 6472 9823 9029');
insert into Driver values(14,'mostafa','ayman',01236485902,'mostafa@yaho.com',14,'0737 6473 6710 6713');
insert into Driver values(15,'fathi','tamer',01063459083,'fathi@yaho.com',15,'7849 7382 8723 8942');
insert into Driver values(16,'sherif','mostafa',01173673811,'sherif@yaho.com',16,'8943 2129 3823 0182');
insert into Driver values(17,'ezzat','maher',01173645091,'ezzat@yaho.com',17,'9898 8942 1928 0288');
insert into Driver values(18,'adham','gamal',01028364411,'adham@yaho.com',18,'9834 7293 7823 9823');
insert into Driver values(19,'tamer','hazem',01284775843,'tamer@yaho.com',19,'9823 3783 9239 9833');
insert into Driver values(20,'ashraf','atef',01182736453,'ashraf@yaho.com',20,'3298 9832 0921 9843');

/* payment information*/
insert into Payment values(1,'4513 2568 5876 0869','BANQUE MISR',123,'2022-11-11 13:23:44',2);
insert into Payment values(2,'8733 1533 8536 1457','National Bank of Egypt',329.7,'2022-09-12 14:25:44',8);
insert into Payment values(3,'8383 8663 1452 6245','Banque du Caire',172,'2022-11-14 18:34:33',4);
insert into Payment values(4,'9872 6367 8475 2947','ALEXBANK',0,'2022-07-15 19:34:32',8);
insert into Payment values(5,'4323 6453 2324 9435','BANQUE MISR',432.87,'2022-11-16 20:55:11',6);
insert into Payment values(6,'5433 7652 1865 3253','National Bank of Egypt',227.83,'2022-04-18 22:11:52',1);
insert into Payment values(7,'6724 2467 27332 8642','Banque du Caire',753,'2022-11-19 17:22:01',14);
insert into Payment values(8,'9234 5325 2561 7424','ALEXBANK',0,'2022-10-23 20:11:22',16);
insert into Payment values(9,'4513 2568 5876 0869','BANQUE MISR',213,'2022-11-21 21:09:54',1);
insert into Payment values(10,'7543 2456 4566 7432','ALEXBANK',432,'2022-02-20 09:12:43',12);
insert into Payment values(11,'6743 2643 2754 8642','National Bank of Egypt',0,'2022-12-24 22:11:13',7);
insert into Payment values(12,'9750 8745 3673 8536','Banque du Caire',473,'2022-11-26 04:21:11',15);
insert into Payment values(13,'4513 2568 5876 0869','BANQUE MISR',0,'2022-11-25 07:21:35',7);
insert into Payment values(14,'76453 2356 7436 6436','ALEXBANK',345,'2022-04-28 17:12:45',7);
insert into Payment values(15,'6456 3453 8756 2343','BANQUE MISR',643,'2022-11-29 12:43:21',2)
insert into Payment values(16,'7356 2456 7438 9674','National Bank of Egypt',0,'2022-10-30 03:04:11',19);
insert into Payment values(17,'8537 4638 8654 2356','Banque du Caire',311,'2022-01-1 14:08:03',9);
insert into Payment values(18,'2743 7437 2456 8764','ALEXBANK',334,'2022-06-24 18:07:51',1);
insert into Payment values(19,'4513 2568 5876 0869','BANQUE MISR',642,'2022-11-11 23:21:59',13);
insert into Payment values(20,'7532 2683 6373 2743','National Bank of Egypt',533,'2022-11-11 15:18:03',20);

/* rating information*/
insert into Rating values(1,5,5,'null','null');
insert into Rating values(2,3,4,'bad','bad');
insert into Rating values(3,9,9,'perfect','perfect');
insert into Rating values(4,7,4,'good','accepted');
insert into Rating values(5,8,6,'null','null');
insert into Rating values(6,8.8,6.7,'very good','good');
insert into Rating values(7,5,5,'accepted','accepted');
insert into Rating values(8,1,3,'bad','bad');
insert into Rating values(9,7,4,'good','accepted');
insert into Rating values(10,10,10,'perfect','perfect');
insert into Rating values(11,2,2,'null','null');
insert into Rating values(12,9,7,'excellent','very good');
insert into Rating values(13,7,4,'good','accepted');
insert into Rating values(14,3,4,'not good','not good');
insert into Rating values(15,9,6,'null','null');
insert into Rating values(16,8,8,'very good','very good');
insert into Rating values(17,8,6,'very good','good');
insert into Rating values(18,3,5,'bad','accepted');
insert into Rating values(19,6,4,'null','null');
insert into Rating values(20,0,0,'very bad','very bad');

/* trip information*/
insert into Trip values(1,2,3,8,'completed','tanta','cairo','2022-09-12 14:25:44',10,1);
insert into Trip values(2,4,5,7,'completed','mansoura','cairo','2022-09-12 14:25:44',30,3);
insert into Trip values(3,6,18,6,'completed','tanta','cairo','2022-09-12 14:25:44',20,5);
insert into Trip values(4,8,9,5,'not completed','tanta','fayoum','2022-06-22 04:15:34',200,4);
insert into Trip values(5,10,11,4,'completed','minia','cairo','2022-09-12 14:25:44',18,2);
insert into Trip values(6,12,13,3,'completed','giza','esmailia','2022-09-12 14:25:44',8,10);
insert into Trip values(7,14,15,2,'completed','tanta','cairo','2022-09-12 14:25:44',18,7);
insert into Trip values(8,16,17,1,'not completed','fayoum','cairo','2022-04-23 19:15:14',140,8);
insert into Trip values(9,1,19,9,'completed','tanta','cairo','2022-09-12 14:25:44',35,9);
insert into Trip values(10,20,2,10,'completed','sohag','mahala','2022-09-12 14:25:44',1,20);
insert into Trip values(11,1,1,20,'completed','tanta','cairo','2022-09-12 14:25:44',20,6);
insert into Trip values(12,7,4,19,'not completed','alex','sinai','2022-05-10 11:23:34',150,13);
insert into Trip values(13,1,8,18,'completed','tanta','cairo','2022-09-12 14:25:44',20,18);
insert into Trip values(14,7,6,17,'completed','cairo','matrouh','2022-09-12 14:25:44',20,14);
insert into Trip values(15,9,12,16,'completed','tanta','cairo','2022-09-12 14:25:44',15,17);
insert into Trip values(16,7,10,15,'not completed','banha','aswan','2022-02-22 17:45:24',110,11);
insert into Trip values(17,13,16,14,'completed','tanta','cairo','2022-09-12 14:25:44',25,19);
insert into Trip values(18,15,14,13,'completed','suiz','cairo','2022-12-24 22:11:13',23,12);
insert into Trip values(19,2,10,12,'completed','tanta','6october','2022-09-12 14:25:44',7,15);
insert into Trip values(20,19,20,11,'not completed','tanta','cairo','2022-12-12 14:21:14',190,16);


/*lets try some queres*/


/* query 1 :  find the full names of customers and total numbers of trips payment they pay in all trips 
and number  order them from larger total amount*/
create procedure q1 as
begin 
select c.first_name+' '+c.last_name as 'full name',sum(amount) as 'total amount' ,count(amount) as 'number of trips' 
from Payment p , Customer c where p.customer_id=c.id
group by first_name,last_name
order by sum(amount) desc
end;

exec q1;



/*query 2 : make view for total money they earned after 20% discount for uber company */
create view total_profit_driver as
select d.first_name+' '+d.last_name as 'full name' , sum(amount)*.8 as 'total money'  from 
Driver d join Trip t on d.id=t.customer_id 

join Payment p on t.payment_id=p.payment_id
group by first_name,last_name;

select * from total_profit_driver;





/* query 3 :  find drivers will have bonus that average bonus trip > 8*/
create view bonus as
select d.first_name+' '+d.last_name as 'full name',
case
when avg(r.customer_rating+r.driver_rating)/2 > 8 then 'bonus'
else
'have no bonus'
end
as 'bonus'
from Driver d join Trip t on d.id=t.driver_id join rating r on r.rating_id=t.rating_id 
group by first_name, last_name;

select * from bonus;




/* query 4 :  select waiting time for all trips than 30 minutes*/
create procedure q4 as
begin
select t.id , t.waiting_time  from Trip t
where t.waiting_time>30
end;

exec q4;




/* query 5 :   find number of trips and total money trip occurs in the month 9 */
create procedure q5 as
begin
select count(t.id) as 'no of trips', sum(p.amount) as 'total trips payment' from Trip t, Payment p 
where t.payment_id=p.payment_id and MONTH(t.created_at)=9
end;
exec q5;





/* query 6 :  find expensive paying trip information  */
create procedure q6 as
begin
select t.id ,p.amount ,t.created_at ,t.source , t.destination from Trip t join Payment p on t.payment_id=p.payment_id 
where p.amount=(select max(p2.amount) from Payment p2)
end

exec q6;




/* query 7 :  find trips not completed information  */
create procedure q7 as
begin
select t.id ,t.created_at ,t.source , t.destination from Trip t
where t.status='not completed'
end;


/* query 8 :   find highest rating trip information from customer and dexec q7;
river */
create procedure q8 as
begin
select t.rating_id ,t.customer_id ,t.driver_id from Trip t , Rating r where t.rating_id=r.rating_id and r.rating_id=
(select r2.rating_id from Rating r2 where r2.customer_rating + 
r2.driver_rating=(select max(r3.driver_rating+r3.customer_rating) from Rating r3))
end;
exec q8;



/* query 9 :  create function to check if the trip completed or not according to trip_id*/
create Function check_trip_status(@id int)
returns varchar(20) as
begin
declare @status varchar(20);
select @status=t.status
from Trip t where t.id=@id;
return @status;
end

/*enter trip_id*/
select dbo.check_trip_status(7) as statue;


/* query 10 :  make procedure to print car_model according to driver_id*/
create procedure model_car
@id int,
@model int output
as
begin
select @model=c.model from Car c join Driver d on c.car_id=d.car_id
where @id=d.car_id;
end

/* input driver car */
declare @modelcar int
exec model_car @id=12,  @model=@modelcar output
select @modelcar;





create procedure Trips_nums
@id int,
@model int output
as
begin
select c.first_name+' '+c.last_name as 'full name',count(*) from Trip t  join Customer c on c.id=t.id
group by first_name,last_name
end

/* input driver car */
declare @number_of_trips int
exec Trips_nums @id=12,  @model=@number_of_trips output
select @number_of_trips;


create procedure Trips_numsss
@id int,
@nums int ,@name varchar(30) output as
begin
select @name=c.first_name+' '+c.last_name ,@nums=count(@id) from Trip t join Customer c on t.customer_id=c.id 
where @id=t.customer_id
group by first_name,last_name
end

declare @number_of_trips int
declare @fullname varchar(30)
exec Trips_numsss @id=11,  @nums=@number_of_trips , @name=@fullname output
select @number_of_trips , @fullname;


select c.first_name+' '+c.last_name ,count(c.id) from Trip t,Customer c where t.customer_id=c.id
group by first_name,last_name