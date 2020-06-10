SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM  MEDICINE;
DELETE FROM STORES;
DELETE FROM DEALER;
DELETE FROM PATIENT;
DELETE FROM RETAIL;
DELETE FROM TRANSACTIONS;
DELETE FROM HOSPITAL;
DELETE FROM TREATMENT;
DELETE FROM DOCTOR;
DELETE FROM CONTRACT;
DELETE FROM QUANT;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO MEDICINE(med_id, name, composition, mfg_date, exp_date, cost_per_tab)
VALUES
(1, "Crocin", "paracetamol, caffeine", "2019-12-24", "2021-05-24", 9),
(2, "Saridon", "propyphenazone, paracetamol, caffeine", "2019-04-15", "2022-06-10", 5),
(3, "Vicks", "camphor, nutmeg, thymol, cedarwood", "2018-11-02", "2021-08-27", 6 ),
(4, "Gelusil", "aluminum hydroxide, magnesium hydroxide", "2018-07-09", "2022-09-20", 12),
(5, "Mosha-L", "levocetirizine, montelukast", "2019-01-06", "2021-05-30", 7),
(6, "Glycomet", "metformin ", "2020-06-06", "2023-01-24", 15),
(7, "Dolo650", "paracetamol ", "2018-12-15", "2021-11-17", 8),
(8, "Volini", "diclofenac diethylamine, methanol, linseed oil", "2018-12-31", "2022-08-13", 2),
(9, "Benadryl", "diphenhydramine hydrochloride, ammonium chloride", "2019-12-23", "2021-03-12", 50),
(10, "Otrivin", "xylometazoline hydrochloride ", "2020-11-16", "2022-08-11", 86),
(11, "Ciplox", "quinolone antibiotics", "2019-06-14", "2020-09-20", 99),
(12, "Eldoper", "Loperamide", "2020*02-15", "2022-08-24", 5);

INSERT INTO STORES(store_id, name, address, contact, store_man)
VALUES
("str1", "Frank Ross Pharma - Emami Group", "Sampige Rd, Malleshwaram, Bengaluru,", "080 4128 0841", "john"),
("str2", "Sagar Pharma", "Srinagar, Bengaluru", "080 2667 5734", "mary"),
("str3", "MSR Pharma", "MSR College Rd, Mathikere, Bengaluru", "080 2360 9999", "sean"),
("str4", "Unitree Pharma & General Store", "Church Rd, J.C.Nagar, Bengaluru", "8596367412", "harry"),
("str5", "Misba Pharma & General Stores", "Devara Jeevanahalli, Bengaluru", "5897456321", "levy"),
("str6", "Chetan Pharma", "2nd Block, Rajajinagar, Bengaluru", "078920 43087", "Christie"),
("str7", "Praveen Pharma", "Sultanpet Cross, behind Daulat Market, Bengaluru", "080 2287 2905", "Sam"),
("str8", "Noble Pharma", "Mahaganapathi Nagar, Rajajinagar, Bengaluru", "098457 55745", "Rocky"),
("str9", "Pragathi Pharma & General Stores", "Mohan Kumar Nagar, Yeswanthpur, Bengaluru", "094498 00785", "Thomas"),
("str10", "Life Line Pharma & General Store", "Sulthangunta, Shivaji Nagar, Bengaluru", "099804 44777", "Richard");


INSERT INTO DEALER(dealer_id, name, address, phone)
VALUES
(1, "Rick", "Jayanagar, Bangalore", "8523698452"),
(2, "Sanchez", "M.G road, kengeri, Bangalore", "4563258956"),
(3, "Morty", "7th Phase, J.P Nagar, Bangalore", "1122457896"),
(4, "Kendrick", "4th cross, R.K Nagar, Mumbai", "9985665231"),
(5, "James", "8th block, Arjun Nagar, Kerala, ", "3325478810"),
(6, "Michael", "6th phase, loyola gardens, Chennai", "5599884203"),
(7, "Tom", "5th cross, R.K complex, Bangalore", "1100223645"),
(8, "Tim", "K.M Road, Sundar Nagar, Bangalore", "9877754236"),
(9, "Suzy", "15th cross, Bheema Nagar, Delhi", "5566369875"),
(10, "Cindy", "8th block, Jayanagar, Bangalore", "5522369877"),
(11, "Mike", "9th cross, B.P nagar, Mangalore", "5541023877");

