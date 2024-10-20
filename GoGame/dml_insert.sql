INSERT INTO customer (CustomerID, CustomerName, CustomerGender, CustomerDoB, CustomerPhoneNumber)
VALUES 
	('CU001', 'Mane Clements', 'Male', '1990-08-07', '081234392011'),
	('CU002', 'Carrie Wang', 'Female', '2000-09-06', '081382920033'),
	('CU003', 'Annika Knight', 'Female', '1987-10-13', '08123933220'),
	('CU004', 'Zainab Stevenson', 'Male', '2023-11-15', '0813844339'),
	('CU005', 'Meila Nash', 'Female', '2001-05-20', '081922012298'),
	('CU006', 'Andrea Ellis', 'Female', '1995-10-07', '08392229887'),
	('CU007', 'Alfred Reed', 'Male', '2003-09-19', '084599933320'),
	('CU008', 'Rocco Villa', 'Male', '2004-11-11', '08377782211'),
	('CU009', 'Lenny Dillon', 'Male', '2001-02-02', '089022223388'),
	('CU010', 'Pedro Delgado', 'Male', '2004-01-20', '089333229105')

INSERT INTO staff (StaffID, StaffName, StaffGender, StaffDoB, StaffSalary, StaffAddress, StaffPhoneNumber)
VALUES
	('ST001', 'Sam Fischer', 'Male', '1989-07-28', 4500000, 'Jl KH Moch Mansyur 168 G', '082239849976'),
	('ST002', 'Candice Graves', 'Female', '1999-03-24', 4600000, 'Jl Utan 68', '082139444385'),
	('ST003', 'Bryn Clayton', 'Male', '2001-08-12', 4850000, 'Jl Hayam Wuruk Jaya Bl IV/93', '083397761184'),
	('ST004', 'Amelie May', 'Female', '1984-02-01', 4700000, 'Jl Durian Slt I 6', '083920711844'),
	('ST005', 'Tomos Hartman', 'Male', '1985-03-02', 4800000, 'Jl Jend Sudirman Kav 54-55', '082928319951'),
	('ST006', 'Joanne Croft', 'Female', '2004-04-02', 4750000, 'Jl Pulau Pelangi Blok E17', '08119888826'),
	('ST007', 'Clara Bernadette', 'Female', '1992-09-25', 4650000, 'JL Hidup Baru No. 25', '082333344387'),
	('ST008', 'Lauren Natalie', 'Female', '1994-01-12', 4950000, 'Jl Veteran PSr IV Helvetia', '082109061144'),
	('ST009', 'Jerry Lloyd', 'Male', '1995-03-01', 4600000, 'Jl Waspada 94 J', '081949012332'),
	('ST010', 'Maximilian Franklin', 'Male','2002-12-12', 5000000, 'Jl Peneleh 124', '081827319333')

INSERT INTO supplier (SupplierID, SupplierName, SupplierAddress, SupplierPhoneNumber)
VALUES
	('SU001', 'Gamedom', 'Jl KH Hasyim Drive', '081458322933'),
	('SU002', 'Paleo Game', 'Jl Palmerah Utr 115 A', '082488882221'),
	('SU003', 'Inter', 'Jl P Diponegoro Drive', '08352839333'),
	('SU004', 'Roboto Z', 'Jl Ruko Mangga Dua 48', '081294444033'),
	('SU005', 'Poppins', 'Jl Tj Sadari Drive', '083111239928'),
	('SU006', 'Arial X', 'Jl Jend Gatot Subroto Kav 96', '08282441222'),
	('SU007', 'Turner Games', 'Jl Sumur Batu 6 RT 016/07', '08334577727'),
	('SU008', 'Layton Shop', 'Jl Kapt Muslim 79', '08142823311'),
	('SU009', 'Issac Newt', 'Jl Gubeng Airlangga Drive', '085111423128'),
	('SU010', 'Neo Online', 'Jl Apfahiyah Drive', '082321922192')

INSERT INTO game_type (GameTypeID, GameTypeName)
VALUES
	('GT001', 'RPG'),
	('GT002', 'Moba'),
	('GT003', 'Sandbox'),
	('GT004', 'Horror'),
	('GT005', 'TPS'),
	('GT006', 'Fighting'),
	('GT007', 'Adventure'),
	('GT008', 'Simulation'),
	('GT009', 'Sport'),
	('GT010', 'FPS')

INSERT INTO game (GameID, GameTypeID, GameName, GamePrice, GameReleaseDate)
VALUES
	('GA001', 'GT002', 'Little Doto', 250000, '2019-08-04'),
	('GA002', 'GT004', 'Skeleton Violin', 200000, '2019-07-14'),
	('GA003', 'GT010', 'Medan of War', 300000, '2009-06-12'),
	('GA004', 'GT008', 'Binus Simulator', 260000, '2020-08-07'),
	('GA005', 'GT009', 'Project Basketball', 350000, '2007-05-05'),
	('GA006', 'GT003', 'Pixil', 450000, '2019-05-22'),
	('GA007', 'GT007', 'The Adventure of Turner', 150000, '2018-02-03'),
	('GA008', 'GT005', 'Gutling gunner', 350000, '2017-04-15'),
	('GA009', 'GT001', 'Kingdom of Amber', 250000, '2018-05-09'),
	('GA010', 'GT006', 'Kaiten', 200000, '2021-07-24')

