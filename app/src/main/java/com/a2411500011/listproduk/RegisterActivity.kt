package com.a2411500011.listproduk

import android.content.Intent
import android.graphics.drawable.Drawable
import android.os.Bundle
import android.text.InputType
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat
import com.a2411500011.listproduk.data.User
import com.a2411500011.listproduk.databinding.ActivityRegisterBinding
import com.a2411500011.listproduk.utils.SharedPrefHelper

class RegisterActivity : AppCompatActivity() {
    private lateinit var binding: ActivityRegisterBinding
    private var tampilkanPassword = false
    private var tampilkanKonfirmasiPassword = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityRegisterBinding.inflate(layoutInflater)
        setContentView(binding.root)

        setupTombolMata()
        setupTombolRegister()
        setupLinkLogin()
    }

    private fun setupTombolMata() {
        val hiddenDrawable: Drawable? = ContextCompat.getDrawable(this, R.drawable.ic_visibility_off)
        binding.tombolMataPassword.setImageDrawable(hiddenDrawable)
        binding.tombolMataKonfirmasi.setImageDrawable(hiddenDrawable)
        
        binding.tombolMataPassword.setOnClickListener {
            tampilkanPassword = !tampilkanPassword
            if (tampilkanPassword) {
                binding.inputPassword.inputType = InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD
                val eyeDrawable: Drawable? = ContextCompat.getDrawable(this, R.drawable.ic_visibility)
                binding.tombolMataPassword.setImageDrawable(eyeDrawable)
            } else {
                binding.inputPassword.inputType = InputType.TYPE_CLASS_TEXT or InputType.TYPE_TEXT_VARIATION_PASSWORD
                val hiddenDrawable2: Drawable? = ContextCompat.getDrawable(this, R.drawable.ic_visibility_off)
                binding.tombolMataPassword.setImageDrawable(hiddenDrawable2)
            }
            binding.inputPassword.text?.let {
                binding.inputPassword.setSelection(it.length)
            }
        }

        binding.tombolMataKonfirmasi.setOnClickListener {
            tampilkanKonfirmasiPassword = !tampilkanKonfirmasiPassword
            if (tampilkanKonfirmasiPassword) {
                binding.inputKonfirmasiPassword.inputType = InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD
                val eyeDrawable: Drawable? = ContextCompat.getDrawable(this, R.drawable.ic_visibility)
                binding.tombolMataKonfirmasi.setImageDrawable(eyeDrawable)
            } else {
                binding.inputKonfirmasiPassword.inputType = InputType.TYPE_CLASS_TEXT or InputType.TYPE_TEXT_VARIATION_PASSWORD
                val hiddenDrawable2: Drawable? = ContextCompat.getDrawable(this, R.drawable.ic_visibility_off)
                binding.tombolMataKonfirmasi.setImageDrawable(hiddenDrawable2)
            }
            binding.inputKonfirmasiPassword.text?.let {
                binding.inputKonfirmasiPassword.setSelection(it.length)
            }
        }
    }

    private fun setupTombolRegister() {
        binding.tombolRegister.setOnClickListener {
            val nama = binding.inputNama.text?.toString()?.trim() ?: ""
            val email = binding.inputEmail.text?.toString()?.trim() ?: ""
            val password = binding.inputPassword.text?.toString()?.trim() ?: ""
            val konfirmasiPassword = binding.inputKonfirmasiPassword.text?.toString()?.trim() ?: ""

            if (nama.isEmpty() || email.isEmpty() || password.isEmpty() || konfirmasiPassword.isEmpty()) {
                Toast.makeText(this, "Semua field harus diisi", Toast.LENGTH_SHORT).show()
                return@setOnClickListener
            }

            if (password != konfirmasiPassword) {
                Toast.makeText(this, "Password dan konfirmasi password tidak sama", Toast.LENGTH_SHORT).show()
                return@setOnClickListener
            }

            if (password.length < 6) {
                Toast.makeText(this, "Password minimal 6 karakter", Toast.LENGTH_SHORT).show()
                return@setOnClickListener
            }

            val user = User(nama, email, password)
            SharedPrefHelper.simpanUser(this, user)
            SharedPrefHelper.simpanDataUserLogin(this, nama, email)

            Toast.makeText(this, "Registrasi berhasil", Toast.LENGTH_SHORT).show()
            val intent = Intent(this, HomeActivity::class.java)
            startActivity(intent)
            finish()
        }
    }

    private fun setupLinkLogin() {
        binding.linkLogin.setOnClickListener {
            val intent = Intent(this, LoginActivity::class.java)
            startActivity(intent)
        }
    }
}
