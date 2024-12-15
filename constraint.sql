alter table hocluc
    add constraint CK_DiemCanDuoi
    check (`DiemCanDuoi` between 0 and 10),
    add constraint CK_DiemCanTren
    check (`DiemCanTren` between 0 and 10),
    add constraint CK_DiemKhongChe
    check (`DiemKhongChe` between 0 and 10);

alter table hocsinh
add constraint Email
    unique (Email);

alter table giaovien
add constraint FK_GIAOVIEN_MONHOC
    foreign key (MaMonHoc) references monhoc (MaMonHoc);

alter table lop
add constraint FK_LOP_GIAOVIEN
    foreign key (MaGiaoVien) references giaovien (MaGiaoVien),
add constraint FK_LOP_KHOILOP
    foreign key (MaKhoiLop) references khoilop (MaKhoiLop),
add constraint FK_LOP_NAMHOC
    foreign key (MaNamHoc) references namhoc (MaNamHoc);

alter table kq_hocsinh_canam
add constraint FK_KQHSCN_HANHKIEM
    foreign key (MaHanhKiem) references hanhkiem (MaHanhKiem),
add constraint FK_KQHSCN_HOCLUC
    foreign key (MaHocLuc) references hocluc (MaHocLuc),
add constraint FK_KQHSCN_HOCSINH
    foreign key (MaHocSinh) references hocsinh (MaHocSinh),
add constraint FK_KQHSCN_KETQUA
    foreign key (MaKetQua) references ketqua (MaKetQua),
add constraint FK_KQHSCN_LOP
    foreign key (MaLop) references lop (MaLop),
add constraint FK_KQHSCN_NAMHOC
    foreign key (MaNamHoc) references namhoc (MaNamHoc),
add constraint CK_DiemTBCN
check (`DiemTBCN` between 0 and 10),
add constraint CK_DiemTBHK1
check (`DiemTBHK1` between 0 and 10),
add constraint CK_DiemTBHK2
check (`DiemTBHK2` between 0 and 10);

alter table kq_hocsinh_monhoc
add constraint FK_KQHSMH_HOCKY
    foreign key (MaHocKy) references hocky (MaHocKy),
add constraint FK_KQHSMH_HOCSINH
    foreign key (MaHocSinh) references hocsinh (MaHocSinh),
add constraint FK_KQHSMH_LOP
    foreign key (MaLop) references lop (MaLop),
add constraint FK_KQHSMH_MONHOC
    foreign key (MaMonHoc) references monhoc (MaMonHoc),
add constraint FK_KQHSMH_NAMHOC
    foreign key (MaNamHoc) references namhoc (MaNamHoc),
add constraint CK_Diem15PhutTB
check (`Diem15PhutTB` between 0 and 10),
add constraint CK_Diem45PhutTB
check (`Diem45PhutTB` between 0 and 10),
add constraint CK_DiemMiengTB
check (`DiemMiengTB` between 0 and 10),
add constraint CK_DiemTBHK
check (`DiemTBHK` between 0 and 10),
add constraint CK_DiemThi
check (`DiemThi` between 0 and 10);

alter table kq_lophoc_hocky
add constraint FK_KQLHHK_HOCKY
    foreign key (MaHocKy) references hocky (MaHocKy),
add constraint FK_KQLHHK_LOP
    foreign key (MaLop) references lop (MaLop)
    on update cascade on delete cascade,
add constraint FK_KQLHHK_NAMHOC
    foreign key (MaNamHoc) references namhoc (MaNamHoc)
       on update cascade on delete cascade;

alter table kq_lophoc_monhoc
add constraint FK_KQLHMH_HOCKY
    foreign key (MaHocKy) references hocky (MaHocKy),
add constraint FK_KQLHMH_LOP
    foreign key (MaLop) references lop (MaLop),
add constraint FK_KQLHMH_MONHOC
    foreign key (MaMonHoc) references monhoc (MaMonHoc),
add constraint FK_KQLHMH_NAMHOC
    foreign key (MaNamHoc) references namhoc (MaNamHoc);

alter table phancong
add constraint FK_PHANCONG_GIAOVIEN
    foreign key (MaGiaoVien) references giaovien (MaGiaoVien),
add constraint FK_PHANCONG_LOP
    foreign key (MaLop) references lop (MaLop),
add constraint FK_PHANCONG_MONHOC
    foreign key (MaMonHoc) references monhoc (MaMonHoc),
add constraint FK_PHANCONG_NAMHOC
    foreign key (MaNamHoc) references namhoc (MaNamHoc);

alter table phanlop
add constraint FK_PHANLOP_HOCSINH
    foreign key (MaHocSinh) references hocsinh (MaHocSinh),
add constraint FK_PHANLOP_KHOI
    foreign key (MaKhoiLop) references khoilop (MaKhoiLop),
add constraint FK_PHANLOP_LOP
    foreign key (MaLop) references lop (MaLop),
add constraint FK_PHANLOP_NAMHOC
    foreign key (MaNamHoc) references namhoc (MaNamHoc);