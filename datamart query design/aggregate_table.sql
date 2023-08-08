CREATE TABLE aggregate_table (
SELECT
	id_invoice,
	tanggal,
    MONTHNAME(tanggal) bulan,
    nama nama_pelanggan,
	nama_barang,
    cabang_sales lokasi_sales,
    jumlah_barang jumlah_terjual,
    harga,
    lini merk, 
	(jumlah_barang*harga) total_pendapatan
FROM base_table
ORDER BY 2, 4, 5, 6, 7, 8, 9, 10);