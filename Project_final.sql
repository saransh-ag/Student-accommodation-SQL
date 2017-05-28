--Setup Phase
-- Creating Individual Tables for entities

-- Created a new workspace called 'Project'
-- Login into data base using credentials for new workspace

CONNECT;
-- entering login credentials here
-- to get output on screen
SET SERVEROUTPUT ON;

--Table 1- STUDENT

CREATE TABLE STUDENT (
StudentNo INT NOT NULL,
fName VARCHAR(10) NOT NULL,
-- first name
lName VARCHAR(10) NOT NULL,
-- last name
address VARCHAR(20) NOT NULL,
date_of_birth DATE NOT NULL,
sex VARCHAR(6) NOT NULL,
degree VARCHAR(5) NOT NULL,
nationality VARCHAR(10) NOT NULL,
spl_req VARCHAR(20),
-- Altered table, special needs aren't necessary
PRIMARY KEY (StudentNo)
-- defining a primary key
);

-- Table 2- Flat

CREATE TABLE Flat(
flatNo int NOT NULL,
faddr VARCHAR(20) NOT NULL,
no_of_rooms INT NOT NULL,
PRIMARY KEY (flatNo)
);

-- Table 3- Room
CREATE TABLE Room(
roomNo int NOT NULL,
rent INT NOT NULL,
-- rent of each room
flatNo int NOT NULL,
-- flat in which room is located
PRIMARY KEY (roomNo),
FOREIGN KEY (flatNo) REFERENCES Flat(flatNo)
-- flatNo is the foreign key for table Room
-- which is primary key for table Flat
);

-- Table 4- Course
CREATE TABLE Course(
courseNo int NOT NULL,
cTitle VARCHAR(10) NOT NULL,
-- title of courseNo
coach VARCHAR(10) NOT NULL,
-- as per the desc., coach is not member of staff
-- so no need to store other details
PRIMARY KEY (courseNo)
);

-- Table 5- Staff
CREATE TABLE Staff(
staffid int NOT NULL,
fName VARCHAR(20) NOT NULL,
lName VARCHAR(20),
addr VARCHAR(20) NOT NULL,
position VARCHAR(10) NOT NULL,
PRIMARY KEY (staffid)
);

-- Table 6- Lease
CREATE TABLE Lease(
leaseNo int NOT NULL,
length int NOT NULL,
--length is in no of days
StudentNo INT NOT NULL,
roomNo int NOT NULL,
checkin DATE NOT NULL,
-- date when student checkin room
checkout DATE NOT NULL,
-- date when student checkout room
PRIMARY KEY (leaseNo),
FOREIGN KEY (StudentNo) REFERENCES STUDENT(StudentNo),
-- lease is dependent on studentNo
FOREIGN KEY (roomNo) REFERENCES Room(roomNo)
-- dependency on roomNo
);

-- Table 7- Invoice
CREATE TABLE Invoice(
invNo int NOT NULL,
payment int NOT NULL,
payment_date DATE NOT NULL,
payment_type VARCHAR(10) NOT NULL,
-- type includes card/ cash/ cheque
leaseNo int NOT NULL,
PRIMARY KEY (invNo),
FOREIGN KEY (leaseNo) REFERENCES Lease(leaseNo)
);

-- Table 8 - Inspection
CREATE TABLE Inspection(
date_of_insp DATE NOT NULL,
remarks VARCHAR(20) NOT NULL,
-- remarks like conditions are given by staff
flatNo int NOT NULL,
staffid int NOT NULL,
FOREIGN KEY (flatNo) REFERENCES Flat(flatNo),
FOREIGN KEY (staffid) REFERENCES Staff(staffid)
);

-- Table 9- Service
CREATE TABLE Service(
serviceNo int NOT NULL,
staffid int NOT NULL,
PRIMARY KEY (serviceNo),
FOREIGN KEY (staffid) REFERENCES Staff(staffid)
);

