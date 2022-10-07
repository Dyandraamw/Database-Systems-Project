/*1.	Display StudentName, StudentAddress, BorrowTransactionID, BorrowTransactionDate, and number of books borrowed (obtained from the total number of books borrowed) for every borrow transaction happened in 2020 by student whose address ends with ‘ Street’.*/

SELECT StudentName, StudentAddress, BorrowID, BorrowDate, ReturnDate
FROM MsStudent, BorrowTransaction
WHERE YEAR(BorrowDate) = 2020 AND
StudentAddress LIKE '%Street';

--2. Display BookTitle, Publish Month (obtained from the month of the book publish date), BookCategoryName, and 
--Total Sum Donation (obtained from the total donation quantity) for each book whose category name contains ‘y’ and 
--published in an odd month. 

SELECT 
BookTitle, 
MONTH(PublishDate) AS [Publish Month], 
CategoryName,
SUM(dd.Qty) AS [Total Sum Donation]

FROM
MsBookCategory as mbc
 JOIN MsBook as mb
  ON mbc.CategoryID = mb.CategoryID
  JOIN DonationDetails dd ON dd.BookID = mb.BookID
WHERE
mbc.CategoryName like '%y%' and MONTH(PublishDate) % 2 = 0
GROUP BY mb.BookTitle, mb.PublishDate, mbc.CategoryName;



--3. Display BorrowTransactionID, Borrow Transaction Date (obtained from BorrowTransactionDate with ‘dd mon yyyy’ format), 
--StudentName, Books Borrowed (obtained from the total number of borrowed books), and 
--Average Book Rating (obtained from the average rating of borrowed books) for every borrow transaction 
--whose student has ‘gmail’ domain email and Average Book Rating more than 4.0. 

SELECT 
bt.BorrowID AS [BorrowTransactionID], 
BorrowDate AS [Borrow Transaction Date], 
StudentName, 
SUM(BookStock) AS [Books Borrowed],
AVG(BookRating) AS [Average Book Rating] 

FROM
MsBook AS ms
 JOIN BorrowDetails AS bd
  ON ms.BookID = bd.BookID
 JOIN BorrowTransaction AS bt
  ON bd.BorrowID = bt.BorrowID
 JOIN MsStudent as mstud
  ON bt.StudentID = mstud.StudentID
  WHERE mstud.StudentEmail LIKE '%gmail%' AND
  ms.BookRating > 4.0
  GROUP BY bt.BorrowID, bt.BorrowDate, mstud.StudentName;

  /*4.	Display DonatorName (obtained from DonatorName and started with ‘Ms.’), DonationDate (obtained from DonationDate with ‘Mon dd, yyyy’ format), Books Donated (obtained from the number of donated books), and Average Rating (obtained from the average rating of the donated books) for each donation happened in the first two weeks (inclusively between the 1st and the 14th day) from a female donator. */

select concat('Ms.',DonatorName) as DonatorName,convert(varchar,DonationDate,107) as DonationDate, qty as BookDonated
from DonationTransaction dt JOIN MsDonator md on dt.DonatorID=md.DonatorID join DonationDetails dts on dt.DonationID=dts.DonationID
where  DonatorGender like 'Female' and day(DonationDate) between 1 and 14 

/*5.	Display DonatorName, DonationDate, StaffName, StaffGender, and StaffSalary (obtained from StaffSalary and started with ‘Rp.’) for every donation completed by staff whose salary is more than the average staff salary and its donator name consists of minimum two words. Sort the result by DonationDate in descending order.
(alias subquery)
*/

select DonatorName, DonationDate, StaffName, StaffGender, concat('Rp. ', cast(StaffSalary as varchar) )as StaffSalary
from DonationTransaction dt join MsDonator md on dt.DonatorID=md.DonatorID
	join MsStaff ms on dt.StaffID=ms.StaffID
where StaffSalary > (select avg(StaffSalary) from MsStaff ) and DonatorName not like '% % %'
order by DonationDate DESC


/*6.	Display DonationID, BookTitle (obtained from removing all white spaces from BookTitle), Rating Percentage (obtained from multiplying the BookRating with 20 and added with ‘%’ at the end), Quantity, and DonatorPhone for each donation with book rating more than the average rating and DonatorAddress consists of more than 15 characters. 
(alias subquery)
*/

select dd.DonationID, 
[BookTitle] = TRIM(' ' from BookTitle), 
[Rating Percentage] = cast(BookRating*20 as varchar) + '%',
qty,
DonatorPhone
from MsDonator md, DonationTransaction dt, DonationDetails dd, MsBook mb,
(select avg(BookRating) as [avgBookRate] from MsBook) as [avg_rate]
where md.DonatorID = dt.DonatorID and dt.DonationID = dd.DonationID and dd.BookID = mb.BookID and mb.BookRating > avg_rate.avgBookRate and len(md.DonatorAddress) > 15;

