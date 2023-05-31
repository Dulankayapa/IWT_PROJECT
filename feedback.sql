







CREATE TABLE Feedback
(
	FeedbackID  int not null AUTO_INCREMENT,
	Applicant_ID varchar(20) not null,
	Feedback_Date datetime not null,
	Rating float not null,
	Comment varchar(250) not null,
    primary key (FeedbackID)
);