--Table 10- Guardian
CREATE TABLE Guardian(
StudentNo INT NOT NULL,
name VARCHAR(20) NOT NULL,
gaddr VARCHAR(20)NOT NULL,
-- address of guardian
tel_no VARCHAR(15) NOT NULL,
-- emergency tel_no of guardian
FOREIGN KEY (StudentNo) REFERENCES STUDENT(StudentNo)
);

-- Inserting values in tables
-- General syntax applied to all tables
-- 10 rows per table
--Table 1- STUDENT

INSERT INTO STUDENT (StudentNo, fName, lName, address, date_of_birth, sex, degree, nationality) VALUES (100, 'John', 'Murphy', '2, Roebuck Castle', '23-Jan-93', 'Male', 'BSc', 'Ireland');
INSERT INTO STUDENT (StudentNo, fName, lName, address, date_of_birth, sex, degree, nationality) VALUES (101, 'Jennifer', 'Neary', '25, St Patricks Park', '2-Feb-92', 'Female', 'BA', 'Ireland');
INSERT INTO STUDENT (StudentNo, fName, lName, address, date_of_birth, sex, degree, nationality) VALUES (102, 'Xiang', 'Yao', '45, Belfield Downs', '23-Dec-88', 'Male', 'MSc', 'China');
INSERT INTO STUDENT (StudentNo, fName, lName, address, date_of_birth, sex, degree, nationality) VALUES (103, 'Ram', 'Nathan', '23, Woodbine Avenue', '3-Mar-94', 'Male', 'BE', 'India');
INSERT INTO STUDENT (StudentNo, fName, lName, address, date_of_birth, sex, degree, nationality) VALUES (104, 'Sebastian', 'Gallardo', '11, Mount Merrion Av', '13-Apr-87', 'Male', 'MBA', 'France');
INSERT INTO STUDENT (StudentNo, fName, lName, address, date_of_birth, sex, degree, nationality) VALUES (105, 'Ania', 'Borges', '67, Booterstown Road', '9-Aug-94', 'Female', 'BA', 'Brazil');
INSERT INTO STUDENT (StudentNo, fName, lName, address, date_of_birth, sex, degree, nationality, spl_req) VALUES (106, 'Francesca', 'Spencer', '55, Stradbrook Park', '5-Sep-93', 'Female', 'BA', 'Poland','wheel chair access');
INSERT INTO STUDENT (StudentNo, fName, lName, address, date_of_birth, sex, degree, nationality) VALUES (107, 'Chenzhui', 'Li', '9, Avoca Avenue', '19-Nov-94', 'Female', 'MSc', 'China');
INSERT INTO STUDENT (StudentNo, fName, lName, address, date_of_birth, sex, degree, nationality) VALUES (108, 'Rahul', 'Kumar', '27, Arlington Plaza', '15-Aug-89', 'Male', 'PhD', 'India');
INSERT INTO STUDENT (StudentNo, fName, lName, address, date_of_birth, sex, degree, nationality) VALUES (109, 'Eric', 'Wallner', '43, Muckross House', '31-Mar-90', 'Male', 'BA', 'Germany');
INSERT INTO STUDENT (StudentNo, fName, lName, address, date_of_birth, sex, degree, nationality) VALUES (110, 'Orla', 'Fitz', '2, Roebuck Castle', '23-Jan-93', 'Male', 'BSc', 'Ireland');

