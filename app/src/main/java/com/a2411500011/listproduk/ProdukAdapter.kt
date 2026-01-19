package com.a2411500011.listproduk

import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.a2411500011.listproduk.data.Produk
import com.bumptech.glide.Glide
import com.bumptech.glide.load.engine.DiskCacheStrategy
import java.text.NumberFormat
import java.util.Locale

class ProdukAdapter(
    private val produkList: List<Produk>,
    private val onItemClick: (Produk) -> Unit
) : RecyclerView.Adapter<ProdukAdapter.ProdukViewHolder>() {

    class ProdukViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        val imageProduk: ImageView = itemView.findViewById(R.id.imageProduk)
        val textNamaProduk: TextView = itemView.findViewById(R.id.textNamaProduk)
        val textHarga: TextView = itemView.findViewById(R.id.textHarga)
        val textVarian: TextView = itemView.findViewById(R.id.textVarian)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ProdukViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.item_produk, parent, false)
        return ProdukViewHolder(view)
    }

    override fun onBindViewHolder(holder: ProdukViewHolder, position: Int) {
        val produk = produkList[position]
        
        holder.textNamaProduk.text = produk.nama_produk
        
        val formatter = NumberFormat.getCurrencyInstance(Locale.forLanguageTag("id-ID"))
        holder.textHarga.text = formatter.format(produk.harga_final)
        
        if (!produk.varian.isNullOrEmpty()) {
            val varianText = produk.varian.joinToString(", ") { varian ->
                "${varian.nama_varian}: ${varian.nilai_varian}"
            }
            holder.textVarian.text = varianText
            holder.textVarian.visibility = View.VISIBLE
        } else {
            holder.textVarian.visibility = View.GONE
        }
        
        if (!produk.gambar.isNullOrEmpty() && produk.gambar != "null") {
            try {
                val isEmulator = android.os.Build.FINGERPRINT.startsWith("generic")
                        || android.os.Build.FINGERPRINT.startsWith("unknown")
                        || android.os.Build.MODEL.contains("google_sdk")
                        || android.os.Build.MODEL.contains("Emulator")
                        || android.os.Build.MODEL.contains("Android SDK built for x86")
                
                val imageUrl = when {
                    produk.gambar.startsWith("http://") || produk.gambar.startsWith("https://") -> {
                        if (isEmulator) {
                            produk.gambar
                                .replace("192.168.1.72", "10.0.2.2")
                                .replace("localhost", "10.0.2.2")
                                .replace("127.0.0.1", "10.0.2.2")
                        } else {
                            produk.gambar
                        }
                    }
                    produk.gambar.startsWith("//") -> {
                        val fullUrl = "http:${produk.gambar}"
                        if (isEmulator) {
                            fullUrl
                                .replace("192.168.1.72", "10.0.2.2")
                                .replace("localhost", "10.0.2.2")
                                .replace("127.0.0.1", "10.0.2.2")
                        } else {
                            fullUrl
                        }
                    }
                    else -> {
                        val cleanPath = produk.gambar.removePrefix("/")
                        if (isEmulator) {
                            "http://10.0.2.2/ListtProduk_PDCSWEB/$cleanPath"
                        } else {
                            "http://192.168.1.72/ListtProduk_PDCSWEB/$cleanPath"
                        }
                    }
                }
                
                if (imageUrl.isBlank() || imageUrl == "null") {
                    Log.w("ProdukAdapter", "Invalid image URL for ${produk.nama_produk}: $imageUrl")
                    holder.imageProduk.setImageResource(R.drawable.ic_launcher_foreground)
                    return
                }
                
                val normalizedUrl = imageUrl.replace(".webp", ".png", ignoreCase = true)
                
                Log.d("ProdukAdapter", "Loading image for ${produk.nama_produk}: $normalizedUrl (original: ${produk.gambar})")
                
                Glide.with(holder.itemView.context)
                    .load(normalizedUrl)
                    .diskCacheStrategy(DiskCacheStrategy.ALL)
                    .skipMemoryCache(false)
                    .placeholder(R.drawable.ic_launcher_foreground)
                    .error(R.drawable.ic_launcher_foreground)
                    .fallback(R.drawable.ic_launcher_foreground)
                    .into(holder.imageProduk)
            } catch (e: Exception) {
                Log.e("ProdukAdapter", "Error loading image for ${produk.nama_produk}: ${e.message}", e)
                holder.imageProduk.setImageResource(R.drawable.ic_launcher_foreground)
            }
        } else {
            Log.w("ProdukAdapter", "No image URL for ${produk.nama_produk}")
            holder.imageProduk.setImageResource(R.drawable.ic_launcher_foreground)
        }
        
        holder.itemView.setOnClickListener {
            onItemClick(produk)
        }
    }

    override fun getItemCount(): Int = produkList.size
}
