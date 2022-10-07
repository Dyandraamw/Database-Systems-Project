CREATE DATABASE BluejackLibrary
USE BluejackLibrary

BEGIN TRAN
CREATE TABLE MsStudent(
	StudentID CHAR(5) PRIMARY KEY,
	StudentName VARCHAR(225) NOT NULL,
	StudentAddress VARCHAR(225) NOT NULL,
	StudentGender VARCHAR(10) NOT NULL,
	StudentEmail VARCHAR(225) NOT NULL,
	CONSTRAINT StudentIDChecker  CHECK(StudentID LIKE 'ST[0-9][0-9][0-9]'),
	CONSTRAINT StudentGenderChecker CHECK (StudentGender IN ('Male','Female')),
	CONSTRAINT StudentEmailChecker CHECK(StudentEmail LIKE '%@%')
)

CREATE TABLE MsStaff(
	StaffID CHAR(5) PRIMARY KEY,
	StaffName VARCHAR(225) NOT NULL,
	StaffGender VARCHAR(10) NOT NULL,
	StaffAddress VARCHAR(225) NOT NULL,
	StaffPhone VARCHAR(15) NOT NULL,
	StaffSalary INT NOT NULL,
	CONSTRAINT StaffIDChecker CHECK(StaffID LIKE 'SF[0-9][0-9][0-9]'),
	CONSTRAINT StaffPhoneChecker CHECK(StaffPhone LIKE '+62%')
)

CREATE TABLE MsBookCategory (
	CategoryID CHAR(5) PRIMARY KEY,
	CategoryName VARCHAR(25) NOT NULL,
	CONSTRAINT CategoryIDChecker  CHECK(CategoryID like 'BC[0-9][0-9][0-9]')
)

CREATE TABLE MsBook(
	BookID CHAR(5) PRIMARY KEY ,
	BookTitle VARCHAR(225) NOT NULL,
	PublishDate DATE NOT NULL,
	BookStock INT NOT NULL,
	BookRating INT NOT NULL,
	CategoryID CHAR (5) FOREIGN KEY REFERENCES MsBookCategory(CategoryID) on UPDATE CASCADE on DELETE CASCADE,
	CONSTRAINT BookIDChecker CHECK(BookID like 'BK[0-9][0-9][0-9]'),
	CONSTRAINT PublishDateChecker CHECK(YEAR(PublishDate) >2011)
)

CREATE TABLE MsDonator(
	DonatorID CHAR (5) PRIMARY KEY,
	DonatorName VARCHAR(225) NOT NULL,
	DonatorGender VARCHAR(10) NOT NULL,
	DonatorAddress VARCHAR(225) NOT NULL,
	DonatorPhone VARCHAR(30) NOT NULL,
	CONSTRAINT DonatorIDChecker CHECK(DonatorID LIKE 'DR[0-9][0-9][0-9]'),
	CONSTRAINT DonatorNameChecker CHECK(DonatorName LIKE '__%')
)

CREATE TABLE BorrowTransaction(
	BorrowID CHAR(5) PRIMARY KEY,
	ReturnDate DATE NOT NULL,
	BorrowDate DATE NOT NULL,
	StudentID CHAR(5) FOREIGN KEY REFERENCES MsStudent on UPDATE CASCADE on DELETE CASCADE,
	StaffID CHAR(5) FOREIGN KEY REFERENCES MsStaff(StaffID) on UPDATE CASCADE on DELETE CASCADE,
	CONSTRAINT BorrowIDChecker CHECK(BorrowID LIKE 'BT[0-9][0-9][0-9]'),
	CONSTRAINT ReturnDateChecker CHECK(DATEDIFF(Day, ReturnDate, GETDATE()) > 0)
)

CREATE TABLE BorrowDetails(
	BorrowID CHAR(5) NOT NULL FOREIGN KEY REFERENCES BorrowTransaction(BorrowID) on UPDATE CASCADE on DELETE CASCADE,
	BookID CHAR(5) NOT NULL FOREIGN KEY REFERENCES MsBook(BookID) on UPDATE CASCADE on DELETE CASCADE,
	CONSTRAINT PK_BorrowDetails PRIMARY KEY(BorrowID)
)

CREATE TABLE DonationTransaction(
	DonationID CHAR(5) PRIMARY KEY,
	StaffID CHAR(5) FOREIGN KEY REFERENCES MsStaff(StaffID) on UPDATE CASCADE on DELETE CASCADE,
	DonatorID CHAR(5) FOREIGN KEY REFERENCES MsDonator(DonatorID) on UPDATE CASCADE on DELETE CASCADE,
	DonationDate DATE
)

CREATE TABLE DonationDetails(
	DonationID CHAR(5) FOREIGN KEY REFERENCES DonationTransaction(DonationID) on UPDATE CASCADE on DELETE CASCADE,
	Qty INT NOT NULL,
	BookID CHAR(5) FOREIGN KEY REFERENCES MsBook(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT QtyChecker CHECK(Qty >= 10 AND Qty <=500),
	CONSTRAINT PK_DonationDetails PRIMARY KEY(DonationID)
)

ROLLBACK
--select *from DonationDetails

--alter table DonationDetails
--alter column BookID char(5) references MsBook(BookID) on update cascade on delete cascade

--alter table DonationDetails
--drop column BookID

--drop table DonationDetails