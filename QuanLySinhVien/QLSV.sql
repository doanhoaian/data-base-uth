-- Thực hiện yêu cầu 1, 2, 3, 4 --

CREATE DATABASE QLSV;
USE QLSV;

-- Tạo bảng môn học
CREATE TABLE monhoc (
	mamh char(3) PRIMARY KEY,
	tenmh varchar(50),
	sotc int
);
-- Nhập dữ liệu bảng môn học
INSERT INTO monhoc
VALUES ('M01', 'Toan', 3),
	   ('M02', 'Ly', 2),
       ('M03', 'Hoa', 2),
       ('M04', 'Anh', 2),
       ('M05', 'Van', 3);
-- Xem bảng môn học
SELECT * FROM monhoc;

-- Tạo bảng lớp
CREATE TABLE lop (
	malp char(3) PRIMARY KEY,
	tenlp varchar(50),
	nk varchar(4)
);

-- Nhập dữ liệu bảng lớp
INSERT INTO lop
VALUES ('L01', 'Computer Science', '2023'),
	   ('L02', 'Infomation Technology', '2023'),
       ('L03', 'Logictics', '2023');
-- Xem bảng lớp
SELECT * FROM lop;

-- Tạo bảng sinh viên
CREATE TABLE sinhvien (
	masv char(3) PRIMARY KEY,
    tensv varchar(50),
    dcsv varchar(50),
    malp char(3)
);
-- Nhập dữ liệu bảng sinh viên
INSERT INTO sinhvien
VALUES ('S01', 'Nguyen Van A', 'Ben Tre', 'L01'),
	   ('S02', 'Dang Thu Ha', 'Dong Thap', 'L02'),
	   ('S03', 'Tran Duc Dat', 'Long An', 'L03'),
	   ('S04', 'Nguyen Thi B', 'TP. Ho Chi Minh', 'L01'),
	   ('S05', 'Huynh Van Thien', 'Cao Lanh', 'L02'),
	   ('S06', 'Chau Bao Duy', 'Tien Giang', 'L03'),
	   ('S07', 'Nguyen Van F', 'Campodia', 'L01'),
	   ('S08', 'Tran Chau C', 'China', 'L02'),
	   ('S09', 'Tran Minh Hieu', 'Hoc Mon', 'L03'),
	   ('S10', 'Sa Tang', 'Hoa Qua Son', 'L01'),
	   ('S11', 'Huynh Thien An', 'Ben Tre', 'L02'),
	   ('S12', 'Huynh Van Phang', 'Ha Noi', 'L03'),
	   ('S13', 'Chau Bao Toan', 'Thai Binh', 'L01'),
	   ('S14', 'Sieu San Yan', 'Thai Nguyen', 'L02'),
	   ('S15', 'Pham Van Bo', 'Trung Nguyen', 'L03'),
	   ('S16', 'Chau Bao Binh', 'Ca Mau', 'L01'),
	   ('S17', 'Pham Van Bo', 'Kien Giang', 'L02'),
	   ('S18', 'Doan Hoai An', 'Ben Tre', 'L03'),
	   ('S19', 'Trinh Tran Phuong Tuan', 'Ben Tre', 'L01'),
	   ('S20', 'Le Tuan Khang', 'Rach Gia', 'L02');
-- Xem bảng sinh viên
SELECT * FROM sinhvien;

-- Tạo bảng điểm sinh viên
CREATE TABLE diemsv (
	masv char(3),
    mamh char(3),
    diem float,
    PRIMARY KEY (masv, mamh)
);
-- Nhập dữ liệu bảng điểm sinh viên
INSERT INTO diemsv 
VALUES ('S01', 'M01', 8),
	   ('S01', 'M02', 8),
       ('S01', 'M04', 10),
       ('S01', 'M05', 2),
       ('S02', 'M02', 8),
       ('S02', 'M04', 2),
       ('S02', 'M05', 3.5),
       ('S03', 'M01', 10),
       ('S03', 'M03', 8),
       ('S04', 'M02', 9),
       ('S05', 'M02', 6),
       ('S05', 'M03', 9.5),
       ('S05', 'M04', 8),
       ('S05', 'M05', 7),
       ('S06', 'M01', 4),
       ('S06', 'M03', 8.5),
       ('S06', 'M05', 6),
       ('S07', 'M03', 3),
       ('S07', 'M04', 2),
       ('S08', 'M01', 10),
       ('S09', 'M02', 4),
       ('S09', 'M03', 2),
       ('S09', 'M04', 3),
       ('S09', 'M05', 9),
       ('S10', 'M01', 4.5),
       ('S10', 'M02', 3),
       ('S10', 'M04', 6);
-- Xem bảng điểm sinh viên
SELECT * FROM diemsv;

-- Thực hiện yêu cầu 5 --

-- 5.1. Cho biết các sinh viên của lớp mã số ”L02”.
SELECT * 
FROM sinhvien
WHERE malp = 'L02';

-- 5.2. Cho biết các sinh viên của lớp có tên là ”Computer Science”.
SELECT sv.*
FROM sinhvien sv
JOIN lop l ON sv.malp = l.malp
WHERE l.tenlp = 'Computer Science';

-- 5.3. Cho biết các sinh viên (đầy đủ thông tin) của niên khóa ”2023”.
SELECT sv.* 
FROM sinhvien sv
JOIN lop l ON sv.malp = l.malp
WHERE l.nk = '2023';

-- 5.4. Cho biết tên và số tín chỉ của môn học mã số “M01”.
SELECT tenmh, sotc
FROM monhoc
WHERE mamh = 'M01';

-- 5.5. Điểm môn mã số ”M02” của sinh viên mã số ”S02”.
SELECT diem
FROM diemsv
WHERE masv = 'S02' AND mamh = 'M02';