-- Table 2- Flat
INSERT INTO Flat (flatNo, faddr, no_of_rooms) VALUES (1, '2,Mount Merrion',4);
INSERT INTO Flat (flatNo, faddr, no_of_rooms) VALUES (2, '3,Mount Merrion',5);
INSERT INTO Flat (flatNo, faddr, no_of_rooms) VALUES (3, '3,Mount Merrion',5);
INSERT INTO Flat (flatNo, faddr, no_of_rooms) VALUES (4, '3,Mount Merrion',5);
INSERT INTO Flat (flatNo, faddr, no_of_rooms) VALUES (5, '2,Mount Merrion',4);
INSERT INTO Flat (flatNo, faddr, no_of_rooms) VALUES (6, '2,Mount Merrion',4);
INSERT INTO Flat (flatNo, faddr, no_of_rooms) VALUES (7, '2,Mount Merrion',4);
INSERT INTO Flat (flatNo, faddr, no_of_rooms) VALUES (8, '5,Mount Merrion',6);
INSERT INTO Flat (flatNo, faddr, no_of_rooms) VALUES (9, '5,Mount Merrion',6);
INSERT INTO Flat (flatNo, faddr, no_of_rooms) VALUES (10, '5,Mount Merrion',6);

-- Table 3- Room
INSERT INTO Room (roomNo, rent, flatNo) VALUES (21, 500, 2);
INSERT INTO Room (roomNo, rent, flatNo) VALUES (22, 500, 2);
INSERT INTO Room (roomNo, rent, flatNo) VALUES (11, 600, 1);
INSERT INTO Room (roomNo, rent, flatNo) VALUES (12, 600, 5);
INSERT INTO Room (roomNo, rent, flatNo) VALUES (13, 600, 1);
INSERT INTO Room (roomNo, rent, flatNo) VALUES (23, 500, 4);
INSERT INTO Room (roomNo, rent, flatNo) VALUES (31, 450, 9);
INSERT INTO Room (roomNo, rent, flatNo) VALUES (32, 450, 10);
INSERT INTO Room (roomNo, rent, flatNo) VALUES (33, 450, 8);
INSERT INTO Room (roomNo, rent, flatNo) VALUES (24, 500, 4);

-- Table 4- Course
INSERT INTO Course (courseNo, cTitle, coach) VALUES (1, 'Yoga', 'John');
INSERT INTO Course (courseNo, cTitle, coach) VALUES (2,'Pilates', 'Ciara');
INSERT INTO Course (courseNo, cTitle, coach) VALUES (3,'Meditation','Ruth');
INSERT INTO Course (courseNo, cTitle, coach) VALUES (4,'Salsa','Louis');
INSERT INTO Course (courseNo, cTitle, coach) VALUES (5, 'Zumba', 'Nina');
INSERT INTO Course (courseNo, cTitle, coach) VALUES (6,'Fusion','Emma');
INSERT INTO Course (courseNo, cTitle, coach) VALUES (7,'Craft','Liz');
INSERT INTO Course (courseNo, cTitle, coach) VALUES (8,'Gardening','Hazel');
INSERT INTO Course (courseNo, cTitle, coach) VALUES (9,'Computer','Mark');
INSERT INTO Course (courseNo, cTitle, coach) VALUES (10,'Origami','Rachel');

-- Table 5- Staff
INSERT INTO Staff (staffid, fname, lname, addr, position) VALUES (201, 'Gavin', 'Conor', 'B 201', 'Manager');
INSERT INTO Staff (staffid, fname, lname, addr, position) VALUES (202, 'Brendan', 'Murphy', 'A 101', 'Accountant');
INSERT INTO Staff (staffid, fname, lname, addr, position) VALUES (203, 'Gerry', 'Bowen', 'A 102','Security');
INSERT INTO Staff (staffid, fname, lname, addr, position) VALUES (204, 'Fiona','Blake','C 103','Doctor');
INSERT INTO Staff (staffid, fname, lname, addr, position) VALUES (205, 'Gareth','Burke','C 101','Admin');
INSERT INTO Staff (staffid, fname, lname, addr, position) VALUES (206, 'Neil', 'Green','B 202','Cook');
INSERT INTO Staff (staffid, fname, lname, addr, position) VALUES (207, 'Mark', 'Simpson', 'B 203', 'Manager');
INSERT INTO Staff (staffid, fname, lname, addr, position) VALUES (208, 'Ashley', 'Spencer', 'C 104','Gardener');
INSERT INTO Staff (staffid, fname, lname, addr, position) VALUES (209, 'Ramnik', 'Singh','A 103','Security');
INSERT INTO Staff (staffid, fname, lname, addr, position) VALUES (210, 'Eric', 'Shups', 'C 102','Cook');

