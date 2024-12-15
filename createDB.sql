# create database quanlyhocsinh;
use quanlyhocsinh;
create table hanhkiem
(
    MaHanhKiem  varchar(6)                  not null
        primary key,
    TenHanhKiem varchar(30) charset utf8mb3 not null
);

create table hocky
(
    MaHocKy  varchar(3)                  not null
        primary key,
    TenHocKy varchar(30) charset utf8mb3 not null,
    HeSo     int                         null
);

create table hocluc
(
    MaHocLuc     varchar(6)                  not null
        primary key,
    TenHocLuc    varchar(30) charset utf8mb3 not null,
    DiemCanDuoi  float                       not null,
    DiemCanTren  float                       not null,
    DiemKhongChe float                       not null
);

create table hocsinh
(
    MaHocSinh     varchar(6)                  not null
        primary key,
    HoTen         varchar(30) charset utf8mb3 not null,
    GioiTinh      bit                         null,
    NgaySinh      datetime                    null,
    DiaChi        varchar(50) charset utf8mb3 not null,
    DanToc        varchar(6)                  not null,
    TonGiao       varchar(60)                 null,
    HoTenCha      varchar(30) charset utf8mb3 not null,
    NgheNghiepCha varchar(60)                 null,
    HoTenMe       varchar(30) charset utf8mb3 not null,
    NgheNghiepMe  varchar(60)                 null,
    Email         varchar(50) charset utf8mb3 not null
);

create index FK_HOCSINH_DANTOC
    on hocsinh (DanToc);

create index FK_HOCSINH_NGHENGHIEPCHA
    on hocsinh (NgheNghiepCha);

create index FK_HOCSINH_NGHENGHIEPME
    on hocsinh (NgheNghiepMe);

create index FK_HOCSINH_TONGIAO
    on hocsinh (TonGiao);

create table ketqua
(
    MaKetQua  varchar(6)                  not null
        primary key,
    TenKetQua varchar(30) charset utf8mb3 not null
);

create table khoilop
(
    MaKhoiLop  varchar(6)                  not null
        primary key,
    TenKhoiLop varchar(30) charset utf8mb3 not null
);

create table monhoc
(
    MaMonHoc  varchar(6)                  not null
        primary key,
    TenMonHoc varchar(30) charset utf8mb3 not null,
    SoTiet    int                         not null,
    HeSo      int                         not null
);

create table giaovien
(
    MaGiaoVien  varchar(6)                  not null
        primary key,
    TenGiaoVien varchar(30) charset utf8mb3 not null,
    DiaChi      varchar(50) charset utf8mb3 not null,
    DienThoai   varchar(15) charset utf8mb3 not null,
    MaMonHoc    varchar(6)                  not null
);

create table namhoc
(
    MaNamHoc  varchar(6)                  not null
        primary key,
    TenNamHoc varchar(30) charset utf8mb3 not null
);

create table lop
(
    MaLop      varchar(10)                 not null
        primary key,
    TenLop     varchar(30) charset utf8mb3 not null,
    MaKhoiLop  varchar(6)                  not null,
    MaNamHoc   varchar(6)                  not null,
    SiSo       int                         not null,
    MaGiaoVien varchar(6)                  not null
);

create table kq_hocsinh_canam
(
    MaHocSinh  varchar(6)  not null,
    MaLop      varchar(10) not null,
    MaNamHoc   varchar(6)  not null,
    MaHocLuc   varchar(6)  not null,
    MaHanhKiem varchar(6)  not null,
    MaKetQua   varchar(6)  not null,
    DiemTBHK1  float       not null,
    DiemTBHK2  float       not null,
    DiemTBCN   float       not null,
    primary key (MaHocSinh, MaLop, MaNamHoc)
);

create table kq_hocsinh_monhoc
(
    MaHocSinh    varchar(6)  not null,
    MaLop        varchar(10) not null,
    MaNamHoc     varchar(6)  not null,
    MaMonHoc     varchar(6)  not null,
    MaHocKy      varchar(3)  not null,
    DiemMiengTB  float       not null,
    Diem15PhutTB float       not null,
    Diem45PhutTB float       not null,
    DiemThi      float       not null,
    DiemTBHK     float       not null,
    primary key (MaHocSinh, MaLop, MaNamHoc, MaMonHoc, MaHocKy)
);

create table kq_lophoc_hocky
(
    MaLop      varchar(10) not null,
    MaNamHoc   varchar(6)  not null,
    MaHocKy    varchar(3)  not null,
    SoLuongDat int         not null,
    primary key (MaLop, MaNamHoc, MaHocKy)
);

create table kq_lophoc_monhoc
(
    MaLop      varchar(10) not null,
    MaNamHoc   varchar(6)  not null,
    MaMonHoc   varchar(6)  not null,
    MaHocKy    varchar(3)  not null,
    SoLuongDat int         not null,
    primary key (MaLop, MaNamHoc, MaMonHoc, MaHocKy)
);

create table phancong
(
    STT        int         not null
        primary key,
    MaNamHoc   varchar(6)  not null,
    MaLop      varchar(10) not null,
    MaMonHoc   varchar(6)  not null,
    MaGiaoVien varchar(6)  not null
);

create table phanlop
(
    MaNamHoc  varchar(6)  not null,
    MaKhoiLop varchar(6)  not null,
    MaLop     varchar(10) not null,
    MaHocSinh varchar(6)  not null,
    primary key (MaNamHoc, MaKhoiLop, MaLop, MaHocSinh)
);

