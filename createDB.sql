# create database quanlyhocsinh;
# use quanlyhocsinh;
#
# create table hanhkiem
# (
#     MaHanhKiem  varchar(6)                  not null
#         primary key,
#     TenHanhKiem varchar(30) charset utf8mb3 not null
# );
#
# create table hocky
# (
#     MaHocKy  varchar(3)                  not null
#         primary key,
#     TenHocKy varchar(30) charset utf8mb3 not null,
#     HeSo     int                         null
# );
#
# create table hocluc
# (
#     MaHocLuc     varchar(6)                  not null
#         primary key,
#     TenHocLuc    varchar(30) charset utf8mb3 not null,
#     DiemCanDuoi  float                       not null,
#     DiemCanTren  float                       not null,
#     DiemKhongChe float                       not null,
#     constraint CK_DiemCanDuoi
#         check (`DiemCanDuoi` between 0 and 10),
#     constraint CK_DiemCanTren
#         check (`DiemCanTren` between 0 and 10),
#     constraint CK_DiemKhongChe
#         check (`DiemKhongChe` between 0 and 10)
# );
#
# create table hocsinh
# (
#     MaHocSinh     varchar(6)                  not null
#         primary key,
#     HoTen         varchar(30) charset utf8mb3 not null,
#     GioiTinh      bit                         null,
#     NgaySinh      datetime                    null,
#     DiaChi        varchar(50) charset utf8mb3 not null,
#     DanToc        varchar(6)                  not null,
#     TonGiao       varchar(6)                  not null,
#     HoTenCha      varchar(30) charset utf8mb3 not null,
#     NgheNghiepCha varchar(6)                  not null,
#     HoTenMe       varchar(30) charset utf8mb3 not null,
#     NgheNghiepMe  varchar(6)                  not null,
#     Email         varchar(50) charset utf8mb3 not null,
#     constraint Email
#         unique (Email)
# );
#
# create index FK_HOCSINH_DANTOC
#     on hocsinh (DanToc);
#
# create index FK_HOCSINH_NGHENGHIEPCHA
#     on hocsinh (NgheNghiepCha);
#
# create index FK_HOCSINH_NGHENGHIEPME
#     on hocsinh (NgheNghiepMe);
#
# create index FK_HOCSINH_TONGIAO
#     on hocsinh (TonGiao);
#
# create table ketqua
# (
#     MaKetQua  varchar(6)                  not null
#         primary key,
#     TenKetQua varchar(30) charset utf8mb3 not null
# );
#
# create table khoilop
# (
#     MaKhoiLop  varchar(6)                  not null
#         primary key,
#     TenKhoiLop varchar(30) charset utf8mb3 not null
# );
#
# create table loaidiem
# (
#     MaLoai  varchar(6)                  not null
#         primary key,
#     TenLoai varchar(30) charset utf8mb3 not null,
#     HeSo    int                         not null
# );
#
# create table monhoc
# (
#     MaMonHoc  varchar(6)                  not null
#         primary key,
#     TenMonHoc varchar(30) charset utf8mb3 not null,
#     SoTiet    int                         not null,
#     HeSo      int                         not null
# );
#
# create table giaovien
# (
#     MaGiaoVien  varchar(6)                  not null
#         primary key,
#     TenGiaoVien varchar(30) charset utf8mb3 not null,
#     DiaChi      varchar(50) charset utf8mb3 not null,
#     DienThoai   varchar(15) charset utf8mb3 not null,
#     MaMonHoc    varchar(6)                  not null,
#     constraint FK_GIAOVIEN_MONHOC
#         foreign key (MaMonHoc) references monhoc (MaMonHoc)
# );
#
# create table namhoc
# (
#     MaNamHoc  varchar(6)                  not null
#         primary key,
#     TenNamHoc varchar(30) charset utf8mb3 not null
# );
#
# create table lop
# (
#     MaLop      varchar(10)                 not null
#         primary key,
#     TenLop     varchar(30) charset utf8mb3 not null,
#     MaKhoiLop  varchar(6)                  not null,
#     MaNamHoc   varchar(6)                  not null,
#     SiSo       int                         not null,
#     MaGiaoVien varchar(6)                  not null,
#     constraint FK_LOP_GIAOVIEN
#         foreign key (MaGiaoVien) references giaovien (MaGiaoVien),
#     constraint FK_LOP_KHOILOP
#         foreign key (MaKhoiLop) references khoilop (MaKhoiLop),
#     constraint FK_LOP_NAMHOC
#         foreign key (MaNamHoc) references namhoc (MaNamHoc)
# );
#
# create table diem
# (
#     STT       int         not null
#         primary key,
#     MaHocSinh varchar(6)  not null,
#     MaMonHoc  varchar(6)  not null,
#     MaHocKy   varchar(3)  not null,
#     MaNamHoc  varchar(6)  not null,
#     MaLop     varchar(10) not null,
#     MaLoai    varchar(6)  not null,
#     Diem      float       not null,
#     constraint FK_DIEM_HOCKY
#         foreign key (MaHocKy) references hocky (MaHocKy)
#             on update cascade on delete cascade,
#     constraint FK_DIEM_HOCSINH
#         foreign key (MaHocSinh) references hocsinh (MaHocSinh),
#     constraint FK_DIEM_LOAIDIEM
#         foreign key (MaLoai) references loaidiem (MaLoai)
#             on update cascade on delete cascade,
#     constraint FK_DIEM_LOP
#         foreign key (MaLop) references lop (MaLop),
#     constraint FK_DIEM_MONHOC
#         foreign key (MaMonHoc) references monhoc (MaMonHoc)
#             on update cascade on delete cascade,
#     constraint FK_DIEM_NAMHOC
#         foreign key (MaNamHoc) references namhoc (MaNamHoc)
#             on update cascade on delete cascade,
#     constraint CK_DIEM
#         check (`Diem` between 0 and 10)
# );
#
# create table kq_hocsinh_canam
# (
#     MaHocSinh  varchar(6)  not null,
#     MaLop      varchar(10) not null,
#     MaNamHoc   varchar(6)  not null,
#     MaHocLuc   varchar(6)  not null,
#     MaHanhKiem varchar(6)  not null,
#     MaKetQua   varchar(6)  not null,
#     DiemTBHK1  float       not null,
#     DiemTBHK2  float       not null,
#     DiemTBCN   float       not null,
#     primary key (MaHocSinh, MaLop, MaNamHoc),
#     constraint FK_KQHSCN_HANHKIEM
#         foreign key (MaHanhKiem) references hanhkiem (MaHanhKiem),
#     constraint FK_KQHSCN_HOCLUC
#         foreign key (MaHocLuc) references hocluc (MaHocLuc),
#     constraint FK_KQHSCN_HOCSINH
#         foreign key (MaHocSinh) references hocsinh (MaHocSinh),
#     constraint FK_KQHSCN_KETQUA
#         foreign key (MaKetQua) references ketqua (MaKetQua),
#     constraint FK_KQHSCN_LOP
#         foreign key (MaLop) references lop (MaLop),
#     constraint FK_KQHSCN_NAMHOC
#         foreign key (MaNamHoc) references namhoc (MaNamHoc),
#     constraint CK_DiemTBCN
#         check (`DiemTBCN` between 0 and 10),
#     constraint CK_DiemTBHK1
#         check (`DiemTBHK1` between 0 and 10),
#     constraint CK_DiemTBHK2
#         check (`DiemTBHK2` between 0 and 10)
# );
#
# create table kq_hocsinh_monhoc
# (
#     MaHocSinh    varchar(6)  not null,
#     MaLop        varchar(10) not null,
#     MaNamHoc     varchar(6)  not null,
#     MaMonHoc     varchar(6)  not null,
#     MaHocKy      varchar(3)  not null,
#     DiemMiengTB  float       not null,
#     Diem15PhutTB float       not null,
#     Diem45PhutTB float       not null,
#     DiemThi      float       not null,
#     DiemTBHK     float       not null,
#     primary key (MaHocSinh, MaLop, MaNamHoc, MaMonHoc, MaHocKy),
#     constraint FK_KQHSMH_HOCKY
#         foreign key (MaHocKy) references hocky (MaHocKy),
#     constraint FK_KQHSMH_HOCSINH
#         foreign key (MaHocSinh) references hocsinh (MaHocSinh),
#     constraint FK_KQHSMH_LOP
#         foreign key (MaLop) references lop (MaLop),
#     constraint FK_KQHSMH_MONHOC
#         foreign key (MaMonHoc) references monhoc (MaMonHoc),
#     constraint FK_KQHSMH_NAMHOC
#         foreign key (MaNamHoc) references namhoc (MaNamHoc),
#     constraint CK_Diem15PhutTB
#         check (`Diem15PhutTB` between 0 and 10),
#     constraint CK_Diem45PhutTB
#         check (`Diem45PhutTB` between 0 and 10),
#     constraint CK_DiemMiengTB
#         check (`DiemMiengTB` between 0 and 10),
#     constraint CK_DiemTBHK
#         check (`DiemTBHK` between 0 and 10),
#     constraint CK_DiemThi
#         check (`DiemThi` between 0 and 10)
# );
#
# create table kq_lophoc_hocky
# (
#     MaLop      varchar(10) not null,
#     MaNamHoc   varchar(6)  not null,
#     MaHocKy    varchar(3)  not null,
#     SoLuongDat int         not null,
#     TiLe       float       not null,
#     primary key (MaLop, MaNamHoc, MaHocKy),
#     constraint FK_KQLHHK_HOCKY
#         foreign key (MaHocKy) references hocky (MaHocKy),
#     constraint FK_KQLHHK_LOP
#         foreign key (MaLop) references lop (MaLop)
#             on update cascade on delete cascade,
#     constraint FK_KQLHHK_NAMHOC
#         foreign key (MaNamHoc) references namhoc (MaNamHoc)
#             on update cascade on delete cascade
# );
#
# create table kq_lophoc_monhoc
# (
#     MaLop      varchar(10) not null,
#     MaNamHoc   varchar(6)  not null,
#     MaMonHoc   varchar(6)  not null,
#     MaHocKy    varchar(3)  not null,
#     SoLuongDat int         not null,
#     TiLe       float       not null,
#     primary key (MaLop, MaNamHoc, MaMonHoc, MaHocKy),
#     constraint FK_KQLHMH_HOCKY
#         foreign key (MaHocKy) references hocky (MaHocKy),
#     constraint FK_KQLHMH_LOP
#         foreign key (MaLop) references lop (MaLop),
#     constraint FK_KQLHMH_MONHOC
#         foreign key (MaMonHoc) references monhoc (MaMonHoc),
#     constraint FK_KQLHMH_NAMHOC
#         foreign key (MaNamHoc) references namhoc (MaNamHoc)
# );
#
# create table phancong
# (
#     STT        int         not null
#         primary key,
#     MaNamHoc   varchar(6)  not null,
#     MaLop      varchar(10) not null,
#     MaMonHoc   varchar(6)  not null,
#     MaGiaoVien varchar(6)  not null,
#     constraint FK_PHANCONG_GIAOVIEN
#         foreign key (MaGiaoVien) references giaovien (MaGiaoVien),
#     constraint FK_PHANCONG_LOP
#         foreign key (MaLop) references lop (MaLop),
#     constraint FK_PHANCONG_MONHOC
#         foreign key (MaMonHoc) references monhoc (MaMonHoc),
#     constraint FK_PHANCONG_NAMHOC
#         foreign key (MaNamHoc) references namhoc (MaNamHoc)
# );
#
# create table phanlop
# (
#     MaNamHoc  varchar(6)  not null,
#     MaKhoiLop varchar(6)  not null,
#     MaLop     varchar(10) not null,
#     MaHocSinh varchar(6)  not null,
#     primary key (MaNamHoc, MaKhoiLop, MaLop, MaHocSinh),
#     constraint FK_PHANLOP_HOCSINH
#         foreign key (MaHocSinh) references hocsinh (MaHocSinh),
#     constraint FK_PHANLOP_KHOI
#         foreign key (MaKhoiLop) references khoilop (MaKhoiLop),
#     constraint FK_PHANLOP_LOP
#         foreign key (MaLop) references lop (MaLop),
#     constraint FK_PHANLOP_NAMHOC
#         foreign key (MaNamHoc) references namhoc (MaNamHoc)
# );