-- Table 6- Lease
INSERT INTO Lease (leaseNo, length, studentNo, roomNo, checkin, checkout) VALUES (1,30,100,11,'01-Sep-14','01-Oct-14');
INSERT INTO Lease (leaseNo, length, studentNo, roomNo, checkin, checkout) VALUES (2,60,101,21,'01-Sep-14','01-Nov-14');
INSERT INTO Lease (leaseNo, length, studentNo, roomNo, checkin, checkout) VALUES (3,30,102,31,'01-Jan-15','01-Feb-15');
INSERT INTO Lease (leaseNo, length, studentNo, roomNo, checkin, checkout) VALUES (4,60,103,12,'01-Jan-15','01-Mar-15');
INSERT INTO Lease (leaseNo, length, studentNo, roomNo, checkin, checkout) VALUES (5,90,104,22,'01-Sep-14','01-Dec-14');
INSERT INTO Lease (leaseNo, length, studentNo, roomNo, checkin, checkout) VALUES (6,90,105,23,'01-Sep-14','01-Dec-14');
INSERT INTO Lease (leaseNo, length, studentNo, roomNo, checkin, checkout) VALUES (7,90,106,13,'01-Sep-14','01-Dec-14');
INSERT INTO Lease (leaseNo, length, studentNo, roomNo, checkin, checkout) VALUES (8,120,107,32,'01-Jan-15','01-May-15');
INSERT INTO Lease (leaseNo, length, studentNo, roomNo, checkin, checkout) VALUES (9,30,108,33,'01-Sep-14','01-Oct-14');
INSERT INTO Lease (leaseNo, length, studentNo, roomNo, checkin, checkout) VALUES (10,30,109,24,'01-Mar-14','01-Apr-14');

-- Table 7- Invoice
INSERT INTO Invoice (invNo, payment,payment_date,payment_type,leaseNo) VALUES (141,600,'01-Oct-14','Cash',1);
INSERT INTO Invoice (invNo, payment,payment_date,payment_type,leaseNo) VALUES (142,1000,'01-Nov-14','Cheque',2);
INSERT INTO Invoice (invNo, payment,payment_date,payment_type,leaseNo) VALUES (143,1250,'01-Feb-15','Cash',3);
INSERT INTO Invoice (invNo, payment,payment_date,payment_type,leaseNo) VALUES (144,1200,'01-Mar-15','Card',4);
INSERT INTO Invoice (invNo, payment,payment_date,payment_type,leaseNo) VALUES (145,1500,'01-Dec-14','Cash',5);
INSERT INTO Invoice (invNo, payment,payment_date,payment_type,leaseNo) VALUES (146,1500,'01-Dec-14','Card',6);
INSERT INTO Invoice (invNo, payment,payment_date,payment_type,leaseNo) VALUES (147,1800,'01-Dec-14','Card',7);
INSERT INTO Invoice (invNo, payment,payment_date,payment_type,leaseNo) VALUES (148,1800,'01-May-15','Cheque',8);
INSERT INTO Invoice (invNo, payment,payment_date,payment_type,leaseNo) VALUES (149,450,'01-Oct-14','Cheque',9);
INSERT INTO Invoice (invNo, payment,payment_date,payment_type,leaseNo) VALUES (150,500,'01-Apr-14','Cash',10);

