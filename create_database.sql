
drop database if exists CSDL_BAN_HANG;

create database CSDL_BAN_HANG;
use CSDL_BAN_HANG;

-- 
create table QUAN_LY (
    id_quan_ly int auto_increment primary key,
    ten_quan_ly varchar(100) not null,
    dien_thoai int not null,
    dia_chi varchar(255)
);

create table TAI_KHOAN (
    id_tai_khoan int auto_increment primary key,
    ten_dang_nhap varchar(50) not null,
    mat_khau varchar(50) not null,
    nhan_vien int not null
);

create table NHAN_VIEN (
    id_nhan_vien int auto_increment primary key,
    ten_nhan_vien varchar(100) not null,
    dien_thoai int not null,
    dia_chia varchar(255),
    duoc_cap_quyen boolean not null,
    nguoi_quan_ly int not null,
    tai_khoan int not null,
    foreign key (nguoi_quan_ly) references QUAN_LY(id_quan_ly),
    foreign key (tai_khoan) references TAI_KHOAN(id_tai_khoan)
);

alter table TAI_KHOAN add constraint 
foreign key (nhan_vien) references NHAN_VIEN(id_nhan_vien);

create table KHACH_HANG ( 
    id_kh int auto_increment primary key,
    ten_kh varchar(100) not null,
    dien_thoai int not null,
    dia_chi varchar(255)
);

create table NHA_CUNG_CAP (
    id_nha_cc int auto_increment primary key,
    ten_nha_cc varchar(100) not null,
    dien_thoai int not null,
    dia_chi varchar(255) not null
);

create table LIST_HANG_HOA (
    ma_hang_hoa int auto_increment primary key,
    ten_hang_hoa varchar(100) not null
);

create table BAN_LE (
    id_ban_le int auto_increment primary key,
    ten_hang_hoa int not null,
    gia_mua decimal(10,2) not null,
    ngay_mua datetime not null,
    gia_ban decimal(10,2) not null,
    ngay_ban datetime,
    don_vi_tinh varchar(50) not null,
    so_luong int not null,
    gia_binh_quan decimal(10,2) not null
);

create table HANG_HOA_BAN_LE (
    ma_hang_hoa int not null,
    id_ban_le int not null,
    primary key (ma_hang_hoa, id_ban_le),
    foreign key (ma_hang_hoa) references LIST_HANG_HOA(ma_hang_hoa),
    foreign key (id_ban_le) references BAN_LE(id_ban_le)
);

create table BAN_SI (
    id_ban_si int auto_increment primary key,
    ten_hang_hoa int not null,
    gia_mua decimal(10,2) not null,
    ngay_mua datetime not null,
    gia_ban decimal(10,2),
    ngay_ban datetime not null,
    don_vi_tinh varchar(50) not null,
    so_luong int not null,
    gia_binh_quan decimal(10,2) not null
);

create table HANG_HOA_BAN_SI (
    ma_hang_hoa int not null,
    id_ban_si int not null,
    primary key (ma_hang_hoa, id_ban_si),
    foreign key (ma_hang_hoa) references LIST_HANG_HOA(ma_hang_hoa),
    foreign key (id_ban_si) references BAN_SI(id_ban_si)
);

create table DON_BAN (
    id_don_ban int auto_increment primary key,
    don_ban_ct int not null,
    khach_hang int not null,
    ngay_mua date not null,
    gia_tong decimal(10, 2) not null,
    nhan_vien_ghi_don int not null,
    foreign key (khach_hang) references KHACH_HANG(id_kh),
    foreign key (nhan_vien_ghi_don) references NHAN_VIEN(id_nhan_vien)
);

create table DON_BAN_CHI_TIET (
    id_don_ban_ct int auto_increment primary key,
    id_don_ban int not null,
    ma_hang_hoa int not null,
    gia_mua decimal(10,2) not null,
    gia_ban decimal(10,2) not null,
    don_vi_tinh varchar(50) not null,
    so_luong int not null,
    thanh_tien decimal(10,2) not null,
    foreign key (id_don_ban) references DON_BAN(id_don_ban),
    foreign key (ma_hang_hoa) references LIST_HANG_HOA(ma_hang_hoa)
);

alter table DON_BAN add constraint
foreign key (don_ban_ct) references DON_BAN_CHI_TIET(id_don_ban_ct);

create table DON_MUA (
    id_don_mua int auto_increment primary key,
    don_mua_ct int not null,
    nha_cung_cap int not null,
    ngay_mua date not null,
    gia_tong decimal(10, 2) not null,
    nhan_vien_ghi_don int not null,
    foreign key (nha_cung_cap) references NHA_CUNG_CAP(id_nha_cc),
    foreign key (nhan_vien_ghi_don) references NHAN_VIEN(id_nhan_vien)
);

create table DON_MUA_CHI_TIET (
    id_don_mua_ct int auto_increment primary key,
    id_don_mua int not null,
    ma_hang_hoa int not null,
    gia_mua decimal(10,2) not null,
    gia_ban decimal(10,2) not null,
    don_vi_tinh varchar(50) not null,
    so_luong int not null,
    thanh_tien decimal(10,2) not null,
    foreign key (id_don_mua) references DON_MUA(id_don_mua),
    foreign key (ma_hang_hoa) references LIST_HANG_HOA(ma_hang_hoa)
);

alter table DON_MUA add constraint
foreign key (don_mua_ct) references DON_MUA_CHI_TIET(id_don_mua_ct);