INSERT INTO HOSPITAL(hos_id, name, address, phone)
VALUES
("hos1", "Take Care Hospital Group", "3rd cross, M.G road, Bangalore 20", "+918855412365"),
("hos2", "Check Diagnostics", "10th main road, Kengeri", "+819224753692"),
("hos5", "Roma Dental Clinic", "4th block , Bheema nagar, Hasan", "+917741225410"),
("hos3", "Ashwini ENT Clinic", "9th phase, J.P Nagar, Bangalore 99", "08023456600"),
("hos4", "Khira Hospitals", "Shalini Apartments, Malleshwaram, Bangalore 20", "+919005477812"),
("hos6", "Manasa Pediatrics", "Lotus Road, 4th block jayanagar, Bangalore 30", "+807744521463"),
("hos8", "Sun Astra Hospital", "8th main, Arjun Nagar, Bangalore 80", "+415577852036"),
("hos7", "Bright Living Healthcare", "Hosekere, Malleshwaram 4th cross", "+7411452203");


INSERT INTO CONTRACT(contract_id, hos_id, store_id)
VALUES
("ctrt1","hos1", "str3"),
("ctrt3","hos2", "str4"),
("ctrt2","hos3", "str3"),
("ctrt4","hos4", "str9"),
("ctrt6","hos5", "str1"),
("ctrt5","hos6", "str10"),
("ctrt8","hos7", "str5"),
("ctrt7","hos8", "str3");


INSERT INTO DOCTOR(doc_id, hos_id, doc_name)
VALUES
(1, "hos1", "Rajesh"),
(2, "hos3", "Supriya"),
(3, "hos5", "Bharati"),
(4, "hos6", "Anil"),
(5, "hos7", "Kiran"),
(6, "hos4", "Joseph"),
(7, "hos7", "Bhuvan"),
(8, "hos7", "Raj"),
(9, "hos4", "John");



INSERT INTO PATIENT(pat_id, name, address, phone)
VALUES
(56689, "Max" , "3rd cross, Jayanagar 4th Block, Bnagalore 560065", "8767894534"),
(50895, "Rick", "6th block, Nagarbhavi, Bangalore 560098", "8745237756"),
(52369, "Ganesh", "4th cross, 3rd block, BSK 2nd stage, Bangalore 560040", "9988768909"),
(11235, "Brooke","4th block, Jayanagar, Bangalore 560022","7898665501"),
(60085, "Martin", "JP Nagar 3rd Phase, Bangalore 560045", "9987564456"),
(15478, "Rony", "4th cross, BTM Layout, Bangalore 560011", "8877664532"),
(20155, "Pinky", "4th main, R.Nagar, Bangalore 560765", "5699841233"),
(66778, "Ankit", "8th main, 2nd block Jayanagar, Bangalore 560077", "5566789045"),
(77485, "John", "3rd cross, M.G road, Bangalore 560087", "7766345672"),
(33009, "James", "8th block, Banerghatta road, Bangalore 560078", "9978665543");

INSERT INTO TREATMENT(treat_id, pat_id, hos_id, doc_id, treat_date)
VALUES
(2, 50895, "hos1", 1, "2019-12-12"),
(1, 33009, "hos3", 2, "2019-11-20"),
(3, 77485, "hos5", 3, CURRENT_date()),
(5, 66778, "hos6", 9, CURRENT_date()),
(4, 20155, "hos7", 5,"2020-01-01"),
(6, 15478, "hos4", 6, CURRENT_date()),
(7, 60085, "hos7", 7, CURRENT_date()),
(8, 11235, "hos7", 8, "2018-06-11");

INSERT INTO RETAIL(retail_id, med_id, batchno, quantity_supplied, store_id, dealer_id)
VALUES
("ret1", 2, 44, 200, "str1", 9),
("ret2", 2, 44, 200, "str2", 9),
("ret3", 6, 4, 100, "str2", 10),
("ret7", 4, 1, 50, "str8", 1),
("ret6", 6, 4, 100, "str5", 10),
("ret8", 3, 6, 75, "str6", 6),
("ret4", 5, 67, 135, "str6", 3),
("ret5", 5, 1, 300, "str4", 8),
("ret9", 1, 120, 35, "str3", 3),
("ret10", 8, 33, 120, "str4", 7),
("ret11", 7, 55, 90, "str7", 7),
("ret13", 10, 56, 180, "str10", 4),
("ret12", 11, 35, 40, "str8", 4),
("ret14", 9, 34, 345, "str10", 10);


INSERT INTO TRANSACTIONS(bill_id, pat_id, med_id, store_id, quantity, pur_date)
VALUES
(123, 60085, 2, "str2", 30, CURRENT_date()),
(123, 60085, 6, "str2", 20, CURRENT_date()),
(21, 50895, 10, "str10", 40, "2020-01-01"),
(34, 77485, 5, "str1", 50, CURRENT_date()),
(34, 77485, 3, "str1", 20, CURRENT_date()),
(233, 33009, 1, "str3", 10, "2020-05-01"),
(78, 11235, 11, "str8", 5, "2020-04-20"),
(677, 56689, 2, "str1", 55, "2020-04-20"),
(44, 66778, 10, "str10", 90, "2019-09-11"),
(89, 52369, 8, "str4", 20, "2020-01-10");
