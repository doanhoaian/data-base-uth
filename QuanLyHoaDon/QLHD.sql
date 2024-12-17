-- Thực hiện yêu cầu 1, 2, 3, 4 --

CREATE DATABASE QLHD;
USE QLHD;

-- Tạo bảng loại hàng
CREATE TABLE loaihg (
	malh varchar(3) PRIMARY KEY,
    tenlh varchar(50)
);
-- Nhập dữ liệu bảng loại hàng
INSERT INTO loaihg
VALUES
('L01', 'Thuc pham'),
('L02', 'Quan ao'),
('L03', 'Do gia dung'),
('L04', 'Thiet bi dien tu'),
('L05', 'My pham');
-- Xem bảng loại hàng
SELECT * FROM loaihg;

-- Tạo bảng hàng
CREATE TABLE hang (
	mahg varchar(3) PRIMARY KEY,
    tenhg varchar(50),
    dg float,
    malh varchar(3)
);
-- Nhập dữ liệu bảng hàng
INSERT INTO hang
VALUES 
('H01', 'Gao', 20, 'L01'),
('H02', 'Thit heo', 150, 'L01'),
('H03', 'Rau cai', 10, 'L01'),
('H04', 'Ca chua', 25, 'L01'),
('H05', 'Trung ga', 30, 'L01'),
('H06', 'Sua tuoi', 25, 'L01'),
('H07', 'Dua hau', 35, 'L01'),
('H08', 'Banh mi', 5, 'L01'),
('H09', 'Ao so mi', 200, 'L02'),
('H10', 'Quan jean', 350, 'L02'),
('H11', 'Vay dam', 500, 'L02'),
('H12', 'Giay the thao', 1000, 'L02'),
('H13', 'Ban an', 2000, 'L03'),
('H14', 'Ghe sofa', 5000, 'L03'),
('H15', 'Tu lanh', 10000, 'L03'),
('H16', 'May giat', 8000, 'L03'),
('H17', 'Noi com dien', 800, 'L03'),
('H18', 'Dien thoai', 15000, 'L04'),
('H19', 'May tinh', 20000, 'L04'),
('H20', 'Tivi', 12000, 'L04'),
('H21', 'Loa bluetooth', 500, 'L04'),
('H22', 'Tai nghe', 1000, 'L04'),
('H23', 'May anh', 2500, 'L04'),
('H24', 'Dong ho thong minh', 5000, 'L04'),
('H25', 'Son moi', 300, 'L05'),
('H26', 'Phan trang diem', 200, 'L05'),
('H27', 'Kem duong da', 500, 'L05'),
('H28', 'Nuoc hoa', 1000, 'L05'),
('H29', 'Sua rua mat', 150, 'L05'),
('H30', 'Kem chong nang', 250, 'L05');
-- Xem bảng hàng
SELECT * FROM hang;

-- Tạo bảng hóa đơn
CREATE TABLE hoadon (
	mahd varchar(3) PRIMARY KEY,
    ngaylap date
);
-- Nhập dữ liệu bảng hóa đơn
INSERT INTO hoadon
VALUES
('D01', '2024-12-10'),
('D02', '2023-12-08'),
('D03', '2023-12-02'),
('D04', '2023-11-10'),
('D05', '2023-09-22'),
('D06', '2023-09-15'),
('D07', '2023-5-10'),
('D08', '2023-02-14'),
('D09', '2023-11-20'),
('D10', '2023-12-09');
-- Xem bảng hóa đơn
SELECT * FROM hoadon;

-- Tạo bảng chi tiết hóa đơn
CREATE TABLE cthd (
	mahd varchar(3),
    mahg varchar(3),
    sl int,
    PRIMARY KEY (mahd, mahg)
);
-- Nhập dữ liệu bảng chi tiết hóa đơn
INSERT INTO cthd
VALUES
('D01', 'H04', 5),
('D02', 'H25', 8),
('D02', 'H20', 7),
('D02', 'H10', 10),
('D03', 'H09', 10),
('D03', 'H12', 8),
('D03', 'H08', 1),
('D03', 'H29', 2),
('D03', 'H20', 10),
('D04', 'H16', 3),
('D05', 'H12', 9),
('D05', 'H24', 1),
('D05', 'H08', 3),
('D05', 'H04', 1),
('D05', 'H02', 1),
('D06', 'H26', 9),
('D06', 'H07', 7),
('D07', 'H12', 4),
('D07', 'H08', 3),
('D08', 'H21', 5),
('D09', 'H27', 6),
('D10', 'H10', 3),
('D10', 'H17', 10),
('D10', 'H18', 7),
('D10', 'H01', 6);
-- Xem bảng chi tiết hóa đơn
SELECT * FROM cthd;


-- Thực hiện yêu cầu 5 --

-- 5.1. Cho biết các mặt hàng của loại hàng mã số = ”LO1”.
SELECT tenhg
FROM hang
WHERE malh = 'L01';

-- 5.2. Cho biết các mặt hàng (mã số, tên và đơn giá) của loại hàng mã số ”LO2”.
SELECT mahg, tenhg, dg
FROM hang
WHERE malh = 'L02';

-- 5.3. Cho biết các mặt hàng (*) có đơn giá từ 100 đến 500.
SELECT *
FROM hang
WHERE dg BETWEEN 100 AND 500;

-- 5.4. Cho biết các hóa đơn được lập vào ngày d.
SELECT mahd
FROM hoadon
WHERE DAY(ngaylap) = 20;