-- 5.6. Cho biết các môn học (mã số, tên và điểm) mà sinh viên mã số ”S02” thi rớt.
SELECT mh.mamh, mh.tenmh, d.diem
FROM monhoc mh
JOIN diemsv d ON mh.mamh = d.mamh
WHERE d.diem < 5 AND d.masv = 'S02';

-- 5.7. Cho biết các môn học (*) mà sinh viên mã số ”S03” chưa bao gì thi.
SELECT *
FROM monhoc
WHERE mamh
NOT IN (SELECT mamh
	    FROM diemsv
		WHERE masv = 'S03'
);

-- 5.8. Sĩ số của lớp mã số ”L01”.
SELECT COUNT(*) AS siso
FROM sinhvien
WHERE malp = 'L01';

-- 5.9. Sĩ số từng lớp.
SELECT malp, COUNT(*) AS siso
FROM sinhvien
GROUP BY malp;

-- 5.10. Lớp có sĩ số lớn nhất.
WITH SiSo AS (
	SELECT malp, COUNT(*) AS siso
    FROM sinhvien
    GROUP BY malp
)
SELECT malp, siso
FROM SiSo
WHERE siso = (SELECT MAX(siso) FROM SiSo);

-- 5.11. Lớp (mã số và tên) có sĩ số lớn nhất.
WITH SiSo AS (
	SELECT sv.malp, l.tenlp, COUNT(*) AS siso
    FROM sinhvien sv
    JOIN lop l ON sv.malp = l.malp
    GROUP BY malp
)
SELECT malp, tenlp, siso
FROM SiSo
WHERE siso = (SELECT MAX(siso) FROM SiSo);

-- 5.12. Điểm trung bình của sinh viên mã số ”S02”.
SELECT AVG(diem) AS diemtb
FROM diemsv
WHERE masv = 'S02';

-- 5.13. Điểm trung bình của từng sinh viên (mã số).
SELECT masv, AVG(diem) AS diemtb
FROM diemsv
GROUP BY masv;

-- 5.14. Điểm trung bình của từng sinh viên (mã số và tên).
SELECT sv.masv, sv.tensv, AVG(d.diem) AS diemtb
FROM diemsv d
JOIN sinhvien sv ON d.masv = sv.masv
GROUP BY masv;

-- 5.15. Điểm trung bình của lớp mã số ”L03”.
SELECT AVG(d.diem) AS diemtb
FROM diemsv d
JOIN sinhvien sv ON d.masv = sv.masv
WHERE sv.malp = 'L03'
GROUP BY malp; 

-- 5.16. Điểm trung bình của từng lớp (mã số).
SELECT sv.malp, AVG(d.diem) AS diemtb
FROM diemsv d
JOIN sinhvien sv ON d.masv = sv.masv
GROUP BY malp;

-- 5.17. Điểm trung bình của từng lớp (mã số và tên).
SELECT l.malp, l.tenlp, AVG(d.diem) AS diemtb
FROM diemsv d
JOIN sinhvien sv ON d.masv = sv.masv
JOIN lop l ON sv.malp = l.malp
GROUP BY malp;

-- 5.18. Cho biết sinh viên (mã số) có điểm trung bình lớn nhất.
WITH DiemTB AS (
	SELECT masv, AVG(diem) AS diemtb
    FROM diemsv
    GROUP BY masv
)
SELECT masv, diemtb
FROM DiemTB
WHERE diemtb = (SELECT MAX(diemtb) FROM DiemTB);

-- 5.19. Cho biết sinh viên (mã số và tên) có điểm trung bình lớn nhất.
WITH DiemTB AS (
	SELECT sv.masv, sv.tensv, AVG(d.diem) AS diemtb
    FROM diemsv d
    JOIN sinhvien sv ON d.masv = sv.masv
    GROUP BY masv
)
SELECT masv, tensv, diemtb
FROM DiemTB
WHERE diemtb = (SELECT MAX(diemtb) from DiemTB);

-- 5.20. Điểm trung bình có hệ số (số tín chỉ) của từng sinh viên (mã số).
SELECT d.masv, SUM(d.diem) / SUM(mh.sotc) AS diemtbtinchi
FROM diemsv d
JOIN monhoc mh ON d.mamh = mh.mamh
GROUP BY masv;

-- 5.21. Điểm trung bình có hệ số (số tín chỉ) của từng sinh viên (mã số và tên).
SELECT sv.masv, sv.tensv, SUM(d.diem) / SUM(mh.sotc) AS diemtbtinchi
FROM diemsv d
JOIN monhoc mh ON d.mamh = mh.mamh
JOIN sinhvien sv ON d.masv = sv.masv
GROUP BY masv;

-- 5.22. Sinh viên có điểm trung bình có hệ số lớn nhất.
WITH DiemTBTC AS (
    SELECT sv.masv, sv.tensv, SUM(d.diem) / SUM(mh.sotc) AS diemtbtinchi
    FROM diemsv d
    JOIN monhoc mh ON d.mamh = mh.mamh
    JOIN sinhvien sv ON d.masv = sv.masv
    GROUP BY masv
)
SELECT masv, tensv, diemtbtinchi
FROM DiemTBTC
WHERE diemtbtinchi = (SELECT MAX(diemtbtinchi) FROM DiemTBTC);

-- 5.23. Điểm trung bình có hệ số của từng lớp.
SELECT sv.malp, SUM(d.diem) / SUM(mh.sotc) AS diemtbtinchi
FROM diemsv d
JOIN monhoc mh ON d.mamh = mh.mamh
JOIN sinhvien sv ON d.masv = sv.masv
GROUP BY malp;


-- Thực hiện yêu cầu 6 --
