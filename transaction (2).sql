USE quanlyhocsinh;

DELIMITER //

CREATE PROCEDURE CheckAndCreateClasses()
BEGIN
    DECLARE v_class_exists INT;

    SELECT COUNT(*) INTO v_class_exists
    FROM phanlop
    WHERE MaLop IN ('L10A4', 'L11A4', 'L12A4') AND MaHocSinh IS NOT NULL;

    IF v_class_exists > 0 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Các lớp A4 đã có học sinh, không thể tạo mới';
    END IF;
END;

DELIMITER ;


START TRANSACTION;

	CALL CheckAndCreateClasses();
    
    INSERT INTO lop (MaLop, TenLop, MaKhoiLop, MaNamHoc, SiSo, MaGiaoVien)
    VALUES
        ('L10A4', 'Lớp 10A4', 'KHOI10', 'NH2122', 0, 'GV0028'),
        ('L11A4', 'Lớp 11A4', 'KHOI11', 'NH2122', 0, 'GV0029'),
        ('L12A4', 'Lớp 12A4', 'KHOI12', 'NH2122', 0, 'GV0030')
    ON DUPLICATE KEY UPDATE SiSo = SiSo;

    INSERT INTO phanlop (MaNamHoc, MaKhoiLop, MaLop, MaHocSinh)
    SELECT 'NH2122', 'KHOI10', 'L10A4', MaHocSinh
    FROM kq_hocsinh_canam
    WHERE MaNamHoc = 'NH2122' 
      AND MaLop IN ('L10A1', 'L10A2', 'L10A3') 
      AND MaKetQua = 'KQ0003';

    UPDATE lop
    SET SiSo = (
        SELECT COUNT(*)
        FROM phanlop
        WHERE MaLop = 'L10A4' AND MaNamHoc = 'NH2122'
    )
    WHERE MaLop = 'L10A4' AND MaNamHoc = 'NH2122';

    INSERT INTO phanlop (MaNamHoc, MaKhoiLop, MaLop, MaHocSinh)
    SELECT 'NH2122', 'KHOI11', 'L11A4', MaHocSinh
    FROM kq_hocsinh_canam
    WHERE MaNamHoc = 'NH2122' 
      AND MaLop IN ('L11A1', 'L11A2', 'L11A3') 
      AND MaKetQua = 'KQ0003';

    UPDATE lop
    SET SiSo = (
        SELECT COUNT(*)
        FROM phanlop
        WHERE MaLop = 'L11A4' AND MaNamHoc = 'NH2122'
    )
    WHERE MaLop = 'L11A4' AND MaNamHoc = 'NH2122';

    INSERT INTO phanlop (MaNamHoc, MaKhoiLop, MaLop, MaHocSinh)
    SELECT 'NH2122', 'KHOI12', 'L12A4', MaHocSinh
    FROM kq_hocsinh_canam
    WHERE MaNamHoc = 'NH2122' 
      AND MaLop IN ('L12A1', 'L12A2', 'L12A3') 
      AND MaKetQua = 'KQ0003';

    UPDATE lop
    SET SiSo = (
        SELECT COUNT(*)
        FROM phanlop
        WHERE MaLop = 'L12A4' AND MaNamHoc = 'NH2122'
    )
    WHERE MaLop = 'L12A4' AND MaNamHoc = 'NH2122';

    COMMIT;

DELIMITER ;
