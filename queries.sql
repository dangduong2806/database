-- INNER JOIN
-- 1
SELECT  l.MaLop, l.TenLop, nh.TenNamHoc, kl.TenKhoiLop
FROM lop l
INNER JOIN namhoc nh ON l.MaNamHoc = nh.MaNamHoc
INNER JOIN khoilop kl ON l.MaKhoiLop = kl.MaKhoiLop;

-- 2
SELECT hs.HoTen AS TenHocSinh,l.TenLop,
       kq.DiemTBHK1, 
       kq.DiemTBHK2, 
       kq.DiemTBCN
FROM hocsinh hs
INNER JOIN kq_hocsinh_canam kq 
   ON hs.MaHocSinh = kq.MaHocSinh
INNER JOIN quanlyhocsinh.lop l on kq.MaLop = l.MaLop
where l.TenLop = 'Lớp 10A1' and kq.MaNamHoc = 'NH2122';

-- OUTER JOIN
-- LEFT OUTER JOIN
SELECT hs.MaHocSinh, hs.HoTen, kq.MaNamHoc, kq.MaMonHoc, kq.MaHocKy, kq.DiemThi
FROM hocsinh hs
LEFT JOIN kq_hocsinh_monhoc kq ON hs.MaHocSinh = kq.MaHocSinh
where hs.HoTen = 'Nguyen Van An' and kq.MaHocKy = 'HK1' and kq.MaNamHoc = 'NH2122';

-- RIGHT OUTER JOIN
SELECT gv.TenGiaoVien, mh.TenMonHoc
FROM giaovien gv
RIGHT JOIN monhoc mh ON gv.MaMonHoc = mh.MaMonHoc;

-- SUBQUERY IN WHERE
-- 1
SELECT kq.MaHocSinh, hs.HoTen, kq.DiemTBHK1, kq.DiemTBHK2, kq.DiemTBCN
FROM kq_hocsinh_canam kq
JOIN hocsinh hs ON kq.MaHocSinh = hs.MaHocSinh
WHERE kq.MaNamHoc = 'NH2122' and kq.MaLop = 'L12A3' and kq.DiemTBHK1 > (SELECT AVG(DiemTBHK1) FROM kq_hocsinh_canam)
  AND kq.DiemTBHK2 > (SELECT AVG(DiemTBHK2) FROM kq_hocsinh_canam)
  AND kq.DiemTBCN  > (SELECT AVG(DiemTBCN) FROM kq_hocsinh_canam);

-- 2
SELECT gv.TenGiaoVien
FROM giaovien gv
WHERE gv.MaMonHoc = (
    SELECT mh.MaMonHoc 
    FROM monhoc mh
    ORDER BY mh.HeSo DESC
    LIMIT 1
);

-- SUBQUERY IN FROM
-- 1 
SELECT t.MaHocSinh, t.AvgScore
FROM (
    SELECT MaHocSinh, ROUND(AVG(DiemTBHK),1) AS AvgScore
    FROM kq_hocsinh_monhoc where MaNamHoc = 'NH2122' and MaLop = 'L11A2'
    GROUP BY MaHocSinh
) t
WHERE t.AvgScore > 8;

-- 2
SELECT l.TenLop, dcount.SoLuongDat
FROM lop l
JOIN (
    SELECT MaLop, COUNT(*) AS SoLuongDat
    FROM kq_hocsinh_canam
    WHERE DiemTBCN > 5 and MaNamHoc = 'NH2122'
    GROUP BY MaLop
) dcount ON l.MaLop = dcount.MaLop;


-- GROUP BY và cac hàm ( AVG, COUNT, SUM,...)
-- 1
SELECT l.TenLop, nh.TenNamHoc, 
       SUM(kq.DiemTBCN >= 5) AS SoLuongDat,
       ROUND(AVG(kq.DiemTBCN), 1) AS DiemTBCN
FROM kq_hocsinh_canam kq
JOIN lop l ON kq.MaLop = l.MaLop
JOIN namhoc nh ON kq.MaNamHoc = nh.MaNamHoc
GROUP BY l.MaLop, nh.MaNamHoc;


-- 2
SELECT gv.TenGiaoVien,
       COUNT(DISTINCT gv.MaMonHoc) AS SoMonGiangDay,
       SUM(mh.SoTiet)*count(p.MaGiaoVien) AS TongSoTietGiangDay
FROM giaovien gv
JOIN monhoc mh ON gv.MaMonHoc = mh.MaMonHoc
join phancong p on gv.MaGiaoVien = p.MaGiaoVien
where p.MaNamHoc = 'NH2122'
GROUP BY gv.MaGiaoVien;