-- Table 8- Inspection
INSERT INTO Inspection (flatNo, date_of_insp, remarks, staffid) VALUES (1,'15-Oct-14','Clean','201');
INSERT INTO Inspection (flatNo, date_of_insp, remarks, staffid) VALUES (2,'15-Oct-14','Dirty','201');
INSERT INTO Inspection (flatNo, date_of_insp, remarks, staffid) VALUES (3,'15-Apr-15','Smelly','205');
INSERT INTO Inspection (flatNo, date_of_insp, remarks, staffid) VALUES (4,'15-Oct-14','Wash','205');
INSERT INTO Inspection (flatNo, date_of_insp, remarks, staffid) VALUES (5,'15-Oct-14','Dirty','201');
INSERT INTO Inspection (flatNo, date_of_insp, remarks, staffid) VALUES (6,'01-Oct-14','Clean','207');
INSERT INTO Inspection (flatNo, date_of_insp, remarks, staffid) VALUES (7,'25-Oct-14','Clean','201');
INSERT INTO Inspection (flatNo, date_of_insp, remarks, staffid) VALUES (8,'15-Apr-15','Smelly','205');
INSERT INTO Inspection (flatNo, date_of_insp, remarks, staffid) VALUES (9,'05-Mar-15','Clean','207');
INSERT INTO Inspection (flatNo, date_of_insp, remarks, staffid) VALUES (10,'15-Oct-14','Wash','207');

--Table 9- Service
INSERT INTO Service (serviceNo, staffid) VALUES (301,201);
INSERT INTO Service (serviceNo, staffid) VALUES (302,201);
INSERT INTO Service (serviceNo, staffid) VALUES (303,205);
INSERT INTO Service (serviceNo, staffid) VALUES (304,207);
INSERT INTO Service (serviceNo, staffid) VALUES (305,201);
INSERT INTO Service (serviceNo, staffid) VALUES (306,201);
INSERT INTO Service (serviceNo, staffid) VALUES (307,205);
INSERT INTO Service (serviceNo, staffid) VALUES (308,207);
INSERT INTO Service (serviceNo, staffid) VALUES (309,205);
INSERT INTO Service (serviceNo, staffid) VALUES (310,207);

-- Table 10- Guardian
INSERT INTO Guardian (studentNo, name,gaddr,tel_no) VALUES (100, 'Teddy','2, Roebuck Castle', '0860371353');
INSERT INTO Guardian (studentNo, name,gaddr,tel_no) VALUES (101,'Peter','28, St Patricks Park','01234532');
INSERT INTO Guardian (studentNo, name,gaddr,tel_no) VALUES (102,'John','24, Stradbrook Park','014324634');
INSERT INTO Guardian (studentNo, name,gaddr,tel_no) VALUES (103,'Fiona','34,Fosters Av','01343434');
INSERT INTO Guardian (studentNo, name,gaddr,tel_no) VALUES (104, 'James', '43, Georges Street','083023423');
INSERT INTO Guardian (studentNo, name,gaddr,tel_no) VALUES (105,'Gerald','21, Avoca Avenue','0870342123');
INSERT INTO Guardian (studentNo, name,gaddr,tel_no) VALUES (106,'Hazel','28, St Patricks Park','0860123213');
INSERT INTO Guardian (studentNo, name,gaddr,tel_no) VALUES (107,'Brendan','2, The Gallops', '012432311');
INSERT INTO Guardian (studentNo, name,gaddr,tel_no) VALUES (108,'Oonagh','23, Delgany Cottages','02422424');
INSERT INTO Guardian (studentNo, name,gaddr,tel_no) VALUES (109,'Emma','12, Diagonal Alley','0234241');
INSERT INTO Guardian (studentNo, name,gaddr,tel_no) VALUES (110,'Rupert','45, Leaky Cauldron','01345214');

-- Setup phase complete!


-----------------------------------------------------------------------------
-- Inner Joins
/* Query 1
Displaying student details alongwith respective guardian
*/
SELECT s.fname, s.lname, g.name,g.tel_no FROM STUDENT s JOIN Guardian g
ON s.studentNo= g.studentNo;
-- since the column names were similar
-- aliases have been used

