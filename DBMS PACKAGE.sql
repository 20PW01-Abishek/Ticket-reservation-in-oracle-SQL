create table user_details
(
    user_id int primary key,
    first_name varchar(50) check(ascii(substr(first_name,1,1))between 64 and 91),
    last_name varchar(50) check(ascii(substr(last_name,1,1))between 64 and 91),
    adhar_no int,
    gender char check (gender in('M','F')),
    age int check(age >= 18),
    mobile_no int,
    email varchar(50),
    city varchar(50),
    state varchar(50),
    pincode varchar(20),
    password varchar(50)
);

create table TRAIN
(
    train_no int primary key,
    train_name varchar(50),
    source_time varchar(20),
    destination_time varchar(20),
    no_of_seats int check (no_of_seats between 0 and 100),
    running_days varchar(20)
);

create table STATION
(
    station_no int,
    name varchar(50),
    halt int,
    arrival_time varchar(20),
    departure_time varchar(20),
    train_no int,
    primary key(station_no,train_no),
    foreign key(train_no) references TRAIN(train_no)
);

create table TICKET
(
    ticket_id int primary key not null,
    user_id int,
    status char check (status in ('C','W')),
    no_of_passengers int,
    train_no int,
    from_station varchar(20),
    to_station varchar(20),
    foreign key (user_id) references user_details (user_id),
    foreign key (train_no) references TRAIN (train_no)
);

create table PASSENGER
(
    passenger_id int primary key,
    pnr int,
    name varchar(50) check(ascii(substr(name,1,1)) between 64 and 91),
    user_id int,
    age int,
    gender char check(gender in ('M','F')),
    ticket_id int,
    reservation_status char check(reservation_status in ('C','W')),
    seat_no varchar(5),
    foreign key (user_id) references user_details(user_id),
    foreign key (ticket_id) references ticket(ticket_id)
);

create table starts
(
    station_no int,
    train_no int,
    primary key(station_no,train_no),
    foreign key (station_no,train_no) references Station(station_no,train_no)    
);
create table stops_at
(
    station_no int,
    train_no int,
    primary key(station_no,train_no),
    foreign key (station_no,train_no) references Station(station_no,train_no)
);
create table Reaches
(
    station_no int,
    train_no int,
    time varchar(20),
    primary key(station_no,train_no),
    foreign key (station_no,train_no) references Station(station_no,train_no)
);

create table Books
(
    user_id int,
    ticket_id int,
    passenger_id int,
    primary key(user_id,ticket_id,passenger_id),
    foreign key (user_id) references User_details(user_id),
    foreign key (ticket_id)references Ticket(ticket_id)
);

create table Cancels
(
    user_id int,
    ticket_id int,
    primary key(user_id,ticket_id),
    foreign key (user_id) references User_details(user_id),
    foreign key (ticket_id)references Ticket(ticket_id)
);

insert into user_details values(100,'Sai','Dinesh',241002,'M',19,9876543210,'saidinesh@gmail.com','Chennai','Tamil_Nadu','600001','qwerty');
insert into user_details values(101,'Mohamed','Kaif',241234,'M',20,9786532432,'Mohamedkaif@gmail.com','Coimbatore','Tamil_Nadu','643001','ASDFG');
insert into user_details values(102,'Pravin','Balaji',241987,'M',21,7543256892,'pravinbalaji@gmail.com','Coimbatore','Tamil_Nadu','643002','MNJKL');
insert into user_details values(103,'Vijay','Krishna',241258,'M',20,700324567,'vjkrishna@gmail.com','Chennai','Tamil_Nadu','600005','PQRST');
insert into user_details values(104,'Taylor','Swift',241169,'F',20,8056453226,'Taylorswift@gmail.com','Mumbai','Maharastra','400001','STUVW');
insert into user_details values(105,'Shri','Mathi',256432,'F',32,7260059324,'shrimathi@gmail.com','Madurai','Tamil_Nadu','660001','EFGHI');

insert into train values(06001,'Circar_express','6:00','12:00',45,'Daily');
insert into train values(06002,'Brindavan_express','8:30','14:30',50,'Daily');
insert into train values(06003,'GT_express','9:00','18:30',64,'WED,FRI');
insert into train values(06004,'PEARL_express','05:30','17:40',77,'Daily');
insert into train values(06005,'Humsafar_express','7:00','19:10',80,'MON,WED,FRI');


insert into Station values(2,'Salem',1,'8:00','8:05',06001);
insert into station values(3,'Erode',2,'10:15','10:20',06001);
insert into station values(4,'Coimbatore',3,'12:00','-',06001);

