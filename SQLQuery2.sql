/*Table Registered Applicant*/
CREATE TABLE Registered_Applicant_
(
	Applicant_ID  varchar(20) not null,
	F_name varchar(50) not null,
	L_name varchar(50) not null,
	House_no varchar(30) not null,
	Street varchar(30) not null,
	Postal_code varchar(15) not null,
	City varchar(15) not null,
	Country varchar(15) not null,
	Gender varchar(15) not null,
	Password varchar(30) not null,
	DOB date not null,
	Email varchar(50) CHECK (Email LIKE '%_@_%._%')not null,
	

	CONSTRAINT REG_APPLICANT_PK PRIMARY KEY(Applicant_ID)

);

/*Table Registered Applicant Phone_no */
CREATE TABLE Registered_applicant_phone_no

(	
	PID varchar(20) not null,
	Applicant_ID varchar(20) not null,
	Phone_no decimal(10,0)not null,

	CONSTRAINT REG_APPLICANT_PHONE_PK PRIMARY KEY (PID),
	CONSTRAINT REG_APPLICANT_PHONE_FK FOREIGN KEY (Applicant_ID) References Registered_Applicant_(Applicant_ID)

);

/*Table Request*/
CREATE TABLE Request
(
	Request_ID varchar(20) not null,
	Applicant_ID varchar(20) not null,
	Request_date date not null,
	Verification_status varchar(20) not null,

	CONSTRAINT REQUEST_PK PRIMARY KEY (Request_ID),
	CONSTRAINT REQUEST_FK FOREIGN KEY (Applicant_ID) References Registered_Applicant_(Applicant_ID)
	
);

/*Table Document*/
CREATE TABLE Document
(
	Document_ID varchar(20) not null,
	Request_ID varchar(20) not null,
	Document_type varchar(30) not null,
	Reference_ID varchar(20),
	Issuing_Date date not null,

	CONSTRAINT DOCUMENT_PK PRIMARY KEY (Document_ID),
	CONSTRAINT DOCUMENT_FK FOREIGN KEY (Request_ID) References Request(Request_ID)
);

/*Table Payment*/
CREATE TABLE Payment
(
	Payment_ID varchar(20) not null,
	Request_ID varchar(20) not null,
	Reference_No varchar(20) not null,
	Payment_Date date not null,
	Amount float not null,
	Payment_method varchar(20) not null,
	Payment_status varchar(20) not null,

	CONSTRAINT PAYMENT_PK PRIMARY KEY (Payment_ID),
	CONSTRAINT PAYMENT_FK FOREIGN KEY (Request_ID) References Request(Request_ID)
);
/*Table Feedback*/
CREATE TABLE Feedback
(
	Feedback_ID varchar(20) not null,
	Applicant_ID varchar(20) not null,
	Feedback_Date date not null,
	Rating float not null,
	Comment varchar(50) not null,

	CONSTRAINT FEEDBACK_PK PRIMARY KEY (Feedback_ID),
	CONSTRAINT FEEDBACK_FK FOREIGN KEY (Applicant_ID) References Registered_Applicant_(Applicant_ID)

);

/*Table ID_Coordinator*/
CREATE TABLE ID_Coordinator
(
	Coordinator_ID varchar(20) not null,
	F_name varchar(50) not null,
	L_name varchar(50) not null,
	Username varchar(30) not null,
	Email varchar(50) CHECK (Email LIKE '%_@_%._%')not null,
	Phone_no decimal(10,0)not null,
	Last_login date not null,
	Coordinator_Password varchar(30) not null,

	CONSTRAINT ID_COORDINATOR_PK PRIMARY KEY (Coordinator_ID),

);

/*Table Result*/
CREATE TABLE Result
(
	Result_ID varchar(20) not null,
	Request_ID varchar(20) not null,
	Verification_date date not null,
	Verification_status varchar(20) not null,
	Verifiedby varchar(20) not null,

	CONSTRAINT RESULT_PK PRIMARY KEY (Result_ID),
	CONSTRAINT RESULT_FK1 FOREIGN KEY (Request_ID) References Request(Request_ID),
	CONSTRAINT RESULT_FK2 FOREIGN KEY (Verifiedby) References ID_Coordinator(Coordinator_ID ),
);