/*Query 2
Display list of lease details with invoice associated with it, payment amount and payment type
*/
SELECT l.leaseNo, l.studentNo, i.payment, i.payment_type
FROM Lease l JOIN Invoice i
-- since the column names were similar
-- aliases have been used
ON l.leaseNo= i.leaseNo;

/*Query 3
Display inspection details, like flat and remarks alongwith staff associated with it
*/
SELECT i.flatNo, i.remarks, s.fname,s.position
FROM Inspection i JOIN Staff s
-- since the column names were similar
-- aliases have been used
ON i.staffid= s.staffid;

/*Query 4
List the rooms and its rent along with flat associated with them and its address
*/
SELECT r.roomNo,r.rent, f.flatNo,f.faddr
FROM Room r JOIN Flat f
-- since the column names were similar
-- aliases have been used
ON r.flatNo= f.flatNo;

-- Outer Joins
-- Left Outer Joins

/* Query 1
List the flat number and remarks given by respective staff members
who inspected the flat.
*/ 
SELECT s.fname,s.position,i.flatNo, i.remarks
FROM Inspection i LEFT OUTER JOIN Staff s
ON i.staffid= s.staffid;
-- displays more values on left

/* Query 2
List the staff who are assigned a service schedule, also with position and service id
*/
SELECT s.staffid, s.fName, s.lName, se.serviceNo
FROM Staff s LEFT OUTER JOIN Service se
ON s.staffid= se.staffid;

-- Right outer join
/*Query 1
List the details of the rooms in the respective flat with address
*/
SELECT r.roomNo, r.rent, f.flatNo, f.faddr
FROM Room r RIGHT OUTER JOIN Flat f
ON r.flatNo= f.flatNo;

/*Query 2
List the services performed by the staff members
Include the name and position of the staff
*/
SELECT se.serviceNo, s.fname, s.lname, s.position
FROM Service se RIGHT OUTER JOIN Staff s
-- reports the staffids from both tables
ON se.staffid= s.staffid;

-- Full Outer Joins
/*
Query 1
List the details of the rooms in the respective flat with address
Also, lists the flat whose room details are not taken
*/
SELECT r.roomNo, r.rent, f.flatNo, f.faddr
FROM Room r FULL OUTER JOIN Flat f
ON r.flatNo= f.flatNo;

/*
Query 2
Display the details of the lease (length and student no) along with the 
room associated with that lease
*/
SELECT l.leaseNo,l.length, l.studentNo, r.roomNo, r.rent
FROM Lease l FULL OUTER JOIN Room r
ON l.roomNo= r.roomNo;


/* CUBE
Display the rent collected from individual flat
Calculate the rent collection and group by flat, then its respective room, if given.
*/
SELECT f.flatNo, r.roomNo, SUM(r.rent*f.no_of_rooms)
FROM Flat f JOIN Room r 
ON f.flatNo= r.flatNo
GROUP BY CUBE (f.flatNo, r.roomNo);
-- lists in order of flat, then rooms in it.

/* SUBQUERIES
Query 1-
Find the payment method that was was used for maximum payment by a student
*/
SELECT payment_type, payment FROM Invoice WHERE
payment= (SELECT MAX(payment) FROM Invoice);

/* Query 2-
Find out the student number for whom the lease was let for the longest period
*/
SELECT studentNo, roomNo FROM Lease WHERE
length= (SELECT MAX(length) FROM Lease); 

/* Query 3-
Find out the flat number that has lowest rent among other rooms
*/
SELECT flatNo, rent FROM Room WHERE 
rent= (SELECT MIN(rent) FROM Room);

/* Query 4-
Find out the flat no and address of the flat that has minimum number of rooms
*/
SELECT flatNo,faddr FROM Flat WHERE
no_of_rooms= (SELECT MAX(no_of_rooms) FROM Flat);

