package com.a2411500011.listproduk

import android.content.Intent
import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.a2411500011.listproduk.databinding.ActivityProfileBinding
import com.a2411500011.listproduk.utils.SharedPrefHelper

class ProfileActivity : AppCompatActivity() {
    private lateinit var binding: ActivityProfileBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityProfileBinding.inflate(layoutInflater)
        setContentView(binding.root)

        setupToolbar()
        loadUserData()
        setupLogout()
    }

    private fun setupToolbar() {
        setSupportActionBar(binding.toolbar)
        supportActionBar?.setDisplayShowTitleEnabled(false)
        
        binding.buttonBack.setOnClickListener {
            finish()
        }
    }

    private fun loadUserData() {
        val userData = SharedPrefHelper.ambilDataUserLogin(this)
        binding.textNama.text = userData["nama"] ?: "User"
        binding.textEmail.text = userData["email"] ?: ""
    }

    private fun setupLogout() {
        binding.btnLogout.setOnClickListener {
            SharedPrefHelper.logout(this)
            Toast.makeText(this, "Logout berhasil", Toast.LENGTH_SHORT).show()
            val intent = Intent(this, WelcomeActivity::class.java)
            intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TASK
            startActivity(intent)
            finish()
        }
    }
}
