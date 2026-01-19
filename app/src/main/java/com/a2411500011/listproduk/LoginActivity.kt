package com.a2411500011.listproduk

import android.content.Intent
import android.graphics.drawable.Drawable
import android.os.Bundle
import android.text.InputType
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat
import com.a2411500011.listproduk.databinding.ActivityLoginBinding
import com.a2411500011.listproduk.utils.SharedPrefHelper

class LoginActivity : AppCompatActivity() {
    private lateinit var binding: ActivityLoginBinding
    private var tampilkanPassword = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityLoginBinding.inflate(layoutInflater)
        setContentView(binding.root)

        setupTombolMata()
        setupTombolLogin()
        setupLinkRegister()
    }

    private fun setupTombolMata() {
        val hiddenDrawable: Drawable? = ContextCompat.getDrawable(this, R.drawable.ic_visibility_off)
        binding.tombolMata.setImageDrawable(hiddenDrawable)
        
        binding.tombolMata.setOnClickListener {
            tampilkanPassword = !tampilkanPassword
            if (tampilkanPassword) {
                binding.inputPassword.inputType = InputType.TYPE_TEXT_VARIATION_VISIBLE_PASSWORD
                val eyeDrawable: Drawable? = ContextCompat.getDrawable(this, R.drawable.ic_visibility)
                binding.tombolMata.setImageDrawable(eyeDrawable)
            } else {
                binding.inputPassword.inputType = InputType.TYPE_CLASS_TEXT or InputType.TYPE_TEXT_VARIATION_PASSWORD
                val hiddenDrawable2: Drawable? = ContextCompat.getDrawable(this, R.drawable.ic_visibility_off)
                binding.tombolMata.setImageDrawable(hiddenDrawable2)
            }
            binding.inputPassword.text?.let {
                binding.inputPassword.setSelection(it.length)
            }
        }
    }

    private fun setupTombolLogin() {
        binding.tombolLogin.setOnClickListener {
            val email = binding.inputEmail.text?.toString()?.trim() ?: ""
            val password = binding.inputPassword.text?.toString()?.trim() ?: ""

            if (email.isEmpty() || password.isEmpty()) {
                Toast.makeText(this, "Email dan password tidak boleh kosong", Toast.LENGTH_SHORT).show()
                return@setOnClickListener
            }

            if (SharedPrefHelper.cekUserTerdaftar(this, email, password)) {
                val user = SharedPrefHelper.ambilUserByEmail(this, email)
                user?.let {
                    SharedPrefHelper.simpanDataUserLogin(this, it.nama, it.email)
                }

                val intent = Intent(this, HomeActivity::class.java)
                startActivity(intent)
                finish()
            } else {
                Toast.makeText(this, "Email atau password salah", Toast.LENGTH_SHORT).show()
            }
        }
    }

    private fun setupLinkRegister() {
        binding.linkRegister.setOnClickListener {
            val intent = Intent(this, RegisterActivity::class.java)
            startActivity(intent)
        }
    }
}
