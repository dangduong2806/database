USE quanlyhocsinh;
DELIMITER //

-- Đưa ra hạnh kiểm của tất cả học sinh trong lớp
CREATE PROCEDURE BaoCaoHanhKiemCuaLop(IN MaNamHoc VARCHAR(6), IN MaLop VARCHAR(10))
BEGIN
    SELECT 
        hocsinh.MaHocSinh,
        hocsinh.HoTen,
        hanhkiem.TenHanhKiem
    FROM 
        hocsinh
    JOIN 
        kq_hocsinh_canam ON hocsinh.MaHocSinh = kq_hocsinh_canam.MaHocSinh
    JOIN 
        hanhkiem ON kq_hocsinh_canam.MaHanhKiem = hanhkiem.MaHanhKiem
    WHERE 
        kq_hocsinh_canam.MaNamHoc = MaNamHoc
        AND kq_hocsinh_canam.MaLop = MaLop;
END;

-- Đưa ra điểm trung bình cả năm của tất cả học sinh trong lớp
CREATE PROCEDURE BaoCaoDiemTrungBinhCuaLop(IN MaNamHoc VARCHAR(6), IN MaLop VARCHAR(10))
BEGIN
    SELECT 
        hocsinh.MaHocSinh,
        hocsinh.HoTen,
        kq_hocsinh_canam.DiemTBCN
    FROM 
        hocsinh
    JOIN 
        kq_hocsinh_canam ON hocsinh.MaHocSinh = kq_hocsinh_canam.MaHocSinh
    WHERE 
        kq_hocsinh_canam.MaNamHoc = MaNamHoc
        AND kq_hocsinh_canam.MaLop = MaLop;
END;

-- Đưa ra kết quả lên lớp của tất cả học sinh trong lớp
CREATE PROCEDURE BaoCaoKetQuaNamHoc(IN MaNamHoc VARCHAR(6), IN MaLop VARCHAR(10))
BEGIN
    SELECT 
        hocsinh.MaHocSinh,
        hocsinh.HoTen,
        CASE 
            WHEN kq_hocsinh_canam.MaKetQua = 'KQ0001' THEN 'Lên lớp'
            WHEN kq_hocsinh_canam.MaKetQua = 'KQ0002' THEN 'Ở lại lớp'
            WHEN kq_hocsinh_canam.MaKetQua = 'KQ0003' THEN 'Rèn luyện hè'
            ELSE 'Không xác định'  -- Nếu có giá trị khác
        END AS KetQua
    FROM 
        hocsinh
    JOIN 
        kq_hocsinh_canam ON hocsinh.MaHocSinh = kq_hocsinh_canam.MaHocSinh
    WHERE 
        kq_hocsinh_canam.MaNamHoc = MaNamHoc
        AND kq_hocsinh_canam.MaLop = MaLop;
END;

