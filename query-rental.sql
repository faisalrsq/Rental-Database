create database Rental

create table Outlet(
	NPWP varchar(23) constraint pk_outlet primary key,
	Nama varchar(50),
	Alamat varchar(50),
	No_telp varchar(12),
	Jumlah_Mobil integer,
	Jumlah_Motor integer,
	Jumlah_Sepeda integer,
);

create table Cabang_Motor(
	NPWP varchar(23) constraint fk_cmotor foreign key references Outlet(NPWP),
	No_cabang varchar(5) constraint pk_cmotor primary key,
	Alamat varchar(50),
	No_telp varchar(12),
	
);


create table Motor(
	No_motor varchar(5) constraint pk_motor primary key,
	No_Cabang varchar (5) foreign key references Cabang_Motor (No_Cabang),
	Merk varchar(20),
	Jenis varchar(20),
	Warna varchar(20),
	Plat_nomor varchar(10) unique,
	Tipe varchar(25),
	Biaya integer,
	No_sewa varchar(20) foreign key references Menyewa(No_Sewa),
);

create table Cabang_Mobil(
NPWP varchar(23) foreign key references Outlet(NPWP),
No_Cabang varchar(5) primary key,
Alamat varchar(50),
No_telp varchar(12),

);

create table Mobil(
	No_Mobil varchar(5) primary key,
	No_Cabang varchar (5) foreign key references Cabang_Mobil (No_Cabang),
	Merk varchar(20),
	Jenis varchar(20),
	Warna varchar(20),
	Plat_nomor varchar(10),
	Tipe varchar(25),
	Biaya integer,
	No_sewa varchar(20) foreign key references Menyewa(No_Sewa) default NULL
	
);

create table Cabang_Sepeda(
NPWP varchar(23) foreign key references Outlet(NPWP),
No_Cabang varchar(5) primary key,
Alamat varchar(50),
No_telp varchar(12),
);

create table Sepeda(
	No_Sepeda varchar(5) primary key,
	No_Cabang varchar (5) foreign key references Cabang_Sepeda (No_Cabang),
	Merk varchar(20),
	Jenis varchar(20),
	Warna varchar(20),
	Biaya integer,
	No_sewa varchar(20)foreign key references Menyewa(No_Sewa) default NULL
	
);

create table Penyewa(
No_KTP varchar(25) primary key,
Nama varchar(25),
Alamat varchar(50),
No_telp varchar(12),
);

create table Menyewa(
No_Sewa varchar(20) primary key,
No_KTP varchar(25) foreign key references Penyewa(No_KTP),
Tgl_Sewa date,
Tgl_Kembali date,
Biaya integer,
Lama_Sewa integer,
Total_Biaya integer default NULL
);