CREATE OR REPLACE PACKAGE Rosemont1 AS
-- creating a package for 5 procedures
	PROCEDURE proc1;
	PROCEDURE proc2;
	PROCEDURE proc3;
	PROCEDURE proc4;
	PROCEDURE proc5;
END;
/

SET AUTOCOMMIT OFF;
-- To demonstrate the rollback function
-- Creating new rows in Room table and rolling back to savepoint

CREATE OR REPLACE PACKAGE BODY Rosemont1 AS
PROCEDURE proc1 
-- Creating new rows in Room table and rolling back to savepoint
IS
BEGIN
INSERT INTO Room (roomNo, rent, flatNo) VALUES (34, 450, 2);
INSERT INTO Room (roomNo, rent, flatNo) VALUES (14, 600, 5);
SAVEPOINT sp1;
--savepoint created
INSERT INTO Room (roomNo, rent, flatNo) VALUES (15, 600, 8);
ROLLBACK TO sp1;
-- rolling back to savepoint
END proc1;
-- procedure 1 ends

-- Cursor to check whether the room rent is greater than 500, 
-- raises an exception in case
PROCEDURE proc2
IS
BEGIN
DECLARE
	CURSOR curs1
	IS SELECT * FROM Room; 
	
	v_room_row curs1%ROWTYPE; 
	-- defining type of cursor 
	RENT_EXP EXCEPTION; 
	-- declaring variable for exception
	BEGIN 
		
		OPEN curs1; 
		-- initialising cursor
		FETCH curs1 INTO v_room_row; 
		-- fetching data from the table row wise
		WHILE curs1%FOUND LOOP 
			
			IF v_room_row.rent < 600 THEN 
			-- condition 1, if rent is greater than 600
				RAISE_APPLICATION_ERROR(-30453, 'Rent for' || v_room_row.roomNo || ' is less than 600'); 				
			-- it raises an exception to the screen
			ELSIF v_room_row.rent > 500 THEN
				-- if the rent exceeds 500
				RAISE RENT_EXP; 		
				-- another exception is raised
			END IF; 
				
			FETCH curs1 INTO v_room_row;
			-- cursor is bought to the next location
		END LOOP; 
		-- end of while loop
	CLOSE curs1; 
		-- cursor is exited
	EXCEPTION 
	
		WHEN RENT_EXP THEN 
		  -- throwing an exception
			DBMS_OUTPUT.PUT_LINE('Rent is greater than 500' || v_room_row.roomNo);
			-- complementing with a statement
			RAISE; 
END;
-- end cursor
END proc2;
-- procedure ends


-- Using a try/ catch expression, creating a savepoint
-- Deliberate creating an error scenario
PROCEDURE proc3
IS
BEGIN
BEGIN TRY
	BEGIN TRANSACTION
	SAVEPOINT sp2;
	INSERT INTO Flat (flatNo, faddr, no_of_rooms) VALUES (11, '2, Mount Merrion',5);
	INSERT INTO Flat (flatNo, faddr, no_of_rooms) VALUES (12, '5, Mount Merrion',4);
	INSERT INTO Flat (flatNo, faddr, no_of_rooms) VALUES (12, '5, Mount Merrion',4);
	-- repeating the primary key, to add exception
		COMMIT TRANSACTION;
END TRY;

BEGIN CATCH
	ROLLBACK TO sp2;
	-- rolling back to savepoint
	RAISE_APPLICATION_ERROR(-34545, 'FlatNo already exists');
END CATCH;
END proc3;

PROCEDURE proc4
IS
BEGIN
INSERT INTO Service (serviceNo, staffid) VALUES(311, 202);
INSERT INTO Service (serviceNo, staffid) VALUES(312, 203);
SAVEPOINT sp1;
--savepoint create
INSERT INTO Service (serviceNo, staffid) VALUES(311, 207);
-- putting ambigous values to the serviceNo
-- which is a primary key
ROLLBACK TO sp1;

