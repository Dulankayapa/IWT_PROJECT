CREATE TABLE Feedback
(
	FeedbackID AUTO_INCREMENT varchar(20) not null ,
	Applicant_ID varchar(20) not null,
	Feedback_Date datetime not null,
	Rating float not null,
	Comment varchar(250) not null,
    primary key (FeedbackID)
);

