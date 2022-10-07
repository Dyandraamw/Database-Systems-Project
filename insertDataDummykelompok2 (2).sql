
begin tran
insert into MsStaff (StaffID, StaffName, StaffGender, StaffAddress, StaffPhone, StaffSalary)--char,varchar,varchar,varchar,varchar,numeric(7, 2)
values
('SF001','Arya Kusuma','Male','Jeruk 28 Street','+6282528323', 1500000),
('SF002','Jazmi Nadhila Kamil','Female','Salak 31 Street','+624852398524', 700000),
('SF003','Javier Adhani Idris','Male','Papaya 89 Street','+62543245323', 900000),
('SF004','Farah Novilianti Irawan','Female','Haji Salman 93 Avenue','+62342189324', 1700000),
('SF005','Muhammad Pradipta Yudhistira','Male','Brigif 99 Avenue','+6232472389', 800000),
('SF006','Meilinda Sholeha Irawati','Female','Cipanas 76 Street','+6289201230', 1800000),
('SF007','Imam Mujahid','Male','Lembayung 55 Street','+6281248171', 2000000),
('SF008','Nadhira Tiani Azalia','Female','Haji Naim 87 Avenue','+6281483118', 2000000),
('SF009','Mochammad Ramadhany','Male','Margasatwa 65 Street','+62812471289', 1400000),
('SF010','Addysha Syaputri Martin','Female','Ragunan 55 Avenue','+62819382490', 1350000),
('SF011','Farabi Mustajir Rahman','Male','Asia Afrika 77 Avenue','+6281293841', 1200000),
('SF012','Nabela Zaedah','Female','Haji Sarpa 99 Street','+62823842991', 1150000),
('SF013','Syawqi Al Haq','Male','Haji Salman 88 Avenue','+62843287781',1350000),
('SF014','Nalareta Kamiliya','Female','Kyai Mojo 77 Street','+628213759872', 400000),
('SF015','Calvin','Male','Lempuyang 89 Avenue','+6283247982334', 600000);

commit
rollback

begin tran
insert into MsStudent (StudentID, StudentName, StudentAddress, StudentGender, StudentEmail)--char,varchar,varchar,varchar,varchar
values
('ST001','Ryandika Abbel Syarif','Cipanas 66 Street','Male','abel.syarif@gmail.com'),
('ST002','Rafael Ryan Akmal','Harpa 94 Street','Male','rafael.ryan@yahoo.com'),
('ST003','Marsya Destiana','Makassar Barat 88 Street','Female','marsya.destiana@gmail.com'),
('ST004','Alma Azzahra Putri','Cimahi 65 Street','Female','azzahra.putri@gmail.com'),
('ST005','Duanti Kirana Syafitri','Mars 23 Street','Female','kiranaee@gmail.com'),
('ST006','Putri Aisha','W.R Supratman 55 Avenue','Female','putri.aisha@yahoo.com'),
('ST007','Muhammad Faza Khalid','Cinere Raya 44 Avenue','Male','faza.khalid@gmail.com'),
('ST008','Yusuf Rizky Nugroho','Jupiter 39 Street','Male','ysf.rizky@yahoo.com'),
('ST009','Nafhan Raissa Syandana','Saturn 40 Street','Male','nafhan324@gmail.com'),
('ST010','Luqman Hadiwinata','Manggis 75 Street','Male','l.hadi989@gmail.com'),
('ST011','Angelina Giorgina Lalopua','Haji Montong 66 Street','Female','giorgina472@gmail.com'),
('ST012','Savana Qnar Syiffa','Moh Kahfi I 89 Avenue','Female','nai.syiffa23@gmail.com'),
('ST013','Benedicta Nandhita Adhwitania','Kecapi 33 Street','Female','adhwitania@gmail.com'),
('ST014','Anggraeni Triesnar Melia Fitri','Perdamaian IV 75 Street','Female','triesnar89@gmail.com'),
('ST015','Maheswari Alvina Indita','Haji Muhajir V 432 Street','Female','maheswari.indita@yahoo.com'),
('ST016','Rivaldo Yunior','Sawo IV 823 Street','Male','riv.yu@yahoo.com'),
('ST017','Muhammad Raihan Haning Putra','Uranus 324 Street','Male','haninx@gmail.com');

--delete dulu baru insert lagi
delete  from msStudent

select *
from MsStudent
commit
rollback

BEGIN TRAN
insert into MsBook(BookID, BookTitle, PublishDate, BookStock, BookRating, CategoryID)
values 
('BK001','50 Shades of Noon', '2015-08-14', 35, 4.04,'BC004'),
('BK002','Sharkgal and Lavaboy', '2014-04-27', 43, 3.82,'BC005'),
('BK003','Shareloc Homes', '2018-01-07', 56, 3.75,'BC002'),
('BK004','Soy X Family', '2020-06-08',79, 4.16,'BC002'),
('BK005','Acid and Base Solution','2019-05-09',74, 4.44,'BC003'),
('BK006','Maya The Last Pug','2017-07-26',124, 3.33,'BC001'),
('BK007','Static and Dynamic Fluid','2018-06-06',115, 4.51,'BC003'),
('BK008','Eula and Three Family','2016-10-01',188, 3.03,'BC001'),
('BK009','BB8 and R2D2','2013-11-11',85, 2.22,'BC005'),
('BK010','Paper Hearts','2012-04-02',96, 1.17,'BC004');

commit

update MsStudent
set StudentEmail = 'azzahra.putri@gmail.com'
where StudentID = 'ST004'

select * 
from MsBook

insert into MsBookCategory (CategoryID, CategoryName)
values
('BC001','Fantasy'),
('BC002','Mystery'),
('BC003','Education'),
('BC004','Romance'),
('BC005','Sci-fi');

select * from BorrowTransaction


INSERT INTO MsDonator (DonatorID, DonatorName, DonatorGender, DonatorAddress, DonatorPhone)--char,varchar,varchar,varchar,varchar
VALUES
('DR001','Muhammad Raul Fattah','Male','Markisa 91 Street','085432524934'),
('DR002','Riyanti Putri','Female','Jambu 11 Street','083428976342'),
('DR003','Wanda Rhisma Tiana','Female','Haji Jaeran 55 Street','08243617734237'),
('DR004','Farhan Aulya','Male','Rawa Kopi 90 Street','08234583492334'),
('DR005','Reifazmy Haidar Syaputra','Male','Meninjo 888 Street','082345238432'),
('DR006','Muhammad Akmal Taufiqurrahman','Male','Pondok Cabe II 33 Avenue','08394274275'),
('DR007','Bintang Akbar Rahim Silalong','Male','Jangkrik II 837 Street','0832758223452'),
('DR008','Raditya Prabaswara Anandhio','Male','Pembangunan Andara 88 Avenue','081234168413'),
('DR009','Syaghina Maitsa Gunawan','Female','Andara Raya 86 Avenue','08234857234'),
('DR010','Ganies Ultifa Anum','Female','Green Andara II 45 Street','082345724834');

SELECT *
FROM DonationDetails

--select datediff(day, '2021/12/1', GETDATE())




