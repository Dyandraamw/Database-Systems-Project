BEGIN TRAN
insert into BorrowTransaction (BorrowID, ReturnDate, BorrowDate, StudentID, StaffID)
values
('BT001','2020-07-14','2020-07-07','ST002','SF006'),
('BT002','2020-09-11','2020-08-22','ST001','SF001'),
('BT003','2020-11-06','2020-09-01','ST004','SF009'),
('BT004','2020-09-13','2020-09-12','ST013','SF010'),
('BT005','2020-10-21','2020-10-11','ST002','SF011'),
('BT006','2020-12-25','2020-11-10','ST016','SF003'),
('BT007','2020-12-31','2020-11-28','ST010','SF009'),
('BT008','2021-01-01','2020-12-27','ST009','SF008'),
('BT009','2021-02-01','2020-12-29','ST005','SF008'),
('BT010','2021-01-25','2020-12-30','ST004','SF007'),
('BT011','2021-01-30','2020-12-31','ST015','SF004'),
('BT012','2021-02-28','2021-01-14','ST003','SF005'),
('BT013','2021-02-14','2021-01-29','ST016','SF015'),
('BT014','2021-03-10','2021-02-28','ST014','SF011'),
('BT015','2021-03-31','2021-03-20','ST008','SF014'),
('BT016','2021-04-15','2021-03-29','ST006','SF013'),
('BT017','2021-04-30','2021-04-19','ST008','SF011'),
('BT018','2021-06-04','2021-05-04','ST011','Sf010'),
('BT019','2021-05-17','2021-05-10','ST002','SF012'),
('BT020','2021-07-18','2021-06-19','ST012','SF008'),
('BT021','2021-08-10','2021-06-28','ST014','SF004'),
('BT022','2021-07-20','2021-07-19','ST017','SF005'),
('BT023','2021-10-19','2021-07-31','ST015','SF010'),
('BT024','2021-12-07','2021-08-09','ST012','SF011'),
('BT025','2021-11-09','2021-09-19','ST010','SF007');

COMMIT

insert into BorrowDetails (BorrowID, BookID)
values
('BT001','BK002'),
('BT002','BK003'),
('BT003','BK004'),
('BT004','BK001'),
('BT005','BK010'),
('BT006','BK007'),
('BT007','BK005'),
('BT008','BK005'),
('BT009','BK003'),
('BT010','BK004'),
('BT011','BK006'),
('BT012','BK009'),
('BT013','BK003'),
('BT014','BK002'),
('BT015','BK004'),
('BT016','BK008'),
('BT017','BK005'),
('BT018','BK008'),
('BT019','BK001'),
('BT020','BK010'),
('BT021','BK003'),
('BT022','BK004'),
('BT023','BK007'),
('BT024','BK005'),
('BT025','BK007');

insert into DonationTransaction (DonationID, StaffID, DonatorID, DonationDate)--char,char,char,date
values
('DT001','SF004','DR001','2020-09-18'),
('DT002','SF015','DR001','2020-09-20'),
('DT003','SF011','DR005','2020-10-16'),
('DT004','SF005','DR002','2020-10-25'),
('DT005','SF008','DR006','2020-10-31'),
('DT006','SF003','DR010','2020-11-09'),
('DT007','SF009','DR006','2020-12-28'),
('DT008','SF007','DR007','2021-01-10'),
('DT009','SF012','DR002','2021-01-27'),
('DT010','SF004','DR010','2021-02-07'),
('DT011','SF013','DR009','2021-02-18'),
('DT012','SF014','DR008','2021-03-23'),
('DT013','SF003','DR004','2021-04-12'),
('DT014','SF002','DR003','2021-05-21'),
('DT015','SF001','DR006','2021-06-11'),
('DT016','SF010','DR004','2021-07-01'),
('DT017','SF001','DR005','2021-07-08'),
('DT018','SF008','DR002','2021-08-09'),
('DT019','SF006','DR007','2021-08-22'),
('DT020','SF003','DR010','2021-09-10'),
('DT021','SF009','DR009','2021-10-14'),
('DT022','SF006','DR008','2021-11-19'),
('DT023','SF002','DR006','2021-11-20'),
('DT024','SF001','DR005','2021-12-21'),
('DT025','SF011','DR009','2021-12-28');

--select * from DonationDetails dd
--join MsBook mb on mb.bookid = dd.bookid

--delete from donationdetails

insert into DonationDetails (DonationID, qty, BookID)--char,varchar,int
values
('DT001',90, 'BK005'),
('DT002',23,'BK009'),
('DT003', 305,'BK002'),
('DT004',256,'BK001'),
('DT005',89,'BK003'),
('DT006', 107,'BK010'),
('DT007', 58, 'BK004'),
('DT008', 234, 'BK007'),
('DT009', 475, 'BK001'),
('DT010', 50, 'BK008'),
('DT011', 367, 'BK006'),
('DT012', 176, 'BK003'),
('DT013', 163, 'BK002'),
('DT014', 190, 'BK009'),
('DT015', 247, 'BK008'),
('DT016', 295, 'BK001'),
('DT017', 76, 'BK009'),
('DT018', 147, 'BK007'),
('DT019', 173, 'BK002'),
('DT020', 188, 'BK004'),
('DT021', 92, 'BK005'),
('DT022', 340, 'BK008'),
('DT023', 401, 'BK010'),
('DT024', 321, 'BK002'),
('DT025', 64, 'BK007');