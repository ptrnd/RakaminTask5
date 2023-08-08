CREATE DATABASE kimiafarmadb;

USE kimiafarmadb;

CREATE TABLE penjualan(
	id_distributor VARCHAR(100),
    id_cabang VARCHAR(100),
    id_invoice VARCHAR(100),
	tanggal DATE,
	id_customer VARCHAR(100),
	id_barang VARCHAR(100),
	jumlah_barang INT,
	unit VARCHAR(100),
	harga DECIMAL(10,2),
	mata_uang VARCHAR(100),
    brand_id VARCHAR(100),
    lini VARCHAR(100)
);

CREATE TABLE pelanggan(
	id_customer VARCHAR(100),
	level VARCHAR(100),
	nama VARCHAR(100),
	id_cabang_sales VARCHAR(100),
	cabang_sales VARCHAR(100),
	id_grup VARCHAR(100),
	grup VARCHAR(100)
);

CREATE TABLE barang(  
    kode_barang varchar(100),
    sektor varchar(100),
    nama_barang varchar(100),  
    tipe varchar(100),
    nama_tipe varchar(100),
    kode_lini int,
    lini varchar(100),
    kemasan varchar(100)
);

-- mengambil data barang dan pelanggan dari file csv ke dalam tabel database kimia_farma
-- mohon maaf, saya sensor directory folder saya menjadi "path"
LOAD DATA INFILE 'path/barang.csv'
INTO TABLE barang
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'path/pelanggan.csv'
INTO TABLE pelanggan
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- loading data dari csv ke database dengan format yang menyesuaikan tanggal yang ada di dalam dataset penjualan.csv dan 
-- mengubah data harga yang awalnya string menjadi angka desimal serta menyesuaikan koma dengan titik desimal
LOAD DATA INFILE 'path/penjualan.csv'
INTO TABLE penjualan
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_distributor, id_cabang, id_invoice, @tanggal, id_customer, id_barang, jumlah_barang, unit, @harga, mata_uang, brand_id, lini)
SET 
	tanggal = STR_TO_DATE(@tanggal, '%d/%m/%Y'),
	harga = CAST(REPLACE(@harga, ',', '.') AS DECIMAL(10,2));