/*7.Display BorrowTransactionID, 
Borrow Date (obtained from BorrowTransactionDate in ‘mm-dd-yyyy’ format), 
Return Day (obtained from the day name of the return date), 
BookTitle, 
BookRating (obtained from BookRating followed by ‘ star(s)’), and 
BookCategoryName 
for each borrow transaction which contains book(s) whose rating is equal to the minimum rating or the maximum rating of all available books while also have more than 10 stocks. Sort the result based on the BorrowTransactionID in descending order.
(alias subquery)
*/

SELECT
	BT.BorrowID AS BorrowTransactionID,
	CONVERT(VARCHAR,BT.BorrowDate,110) AS [Borrow Date],
	DATENAME(day, BT.ReturnDate) AS [Return Day],
	MB.BookTitle,
	[BookRating]= CAST(MB.BookRating AS varchar) + ' star(s)',
	MBC.CategoryName AS BookCategoryName
FROM BorrowTransaction bt
JOIN BorrowDetails bd
ON bt.BorrowID = bd.BorrowID
JOIN MsBook mb
ON bd.BookID = mb.BookID
JOIN MsBookCategory mbc
ON mb.CategoryID = mbc.CategoryID,
(SELECT MIN(BookRating) AS [Minimum],MAX(BookRating) AS [Maximum] FROM MsBook) AS MaxMin
WHERE BookStock > 10 AND (BookRating = MaxMin.Minimum OR BookRating = MaxMin.Maximum)
ORDER BY BT.BorrowID DESC;



/*8.Display StudentName (obtained from StudentName added with ‘Mr. ’ at the beginning), 
StudentEmail (obtained by removing ‘.com’ from StudentEmail), 
Books Borrowed (obtained from the total number of books borrowed) 
for each borrow transaction done by male student and served by staff whose salary is more than the average staff salary. 
Then, combine it with 
StudentName (obtained from StudentName added with ‘Ms. ’ at the beginning), 
StudentEmail (obtained by removing ‘.com’ from StudentEmail), 
Books Borrowed (obtained from the total number of books borrowed) 
for each borrow transaction done by female student and served by staff whose salary is less than the average staff salary.
(alias subquery)
*/

SELECT
	CASE WHEN StudentGender LIKE 'Male' THEN 'Mr. '+StudentName
	ELSE 'Ms. '+StudentName
	END AS StudentName ,
	SUBSTRING(StudentEmail,0,LEN(StudentEmail)-3) AS StudentEmail,
	COUNT(BT.StudentID) AS [Books Borrowed]
FROM MsStudent MT
JOIN BorrowTransaction BT 
ON BT.StudentID = MT.StudentID
JOIN MsStaff MF
ON BT.StaffID = MF.StaffID, (SELECT AVG(StaffSalary) AS [AveragePrice] FROM MsStaff) AS SalaryMore
WHERE StaffSalary > SalaryMore.AveragePrice
GROUP BY StudentGender,StudentName,StudentEmail,BT.StudentID


/*9.Create a view named ‘ViewDonationDetail’ to display 
DonatorName, 
Donation Transaction (obtained from the number of donation transaction), 
Average Quantity (obtained from the average donation quantity) 
for each donation done by donator whose address ended with ‘ Street’ or ‘ Avenue’ and Donation Transaction more than 1.*/

CREATE VIEW ViewDonationDetail
AS SELECT MD.DonatorName,
	Count(DT.DonatorID) AS [Donation Transaction],
	[Average Quantity] = AVG(DD.qty)
FROM  DonationTransaction DT 
JOIN DonationDetails DD
ON DT.DonationID = DD.DonationID
JOIN MsDonator MD
ON MD.DonatorID = DT.DonatorID
GROUP BY MD.DonatorName,DT.DonatorID,MD.DonatorAddress
HAVING (DonatorAddress LIKE '% Street' OR DonatorAddress LIKE '% Avenue') AND Count(DT.DonatorID) > 1

SELECT * FROM ViewDonationDetail

/*10.	Create a view named ‘ViewStudentBorrowingData’ to display StudentName, Borrow Transaction (obtained from the total number of transaction), and Average Duration (obtained from the average different days between the borrow date and return date) for each borrow transaction done by male student whose email contains ‘yahoo’
*/

SELECT * FROM MsStudent

CREATE VIEW [ViewStudentBorrowingData]
AS
SELECT ms.StudentName,
[Borrow Transaction] = COUNT(bt.BorrowID),
[Average Transaction] = AVG(DATEDIFF(DAY, bt.BorrowDate, bt.ReturnDate))
FROM MsStudent ms
JOIN BorrowTransaction bt ON ms.StudentID = bt.StudentID
WHERE ms.StudentGender = 'Male' AND
ms.StudentEmail LIKE '%yahoo%'
GROUP BY ms.StudentName;

SELECT *
FROM BorrowTransaction

SELECT *
FROM ViewStudentBorrowingData

DROP VIEW [ViewStudentBorrowingData]


