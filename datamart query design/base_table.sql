CREATE TABLE base_table (
SELECT
    pj.id_invoice,
    pj.id_distributor,
    pj.id_cabang,
    pj.tanggal,
    pj.id_customer,
    pj.id_barang,
    pj.jumlah_barang,
    pj.harga,
    pj.mata_uang,
    pl.level,
	pl.nama,
	pl.id_cabang_sales,
	pl.cabang_sales,
	pl.id_grup,
	pl.grup,
    br.nama_barang,
    br.tipe,
	br.nama_tipe,
	br.kode_lini,
	br.lini,
    br.kemasan
FROM penjualan pj
	LEFT JOIN pelanggan pl ON pl.id_customer = pj.id_customer
	LEFT JOIN barang br ON br.kode_barang = pj.id_barang
ORDER BY pj.tanggal );

ALTER TABLE base_table ADD PRIMARY KEY(id_invoice);