END proc4;


-- Creating a 
PROCEDURE proc5
IS
BEGIN
SAVEPOINT sp5;
--savepoint created
INSERT INTO Staff (staffid, fname, lname, addr, position) VALUES (211, 'Rich', 'Beg', 'C 105','Cook');
INSERT INTO Staff (staffid, fname, lname, addr, position) VALUES (213, 'Gerry', 'James', 'C 106','Security');
-- putting ambigous values to the serviceNo
INSERT INTO Staff (staffid, fname, lname, addr, position) VALUES (205, 'Rich', 'Beg', 'C 105','Cook');
-- which is a primary key
ROLLBACK TO sp5;

END proc5;

END;
--package body ends

/

-- Function that deliberately checks for wrong value in Staff table
CREATE OR REPLACE FUNCTION Func1
RETURN VARCHAR2
IS
DECLARE 
	staff1 Staff%ROWTYPE;
	-- initialising variable from table 
BEGIN
	SELECT * INTO staff1 FROM Staff WHERE lname='Potter';
	-- deliberate error case by using new lname value
EXCEPTION
	WHEN NO_DATA_FOUND THEN
	-- error when no data is found
		DBMS_OUTPUT.PUT_LINE('No records for this name');
	RETURN NULL;
END Func1;
/

-- A function that returns the number of students
-- who require special needs
CREATE OR REPLACE FUNCTION Func2(studentNo NUMBER)
RETURN NUMBER
IS 
BEGIN
	RETURN COUNT (*) FROM STUDENT WHERE STUDENT.spl_req IS NOT NULL;
END Func2;
/


-- TRIGGERS
-- Create trigger that shows a staff cannot handle more than
-- 6 flats for inspection

CREATE TRIGGER StaffNotHandling
BEFORE INSERT OR UPDATE ON Inspection
FOR EACH ROW
DECLARE
vCount NUMBER;
BEGIN
	SELECT COUNT(*) INTO vCount
	FROM Inspection
	WHERE staffid=: new.staffid;
	IF vCount =10
	-- condition raised on staff
	raise_application_error(-20000,'Staff' || :new.staffid ||'already inspected 6 flats');
	END IF;
END;
/

-- Creating an After TRIGGER for table lease
CREATE TRIGGER leaselen
AFTER UPDATE OF length ON Lease
-- creating an after trigger on length column of lease` table
FOR EACH ROW WHEN (new.length>60)
--when leangth exceeds 60
DECLARE 
	leaseNo NUMBER := :old.leaseNo;
	-- taking values into leaseNo
BEGIN 
	DBMS_OUTPUT.PUT_LINE('Lease No->' || leaseNo || 'Length' || :new.length);
	-- display the lease no and length acc. to condition
END;
/
-- Checking trigger
UPDATE Lease SET length = 60
WHERE leaseNo = 3;
-- updating records
UPDATE Lease SET length = 90
WHERE leaseNo = 3;
-- updating same records with different length
SELECT * FROM Lease;


-- Creating a BEFORE TRIGGER to check the gaurdian is related to one student only
CREATE TRIGGER GuardianChk
BEFORE INSERT OR UPDATE ON Guardian
FOR EACH ROW
DECLARE
vCount NUMBER;
BEGIN
	SELECT COUNT(*) INTO vCount
	FROM Guardian
	WHERE studentNo=: new.studentNo;
	IF vCount =1
	raise_application_error(-20000,'Student' || :new.staffid ||'already has one guardian');
	END IF;
END;
/


/*
REFERENCES
1.Database Administration, Oracle Database Online Documentation 11g Release 2 (11.2) 
2.Oracle Data Types, http://docs.oracle.com/cd/B28359_01/server.111/b28318/datatype.htm#CNCPT413
3.Database Systems, A practical Approach to design, Implementation, and Management, Connolly T., Begg C., pp. 255- 267
*/