insert into station values(5,'Villupuram',2,'9:30','9:35',06002);
insert into station values(6,'Tiruchy',3,'10:15','10:20',06002);
insert into station values(7,'Madurai',4,'11:00','11:10',06002);
insert into station values(17,'Theni',5,'14:30','-',06002);

insert into station values(5,'Villupuram',1,'9:30','9:35',06003);
insert into station values(6,'Tiruchy',2,'10:30','10:45',06003);
insert into station values(7,'Madurai',3,'13:00','13:10',06003);
insert into station values(8,'Kovilpatti',4,'15:30','15:40',06003);
insert into station values(9,'Tuticorin',5,'16:45','16:50',06003);
insert into station values(10,'Tirunelveli',6,'17:30','17:40',06003);
insert into station values(16,'Kanyakumari',7,'18:30','-',06003);

insert into station values(5,'Villupuram',1,'7:00','7:10',06004);
insert into station values(6,'Tiruchy',2,'10:00','10:10',06004);
insert into station values(7,'Madurai',3,'12:00','12:10',06004);
insert into station values(8,'Kovilpatti',4,'15:30','15:40',06004);
insert into station values(9,'Tuticorin',5,'17:40','-',06004);

insert into station values(11,'Kanchipuram',1,'8:15','8:30',06005);
insert into station values(12,'Cuddalore',2,'10:30','10:45',06005);
insert into station values(13,'Ariyalur',3,'15:30','15:40',06005);
insert into station values(14,'Tanjavur',4,'16:20','16:25',06005);
insert into station values(15,'Rameshwaram',5,'19:10','-',06005);

insert into station values(1,'Chennai',0,'-','6:00',06001);
insert into station values(1,'Chennai',0,'-','8:30',06002);
insert into station values(1,'Chennai',0,'-','9:00',06003);
insert into station values(1,'Chennai',0,'-','05:30',06004);
insert into station values(1,'Chennai',0,'-','7:00',06005);

insert into starts values(1,06001);
insert into starts values(1,06002);
insert into starts values(1,06003);
insert into starts values(1,06004);
insert into starts values(1,06005);

insert into reaches values(4,6001,'12:00');
insert into reaches values(17,6002,'14:30');
insert into reaches values(16,6003,'18:30');
insert into reaches values(9,6004,'17:40');
insert into reaches values(15,6005,'19:10');

insert into stops_at values(2,6001);
insert into stops_at values(3,6001);
insert into stops_at values(4,6001);

insert into stops_at values(5,6002);
insert into stops_at values(6,6002);
insert into stops_at values(7,6002);
insert into stops_at values(17,6002);

insert into stops_at values(5,6003);
insert into stops_at values(6,6003);
insert into stops_at values(7,6003);
insert into stops_at values(8,6003);
insert into stops_at values(9,6003);
insert into stops_at values(10,6003);
insert into stops_at values(16,6003);

insert into stops_at values(5,6004);
insert into stops_at values(6,6004);
insert into stops_at values(7,6004);
insert into stops_at values(8,6004);
insert into stops_at values(9,6004);

insert into stops_at values(11,6005);
insert into stops_at values(12,6005);
insert into stops_at values(13,6005);
insert into stops_at values(14,6005);
insert into stops_at values(15,6005);

insert into ticket values(200,100,'C',1,6001,'Chennai','Erode');
insert into ticket values(201,103,'C',1,6002,'Chennai','Theni');
insert into ticket values(202,102,'C',2,6003,'Chennai','Kanyakumari');
insert into ticket values(203,104,'C',2,6004,'Chennai','Tuticorin');
insert into ticket values(204,105,'C',1,6005,'Chennai','Rameshwaram');
insert into ticket values(206,102,'W',1,6004,'Villupuram','Tuticorin');
insert into ticket values(207,103,'W',2,6003,'Tiruchy','Kanyakumari');

create sequence pno
minvalue 5000
start with 5000
increment by 1;

insert into passenger values(10,pno.nextval,'Anand',100,47,'M',200,'C','B100');
insert into passenger values(11,pno.nextval,'Bala',103,46,'M',201,'C','B101');
insert into passenger values(12,pno.nextval,'Chitra',105,48,'F',204,'C','B102');
insert into passenger values(13,pno.nextval,'Devi',102,42,'F',202,'C','B103');
insert into passenger values(14,pno.nextval,'Esther',102,44,'F',202,'C','B104');
insert into passenger values(15,pno.nextval,'Francis',104,32,'M',203,'C','B105');
insert into passenger values(16,pno.nextval,'Gayatri',104,28,'F',203,'C','B106');
insert into passenger values(17,pno.nextval,'Venkatesh',102,56,'M',206,'W','B108');
insert into passenger values(18,pno.nextval,'Tamilarasan',103,52,'M',207,'W','B109');
insert into passenger values(19,pno.nextval,'Ram',103,27,'M',207,'W','B110');

