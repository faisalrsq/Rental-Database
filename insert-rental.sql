insert into Outlet values('11-222-333-444', 'Sumber Bahagia', 'Jln. Veteran', '0812345678', '10','10','10')


insert into Cabang_Motor values('11-222-333-444', '200', 'Jln. Sigura-gura', '0341 533521')

insert into Motor values ('2-01','200','Yamaha','Manual','Hitam','N 1123 AN','Jupiter MX King',60000,NULL)
insert into Motor values ('2-02','200','Yamaha','Matic','Merah','N 2312 AH','Mio Fino',65000,NULL)
insert into Motor values ('2-03','200','Honda','Manual','Oranye','W 4242 BJ','Blade ',70000,NULL)
insert into Motor values ('2-04','200','Honda','Matic','Putih','L 7778 DD','Vario',63000,NULL)
insert into Motor values ('2-05','200','Yamaha','Matic','Biru','N 9976 BC','Aerox',75000,NULL)
insert into Motor values ('2-06','200','Yamaha','Manual','Merah','N 3153 DC','Jupiter Z1',70000,NULL)
insert into Motor values ('2-07','200','Suzuki','Manual','Hitam','N 7326 BE','Thunder',65000,NULL)
insert into Motor values ('2-08','200','Yamaha','Manual','Hitam','N 1145 AN','Jupiter MX King',80000,NULL)
insert into Motor values ('2-09','200','Yamaha','Matic','Biru','W 9987 LR','Mio',60000,NULL)
insert into Motor values ('2-10','200','Honda','Matic','Merah','N 4375 AD','Beat',60000,NULL)

insert into Cabang_Mobil values('11-222-333-444', '300', 'Jln. Soekarno Hatta', '0341 432122')

insert into Mobil values ('3-01','300','Honda','Matic','Hitam','N 1212 NN','Jazz',250000,NULL)
insert into Mobil values ('3-02','300','Toyota','Matic','Silver','N 1313 MB','Avanza',200000,NULL)
insert into Mobil values ('3-03','300','Mitsubishi','Matic','Putih','N 1414 OS','Pajero',400000,NULL)
insert into Mobil values ('3-04','300','Suzuki','Manual','Merah','N 1515 AA','Ertiga',250000,NULL)
insert into Mobil values ('3-05','300','Hyundai','Matic','Hitam','W 2131 TA','H1',500000,NULL)
insert into Mobil values ('3-06','300','Mazda','Matic','Silver','L 0550 BS','Biante',300000,NULL)
insert into Mobil values ('3-07','300','Nissan','Matic','Merah','N 4554 SW','Juke',300000,NULL)
insert into Mobil values ('3-08','300','Chevrolet','Matic','Merah','N 3333 QW','Spin',250000,NULL)
insert into Mobil values ('3-09','300','Ford','Manual','Putih','L 1121 AA','Focus',400000,NULL)
insert into Mobil values ('3-10','300','Mitsubishi','Matic','Expander','N 6677 AW','H1',500000,NULL)

insert into Cabang_Sepeda values('11-222-333-444', '100', 'Jln. Borobudur', '0341 478322')

insert into Sepeda values ('1-01','100','Polygon','MTB','Hitam',40000,NULL)
insert into Sepeda values ('1-02','100','Wim Cycle','BMX','Hitam',35000,NULL)
insert into Sepeda values ('1-03','100','Polygon','Hybrid','Hitam',30000,NULL)
insert into Sepeda values ('1-04','100','United','BMX','Hitam',35000,NULL)
insert into Sepeda values ('1-05','100','Giant','MTB','Hitam',40000,NULL)
insert into Sepeda values ('1-06','100','Polygon','Balap','Hitam',50000,NULL)
insert into Sepeda values ('1-07','100','United Bike','BMX','Hitam',35000,NULL)
insert into Sepeda values ('1-08','100','Wim Cycle','MTB','Hitam',40000,NULL)
insert into Sepeda values ('1-09','100','Polygon','Hybrid','Hitam',30000,NULL)
insert into Sepeda values ('1-10','100','Giant','BMX','Hitam',35000,NULL)

/*Menampilkan data yang belum di sewa, No_Sewa = NULL*/
select * from motor where No_Sewa is Null

/*STEP INPUT COSTUMER BARU*/

/*1. Memasukkan consumer baru*/
insert into penyewa values ('12344','Faisal','jljl','081')

/*2. Costumer meminjam motor, dengan memasukkan No_Sewa*/
insert into menyewa values ('001','12345','2016/07/25','2017/07/26',60000,2,NULL)

/*3. Mengupdate Total Biaya, agar sesuai dengan harga lama sewa*/
update menyewa
set Total_Biaya = Biaya * Lama_Sewa
where No_Sewa = 001

/*4. Mengupdate No_sewa pada motor, menandakan bahwa motor telah disewa*/
update motor 
set No_sewa = '001'
where No_motor = '2-01'

/*Mencari data yang masih tersedia, belum dipinjam*/
select * from Mobil
where No_sewa is NULL

select motor.No_Motor,Penyewa.Nama, Motor.Tipe, Menyewa.Total_Biaya
from motor
full outer join Menyewa on Motor.No_sewa = Menyewa.No_Sewa
full outer join Penyewa on Menyewa.No_KTP = Penyewa.No_KTP
