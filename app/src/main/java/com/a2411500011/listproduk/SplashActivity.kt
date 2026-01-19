package com.a2411500011.listproduk

import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import androidx.appcompat.app.AppCompatActivity
import com.a2411500011.listproduk.utils.SharedPrefHelper

class SplashActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_splash)
        
        Handler(Looper.getMainLooper()).postDelayed({
            if (SharedPrefHelper.isLoggedIn(this)) {
                val intent = Intent(this, HomeActivity::class.java)
                startActivity(intent)
            } else {
                val intent = Intent(this, WelcomeActivity::class.java)
                startActivity(intent)
            }
            finish()
        }, 3000)
    }
}