--1.Create a trigger which reduce the available seats in train when a ticket is booked.
set serveroutput on
create or replace trigger seat_booking after insert on books 
for each row

declare
tno int;
passno int;

begin
select train_no into tno from ticket where ticket_id=:new.ticket_id;
select no_of_passengers into passno from ticket where ticket_id=:new.ticket_id; 
update train set no_of_seats=no_of_seats-passno where train_no=tno;
end;
/


insert into books values(102,206,17);
insert into books values(103,207,18);
insert into books values(103,207,19);



--2.Create a trigger which increases the available seats in train when a ticket is cancelled.
create or replace trigger ticket_cancelling after insert on cancels
for each row

declare
tno int;
passno int;

begin
select train_no into tno from ticket where ticket_id=:new.ticket_id;
select no_of_passengers into passno from ticket where ticket_id=:new.ticket_id;
update train set no_of_seats=no_of_seats+passno where train_no=tno;
delete from passenger where ticket_id=:new.ticket_id;
end;
/
insert into cancels values(103,207);

--3.print the details of user details who booked ticket on the inputed train number
SET SERVEROUTPUT ON
declare
tname train.train_name%type;
begin
for c in (select u.user_id,concat(u.first_name,u.last_name) as name 
          from user_details u inner join ticket t on u.user_id=t.user_id inner join train tr on tr.train_no=t.train_no 
          where tr.train_name='&tname')
          loop
          dbms_output.put_line(c.user_id||'    '||c.name);
          end loop;
        end;
        
        
--4.print the passenger details who booked under a inputed  ticket
SET SERVEROUTPUT ON
declare 
tic_id ticket.ticket_id%type;
begin
dbms_output.put_line('PASSENGER_ID '||' '||'NAME');
for c in (select * from passenger p inner join ticket t on p.ticket_id=t.ticket_id where t.ticket_id='&tic_id')
    loop
    dbms_output.put_line(c.passenger_id || '            '||c.name);
    end loop;
end;

--5.print the train which starts from a inputed station name
SET SERVEROUTPUT ON
declare
sname station.name%type;
begin
    for c in (select * from starts r natural join station s natural join train t where s.name='&sname')
    loop
    dbms_output.put_line(c.train_name);
    end loop;
end;

--6.print the details of all trains running through a inputed station

declare
sname station.name%type;
begin
dbms_output.put_line('Train_no       Train_name        arr_time       departure_time');
    for c in (select s.train_no,t.train_name,s.arrival_time,s.departure_time from station s inner join train t 
                on t.train_no=s.train_no where s.name='&sname')
    loop
    dbms_output.put_line(c.train_no||'          '||c.train_name||'          '||c.arrival_time||'          '||c.departure_time);
    end loop;
end;

--7.Display the details of passengers of inputed train number
declare 
tno train.train_no%type;
begin
for c in (select p.pnr,p.name,p.age,t.from_station,t.to_station from passenger p inner join ticket t on p.ticket_id=t.ticket_id where t.train_no='&tno')
loop
dbms_output.put_line(c.pnr||'  '||c.name||'  '||c.age||'  '||c.from_station||' to '||c.to_station);
end loop;
end;

--8.Book a ticket for one passenger in circar express
declare
Tic_id int;
user_id int;
pass_id int;
begin
Tic_id:=&Tic_id;
user_id:=&user_id;
insert into ticket values (Tic_id,user_id,'&status',1,6001,'&from_station','&to_station');
pass_id:=&pass_id;
insert into passenger values(pass_id,pno.nextval,'&name',user_id,&age,'&gender',Tic_id,'&reservation_status','&seat_no');
insert into books values(user_id,tic_id,pass_id);
end;

--9.Display immediate train from station to another station
SET SERVEROUTPUT ON 
declare
station1 int;
station2 int;
from_station varchar(20);
to_station varchar(20);
begin
from_station:='&from_station';
to_station:='&to_station';
select distinct station_no into station1 from station where name=from_station;
select distinct station_no into station2 from station where name=to_station;

for c in (
select distinct t.train_no,t.train_name from train t inner join stops_at s on t.train_no=s.train_no  where s.station_no=station1 or s.station_no=station2
)
loop
dbms_output.put_line(c.train_no||' '||c.train_name);
end loop;
end;

