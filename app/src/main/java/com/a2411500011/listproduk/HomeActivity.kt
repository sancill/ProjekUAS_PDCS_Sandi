package com.a2411500011.listproduk

import android.content.Intent
import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import android.view.View
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.GridLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.a2411500011.listproduk.data.Produk
import com.a2411500011.listproduk.databinding.ActivityHomeBinding
import com.a2411500011.listproduk.utils.ApiHelper
import com.a2411500011.listproduk.utils.SharedPrefHelper

class HomeActivity : AppCompatActivity() {
    private lateinit var binding: ActivityHomeBinding
    private lateinit var produkAdapter: ProdukAdapter
    private var produkList: MutableList<Produk> = mutableListOf()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityHomeBinding.inflate(layoutInflater)
        setContentView(binding.root)

        setSupportActionBar(binding.toolbar)
        supportActionBar?.setDisplayShowTitleEnabled(false)

        setupBackButton()
        setupProfileLogo()
        setupRecyclerView()
        setupSearch()
        loadProduk()
    }

    private fun setupBackButton() {
        binding.buttonBack.setOnClickListener {
            finish()
        }
    }

    private fun setupProfileLogo() {
        binding.imageProfileLogo.setOnClickListener {
            val intent = Intent(this, ProfileActivity::class.java)
            startActivity(intent)
        }
    }

    private fun setupRecyclerView() {
        produkAdapter = ProdukAdapter(produkList) { produk ->
        }
        binding.recyclerViewProduk.layoutManager = GridLayoutManager(this, 2)
        binding.recyclerViewProduk.adapter = produkAdapter
    }

    private fun setupSearch() {
        binding.searchBar.addTextChangedListener(object : TextWatcher {
            override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) {}
            override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {}
            override fun afterTextChanged(s: Editable?) {
                val searchQuery = s?.toString() ?: ""
                loadProduk(searchQuery)
            }
        })
    }

    private fun loadProduk(search: String = "") {
        binding.progressBar.visibility = View.VISIBLE
        binding.recyclerViewProduk.visibility = View.GONE
        binding.textEmpty.visibility = View.GONE

        ApiHelper.getProdukList(search) { response ->
            runOnUiThread {
                binding.progressBar.visibility = View.GONE
                if (response != null) {
                    if (response.status == "success" && response.data != null) {
                        produkList.clear()
                        produkList.addAll(response.data)
                        produkAdapter.notifyDataSetChanged()
                        
                        if (produkList.isEmpty()) {
                            binding.textEmpty.visibility = View.VISIBLE
                            binding.recyclerViewProduk.visibility = View.GONE
                            binding.textEmpty.text = "Tidak ada produk ditemukan"
                        } else {
                            binding.textEmpty.visibility = View.GONE
                            binding.recyclerViewProduk.visibility = View.VISIBLE
                        }
                    } else {
                        binding.textEmpty.visibility = View.VISIBLE
                        binding.recyclerViewProduk.visibility = View.GONE
                        binding.textEmpty.text = response.message ?: "Gagal memuat data produk"
                        Toast.makeText(this, response.message ?: "Gagal memuat data produk", Toast.LENGTH_SHORT).show()
                    }
                } else {
                    binding.textEmpty.visibility = View.VISIBLE
                    binding.recyclerViewProduk.visibility = View.GONE
                    binding.textEmpty.text = "Gagal terhubung ke server. Pastikan:\n1. Server PHP berjalan\n2. HP dan komputer di WiFi yang sama\n3. IP address benar (192.168.1.72)"
                    Toast.makeText(this, "Gagal terhubung ke server. Cek Logcat untuk detail.", Toast.LENGTH_LONG).show()
                }
            }
        }
    }

}