INSERT INTO purchase_header (PurchaseID, StaffID, SupplierID, PurchaseDate)
VALUES
	('PU001', 'ST001', 'SU001', '2011-04-11'),
	('PU002', 'ST002', 'SU002', '2011-03-19'),
	('PU003', 'ST003', 'SU003', '2012-11-09'),
	('PU004', 'ST004', 'SU004', '2013-01-28'),
	('PU005', 'ST005', 'SU005', '2013-05-21'),
	('PU006', 'ST006', 'SU006', '2014-04-11'),
	('PU007', 'ST007', 'SU007', '2015-03-19'),
	('PU008', 'ST008', 'SU008', '2015-11-09'),
	('PU009', 'ST009', 'SU009', '2016-01-28'),
	('PU010', 'ST010', 'SU010', '2017-05-21'),
	('PU011', 'ST001', 'SU001', '2018-04-11'),
	('PU012', 'ST002', 'SU002', '2019-03-19'),
	('PU013', 'ST003', 'SU003', '2019-11-09'),
	('PU014', 'ST004', 'SU004', '2019-01-28'),
	('PU015', 'ST005', 'SU005', '2020-05-21')

INSERT INTO purchase_detail (PurchaseID, GameID, Quantity)
VALUES
	('PU001', 'GA006', 22),
	('PU002', 'GA004', 51),
	('PU003', 'GA007', 12),
	('PU014', 'GA002', 33),
	('PU005', 'GA001', 28),
	('PU006', 'GA009', 21),
	('PU014', 'GA010', 34),
	('PU008', 'GA003', 15),
	('PU009', 'GA005', 38),
	('PU010', 'GA002', 21),
	('PU011', 'GA008', 24),
	('PU012', 'GA005', 54),
	('PU013', 'GA007', 19),
	('PU014', 'GA003', 36),
	('PU015', 'GA004', 20),
	('PU001', 'GA010', 22),
	('PU002', 'GA008', 44),
	('PU003', 'GA006', 16),
	('PU012', 'GA001', 33),
	('PU005', 'GA008', 22),
	('PU006', 'GA010', 25),
	('PU007', 'GA003', 32),
	('PU014', 'GA007', 18),
	('PU009', 'GA002', 33),
	('PU012', 'GA009', 27)

INSERT INTO sales_header (SalesID, StaffID, CustomerID, TransactionDate)
VALUES
	('SA001', 'ST001', 'CU001', '2020-01-21'),
	('SA002', 'ST002', 'CU002', '2020-02-10'),
	('SA003', 'ST003', 'CU003', '2020-03-05'),
	('SA004', 'ST004', 'CU004', '2020-04-23'),
	('SA005', 'ST005', 'CU005', '2020-05-07'),
	('SA006', 'ST006', 'CU006', '2021-07-21'),
	('SA007', 'ST007', 'CU007', '2021-07-22'),
	('SA008', 'ST008', 'CU008', '2021-09-05'),
	('SA009', 'ST009', 'CU009', '2022-01-16'),
	('SA010', 'ST010', 'CU010', '2022-03-03'),
	('SA011', 'ST001', 'CU001', '2022-06-21'),
	('SA012', 'ST002', 'CU002', '2023-02-26'),
	('SA013', 'ST003', 'CU003', '2023-02-24'),
	('SA014', 'ST004', 'CU004', '2023-03-13'),
	('SA015', 'ST005', 'CU001', '2023-04-07')

INSERT INTO sales_detail (SalesID, GameID, Quantity)
VALUES
	('SA001', 'GA009', 2),
	('SA002', 'GA004', 1),
	('SA003', 'GA007', 3),
	('SA004', 'GA004', 2),
	('SA005', 'GA007', 3),
	('SA006', 'GA010', 2),
	('SA007', 'GA008', 1),
	('SA008', 'GA002', 3),
	('SA009', 'GA001', 4),
	('SA010', 'GA009', 3),
	('SA011', 'GA006', 2),
	('SA012', 'GA010', 1),
	('SA013', 'GA002', 3),
	('SA014', 'GA003', 4),
	('SA015', 'GA001', 3),
	('SA001', 'GA004', 2),
	('SA002', 'GA007', 5),
	('SA003', 'GA006', 3), 
	('SA004', 'GA009', 4),
	('SA005', 'GA002', 3),
	('SA001', 'GA008', 2),
	('SA002', 'GA001', 5),
	('SA003', 'GA002', 3),
	('SA004', 'GA010', 4),
	('SA005', 'GA004', 3)