--10.Display the details of train running on DAILY
begin
for c in (select train_no,train_name from train where  running_days='Daily')
loop
dbms_output.put_line(c.train_no||' '||c.train_name);
end loop;
end;

--11.Print the details of passenger whose ticket is in waiting list in a inputed train_number
declare
train_no int;
begin
for c in (select * from passenger p inner join ticket t on t.ticket_id=p.ticket_id where t.train_no=&train_no and t.status='W')
loop
dbms_output.put_line(c.name||' '||c.pnr);
end loop;
end;

--12.Print the details of passenger whose ticket is in confirmed in a inputed train_number
declare
train_no int;
begin
for c in (select * from passenger p inner join ticket t on t.ticket_id=p.ticket_id where t.train_no=&train_no and t.status='C')
loop
dbms_output.put_line(c.name||' '||c.pnr);
end loop;
end;

--13:Create an audit table for 'Ticket' table.
create table Ticket_audit
(
ticket_id int,
no_of_passengers int,
entry_date varchar(20),
operation varchar(20)
);

create or replace trigger Tick_audit 
before insert or delete or update on Ticket
for each row
enable
declare
e_date varchar(20);
operation varchar(20);
begin
    select TO_CHAR(sysdate,'DD/MM/YYYY HH24:MI:SS') into e_date from dual;
    if INSERTING then
        insert into Ticket_audit values(:new.ticket_id,:new.no_of_passengers,e_date,'Insertion');
    elsif DELETING then
        insert into Ticket_audit values(:old.ticket_id,:old.no_of_passengers,e_date,'Deletion'); 
    end if;
end;

insert into ticket values(215,104,'C',3,6001,'Coimbatore','Chennai');
select * from Ticket_audit;

--14.create an audit table for  Passenger  table
create table passenger_audit
(
    new_passenger_id int,
    old_passenger_id int,
    entry_date varchar(20),
    operation varchar(20)
);

set serveroutput on
create or replace trigger passenger_audit_trigger
before insert or update or delete on passenger
for each row
enable
declare
    pdate passenger_audit.entry_date%type;
begin
    select TO_CHAR(sysdate,'DD/MON/YYYY HH24:MI:SS') into pdate from dual;
    if inserting then
        insert into passenger_audit values (:new.passenger_id,NULL,pdate,'Insertion');
    elsif updating then
        insert into passenger_audit values (:new.passenger_id,:old.passenger_id,pdate,'Updation');
    elsif deleting then
        insert into passenger_audit values (NULL,:old.passenger_id,pdate,'Deletion');
    end if;
end;


insert into passenger values(20,pno.nextval,'Swetha',103,18,'F',207,'W','D069');
delete from passenger where passenger_id=20;
select * from passenger_audit;

--15:Display the number of seats available in inputed train
set serveroutput on
begin
for c in (select no_of_seats from train where train_no=&train_no)
loop
dbms_output.put_line('SEATS AVAILABLE '|| c.no_of_seats );
end loop;
end;

--16.Display the details of passenger who are above the age of 45 in a inputed train
begin
for c in (select p.name,p.pnr from passenger p inner join ticket t on t.ticket_id=p.ticket_id where t.train_no=&train_no and p.age>45)
loop
dbms_output.put_line(c.name||' '||c.pnr);
end loop;
end;

--17.Display the details of train running on Monday
begin
for c in (select train_no,train_name from train where running_days like '%MON%' or running_days='Daily')
loop
dbms_output.put_line(c.train_no||' '||c.train_name);
end loop;
end;


--18.Display the train number and name which has more number of halts
begin 
for c in (select * from (select t.train_name from station s inner join train t on s.train_no=t.train_no order by s.halt desc)where rownum=1)
loop
dbms_output.put_line(c.train_name);
end loop;
end;

--19.Display the train details which has more than 50 seats available
SET SERVEROUTPUT ON;

DECLARE
Tno train.Train_no%type;
Tname train.Train_name%type;
seats train.No_of_seats%type;
cursor c is 
select Train_no,Train_name,no_of_seats from train
where no_of_seats > 50;

BEGIN
    open c;
    loop
        fetch c into Tno,Tname,seats;
        dbms_output.put_line(Tno || '  ' || Tname || '  ' || seats);
        exit when c%NOTFOUND;
    end loop;
    close c;
END;

--20.cancel the ticket for passenger with pnr = 5002

declare
tic_id int;
begin
select ticket_id into tic_id from passenger where pnr=5002; 
insert into cancels values(102,tic_id);
delete from passenger where passenger_id=(select passenger_id from passenger where pnr=5012);
end;