-- 5.5. Cho biết các mặt hàng (mã số, tên, đơn giá và số lượng) của những hóa đơn lập vào ngày d.
SELECT h.mahg, h.tenhg, h.dg, c.sl
FROM hang h
JOIN cthd c ON h.mahg = c.mahg
JOIN hoadon d ON c.mahd = d.mahd
WHERE DAY(d.ngaylap) = 20;

-- 5.6. Cho biết các hóa đơn được lập vào năm 2023.
SELECT mahd
FROM hoadon
WHERE YEAR(ngaylap) = 2023;

-- 5.7. Tính tổng số lượng hàng của hóa đơn mã số ”D01”.
SELECT SUM(sl) AS tongsl
FROM cthd
WHERE mahd = 'D01';

-- 5.8. Tính tổng số lượng hàng của từng hóa đơn.
SELECT mahd, SUM(sl) AS tongsl
FROM cthd
GROUP BY mahd;

-- 5.9. Tính tổng số lượng hàng của từng hóa đơn trong ngày d.
SELECT c.mahd, SUM(c.sl) AS tongsl
FROM cthd c
JOIN hoadon d ON c.mahd = d.mahd
WHERE DAY(d.ngaylap) = 20
GROUP BY mahd;

-- 5.10. Tính trị giá của hóa đơn mã số ”D01”.
SELECT d.mahd, SUM(h.dg * c.sl) AS giatrihd
FROM cthd c
JOIN hoadon d ON c.mahd = d.mahd
JOIN hang h ON c.mahg = h.mahg
WHERE d.mahd = 'D01';

-- 5.11. Tính trị giá của từng hóa đơn.
SELECT d.mahd, SUM(h.dg * c.sl) AS giatrihd
FROM cthd c
JOIN hoadon d ON c.mahd = d.mahd
JOIN hang h ON c.mahg = h.mahg
GROUP BY mahd;

-- 5.12. Trong ngày d, hóa đơn nào có trị giá lớn nhất.
WITH GiaTriHD AS (
	SELECT d.mahd, SUM(h.dg * c.sl) AS giatrihd
	FROM cthd c
	JOIN hoadon d ON c.mahd = d.mahd
	JOIN hang h ON c.mahg = h.mahg
    WHERE DAY(d.ngaylap) = 10
	GROUP BY mahd
)
SELECT mahd, giatrihd
FROM GiaTriHD
WHERE giatrihd = (SELECT MAX(giatrihd) FROM GiaTriHD);

-- 5.13. Tính trị giá của từng hóa đơn trong quí 2 năm 2023.
SELECT d.mahd, SUM(h.dg * c.sl) AS giatrihd
FROM cthd c
JOIN hoadon d ON c.mahd = d.mahd
JOIN hang h ON c.mahg = h.mahg
WHERE YEAR(d.ngaylap) = 2023 AND QUARTER(d.ngaylap) = 2
GROUP BY mahd;

-- 5.14. Tính tổng trị giá của các hóa đơn trong từng tháng của năm 2023.
SELECT MONTH(d.ngaylap) AS thang, SUM(h.dg * c.sl) AS giatrihd
FROM cthd c
JOIN hoadon d ON c.mahd = d.mahd
JOIN hang h ON c.mahg = h.mahg
WHERE YEAR(d.ngaylap) = 2023
GROUP BY thang;

-- 5.15. Tính tổng trị giá của các hóa đơn trong từng quý của năm 2023.
SELECT QUARTER(d.ngaylap) AS quy, SUM(h.dg * c.sl) AS giatrihd
FROM cthd c
JOIN hoadon d ON c.mahd = d.mahd
JOIN hang h ON c.mahg = h.mahg
WHERE YEAR(d.ngaylap) = 2023
GROUP BY quy;

-- 5.16. Hóa đơn nào có trị giá lớn nhất.
WITH GiaTriHD AS (
	SELECT d.mahd, SUM(h.dg * c.sl) AS giatrihd
	FROM cthd c
	JOIN hoadon d ON c.mahd = d.mahd
	JOIN hang h ON c.mahg = h.mahg
	GROUP BY mahd
)
SELECT mahd, giatrihd
FROM GiaTriHD
WHERE giatrihd = (SELECT MAX(giatrihd) FROM GiaTriHD);

-- 5.17. Trong năm 2023, tháng nào có tổng trị giá các hóa đơn lớn nhất.
WITH GiaTriHD AS (
	SELECT MONTH(d.ngaylap) AS thang, SUM(h.dg * c.sl) AS giatrihd
	FROM cthd c
	JOIN hoadon d ON c.mahd = d.mahd
	JOIN hang h ON c.mahg = h.mahg
    WHERE YEAR(d.ngaylap) = 2023
	GROUP BY thang
)
SELECT thang, giatrihd
FROM GiaTriHD
WHERE giatrihd = (SELECT MAX(giatrihd) FROM GiaTriHD);

-- 5.18. Trong năm 2023, quý nào có tổng trị giá các hóa đơn lớn nhất.
WITH GiaTriHD AS (
	SELECT QUARTER(d.ngaylap) AS quy, SUM(h.dg * c.sl) AS giatrihd
	FROM cthd c
	JOIN hoadon d ON c.mahd = d.mahd
	JOIN hang h ON c.mahg = h.mahg
    WHERE YEAR(d.ngaylap) = 2023
	GROUP BY quy
)
SELECT quy, giatrihd
FROM GiaTriHD
WHERE giatrihd = (SELECT MAX(giatrihd) FROM GiaTriHD);

-- Thực hiện yêu cầu 6 --