/*Table Admin*/
CREATE TABLE Staff
(
	Staff_ID varchar(30) not null,
	Role varchar(20) not null,
	F_name varchar(50) not null,
	L_name varchar(50) not null,
	Username varchar(30) not null,
	Password varchar(30) not null,
	Email varchar(50) CHECK (Email LIKE '%_@_%._%')not null,
	Phone_no decimal(10,0)not null,

	CONSTRAINT ADMINISTRATOR_PK PRIMARY KEY (Staff_ID)

);


/*Table Contact*/ 
CREATE TABLE Contact
(	
	Contact_ID varchar(20) not null,
	Applicant_ID varchar(20) not null,
	Message_subject varchar(20) not null,
	User_Message varchar(50) not null,
	Contact_date date not null,
	Contact_status varchar(20) not null,
	Manageby varchar(30) not null,

	CONSTRAINT Contact_PK PRIMARY KEY (Contact_ID),
	CONSTRAINT Contact_FK1 FOREIGN KEY (Applicant_ID) References Registered_Applicant_(Applicant_ID),
	CONSTRAINT Contact_FK2 FOREIGN KEY (Manageby) References Staff(Staff_ID),
);



/* Add Table Details */


/* Registered_Applicant table details */

INSERT INTO Registered_Applicant_ VALUES ('W0001','Kamal','Jayantha','No.A506/1','Galle road','30020','Ambalangoda','Srilanka','Male','hgaih@321#','1992/05/19','anym@gmail.com');
INSERT INTO Registered_Applicant_ VALUES ('W0002','Amal','Nishantha','No.D656/5','Kottawa road','20056','Kottawa','Srilanka','Male','rtgs@fg','1991/06/15','afes@gmail.com');
INSERT INTO Registered_Applicant_ VALUES ('W0003','Sunil','Perera','No.L456/1','Randenigala road','24550','Randenigala','Srilanka','Male','hjed@1#','1990/04/07','lksr@gmail.com');
INSERT INTO Registered_Applicant_ VALUES ('W0004','Janith','sandeepa','No.A563/3','Gampaha road','30150','Gampaha','Srilanka','Male','hsjgh@1#','1992/11/29','cgsf@gmail.com');
INSERT INTO Registered_Applicant_ VALUES ('W0005','Chanaka','Udeesha','No.C2606/4','Ella road','30560','Ella','Srilanka','Male','fdsv$3#','2002/01/18','rtde@gmail.com');


/*Registered_Applicant_Phone_no table details*/

INSERT INTO Registered_Applicant_Phone_no VALUES('P001','W0001','0714564564');
INSERT INTO Registered_Applicant_Phone_no VALUES('P002','W0002','0771231231');
INSERT INTO Registered_Applicant_Phone_no VALUES('P003','W0002','0745285262');
INSERT INTO Registered_Applicant_Phone_no VALUES('P004','W0003','0745623597');
INSERT INTO Registered_Applicant_Phone_no VALUES('P005','W0003','0704584587');
INSERT INTO Registered_Applicant_Phone_no VALUES('P006','W0004','0764584589');
INSERT INTO Registered_Applicant_Phone_no VALUES('P007','W0004','0773256325');
INSERT INTO Registered_Applicant_Phone_no VALUES('P008','W0005','0724852369');



/*Request table details*/

INSERT INTO Request VALUES ('RQ001','W0001','2023/01/03','Pending');
INSERT INTO Request VALUES ('RQ002','W0002','2023/04/04','In Progress');
INSERT INTO Request VALUES ('RQ003','W0003','2023/04/05','Approved');
INSERT INTO Request VALUES ('RQ004','W0004','2022/12/29','Approved');
INSERT INTO Request VALUES ('RQ005','W0005','2022/11/11','Pending');



/*Document table details*/

INSERT INTO Document VALUES ('D001','RQ001','IDcopy','SLR1244','2023/02/01');
INSERT INTO Document VALUES ('D002','RQ001','Birth certificate','SLR5624','2023/04/03');
INSERT INTO Document VALUES ('D003','RQ002','IDcopy','SLR6544','2023/05/11');
INSERT INTO Document VALUES ('D004','RQ002','Birth certificate','SLR5444','2022/10/01');
INSERT INTO Document VALUES ('D005','RQ003','IDcopy','SLR1865','2023/02/01');
INSERT INTO Document VALUES ('D006','RQ003','Birth certificate','SLR1324','2023/02/01');
INSERT INTO Document VALUES ('D007','RQ004','IDcopy','SLR8956','2023/02/01');
INSERT INTO Document VALUES ('D008','RQ004','Birth certificate','SLR3521','2023/02/01');
INSERT INTO Document VALUES ('D009','RQ004','Birth certificate','SLR2564','2023/02/01');



