USE quanlyhocsinh;

DELIMITER //

-- Tự động cập nhật sĩ số lớp khi học sinh được phân vào lớp
CREATE TRIGGER AfterInsertPhanLop
AFTER INSERT ON phanlop
FOR EACH ROW
BEGIN
    UPDATE lop
    SET SiSo = SiSo + 1
    WHERE MaLop = NEW.MaLop;
END;

-- Tự động tính lại sĩ số lớp khi xóa học sinh
CREATE TRIGGER AfterDeletePhanLop
AFTER DELETE ON phanlop
FOR EACH ROW
BEGIN
    UPDATE lop
    SET SiSo = SiSo - 1
    WHERE MaLop = OLD.MaLop;
END;

-- Tự động kiểm tra trùng email khi thêm học sinh
CREATE TRIGGER BeforeInsertHocSinh
BEFORE INSERT ON hocsinh
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM hocsinh WHERE Email = NEW.Email) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Email đã tồn tại trong hệ thống!';
    END IF;
END;