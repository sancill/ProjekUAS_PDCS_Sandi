package com.a2411500011.listproduk.data

data class Produk(
    val id_produk: Int,
    val nama_produk: String,
    val deskripsi_produk: String?,
    val gambar: String?,
    val merek: String?,
    val harga_awal: Double,
    val harga_diskon: Double?,
    val tipe_diskon: String?,
    val harga_final: Double,
    val stok: Int,
    val sku: String?,
    val kategori: String?,
    val menu: String?,
    val varian: List<Varian>?
)

data class Varian(
    val id_varian: Int,
    val nama_varian: String,
    val nilai_varian: String,
    val harga_tambahan: Double,
    val stok_varian: Int,
    val gambar_varian: String?
)

data class ApiResponse(
    val status: String,
    val message: String,
    val data: List<Produk>?
)