/*Payment table details*/

INSERT INTO Payment VALUES ('P001','RQ001','T456456','2023/05/01',5000.00,'Credit card','Success');
INSERT INTO Payment VALUES ('P002','RQ002','EA24564','2023/04/13',6000.00,'Bank deposite','Success');
INSERT INTO Payment VALUES ('P003','RQ003','D562447','2022/06/20',5200.00,'Debit card','Success');
INSERT INTO Payment VALUES ('P004','RQ004','T485214','2023/01/21',4500.00,'Credit card','Success');
INSERT INTO Payment VALUES ('P005','RQ005','EA456895','2022/12/09',6000.00,'Bank deposite','Success');



/*Feedback table details*/

INSERT INTO Feedback VALUES ('F0001','W0001','2023/04/02','5.5','Best service');
INSERT INTO Feedback VALUES ('F0002','W0002','2023/05/12','4.5','Average');
INSERT INTO Feedback VALUES ('F0003','W0003','2023/04/22','6.5','Nice');
INSERT INTO Feedback VALUES ('F0004','W0004','2023/04/15','3.0','Bad service');
INSERT INTO Feedback VALUES ('F0005','W0005','2023/03/31','5.0','good service');



/*ID_Coordinator table details*/

INSERT INTO ID_Coordinator VALUES ('CD1245','Tharani','Jayasuriya','th@1232','thara12@gmail.com','07401201235','2023/05/05','asd4#rf1');
INSERT INTO ID_Coordinator VALUES ('CD1234','Dishan','Surendra','spdg@256','dishao@gmail.com','07786524123','2023/05/25','dfrs#561');
INSERT INTO ID_Coordinator VALUES ('CD8624','Shamal','Perera','shamalks53','shanmal45@gmail.com','07789545145','2023/05/18','Dear3#f6');
INSERT INTO ID_Coordinator VALUES ('CD4234','Shashi','Shenaya','Wersde25','werdes45@gmail.com','07451255460','2023/04/29','ahgbs@45#');



/*Result table details*/

INSERT INTO Result VALUES ('RE001','RQ001','2023/01/05','Approved','CD1234');
INSERT INTO Result VALUES ('RE002','RQ002','2023/04/08','In Progress','CD1245');
INSERT INTO Result VALUES ('RE003','RQ003','2023/04/09','In Progress','CD4234');
INSERT INTO Result VALUES ('RE004','RQ004','2023/01/01','Approved','CD8624');
INSERT INTO Result VALUES ('RE005','RQ005','2023/01/02','Approved','CD1234');



/*Staff table details*/

INSERT INTO Staff VALUES ('AD0120','Admin','Harsha','Senarathna','Harsha@123','Har#2311#','harsh123@gmail.com','0741235628');
INSERT INTO Staff VALUES ('AD0121','Admin','Kalani','Gamage','Kalani@rf3','Kalani@34567$','kalanigamage123@gmail.com','0751456230');
INSERT INTO Staff VALUES ('AD0122','Admin','Warsha','Induwari','Warsha@3432','Warsha@3gh@','AdminInduwari23@gmail.com','0777237827');
INSERT INTO Staff VALUES ('ITM0113','It_manager','Nethmina','Jayalath','Jayalath@3e12','Jayalath432#','Njayalth231@gmail.com','0700123145');
INSERT INTO Staff VALUES ('ITM0114','It_manager','Chamin','Kanishka','chamins321','Chamma@31%#','Chamma1245@gmail.com','0748956890');



/*Contact table details*/

INSERT INTO Contact VALUES ('CID001','W0001','payment','Help to get payment','2023/05/06','success','AD0120');
INSERT INTO Contact VALUES ('CID002','W0002','Document','How to submit all forms','2023/05/20','success','ITM0113');
INSERT INTO Contact VALUES ('CID003','W0003','payment','How to pay?','2023/04/29','Not answered','AD0121');
INSERT INTO Contact VALUES ('CID004','W0004','Document','What documents are submitting?','2023/05/11','Not answered','ITM0114');
INSERT INTO Contact VALUES ('CID005','W0005','Payment','How to submit?','2023/05/01','success','AD0122');



