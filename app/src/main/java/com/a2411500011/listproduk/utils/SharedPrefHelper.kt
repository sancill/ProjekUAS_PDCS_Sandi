package com.a2411500011.listproduk.utils

import android.content.Context
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import com.a2411500011.listproduk.data.User

object SharedPrefHelper {
    private const val PREF_NAME = "listproduk_pref"
    private const val KEY_USER_NAMA = "user_nama"
    private const val KEY_USER_EMAIL = "user_email"
    private const val KEY_USER_PASSWORD = "user_password"
    private const val KEY_IS_LOGGED_IN = "is_logged_in"
    private const val KEY_USERS = "users_list"

    fun simpanUser(context: Context, user: User) {
        val users = ambilSemuaUser(context).toMutableList()
        if (users.none { it.email == user.email }) {
            users.add(user)
            val json = Gson().toJson(users)
            context.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE)
                .edit()
                .putString(KEY_USERS, json)
                .apply()
        }
    }

    fun ambilSemuaUser(context: Context): List<User> {
        val json = context.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE)
            .getString(KEY_USERS, null) ?: return emptyList()
        
        val type = object : TypeToken<List<User>>() {}.type
        return try {
            Gson().fromJson<List<User>>(json, type) ?: emptyList()
        } catch (e: Exception) {
            emptyList()
        }
    }

    fun cekUserTerdaftar(context: Context, email: String, password: String): Boolean {
        val users = ambilSemuaUser(context)
        return users.any { it.email == email && it.password == password }
    }

    fun ambilUserByEmail(context: Context, email: String): User? {
        val users = ambilSemuaUser(context)
        return users.find { it.email == email }
    }

    fun simpanDataUserLogin(context: Context, nama: String, email: String) {
        context.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE)
            .edit()
            .putString(KEY_USER_NAMA, nama)
            .putString(KEY_USER_EMAIL, email)
            .putBoolean(KEY_IS_LOGGED_IN, true)
            .apply()
    }

    fun ambilDataUserLogin(context: Context): Map<String, String> {
        val pref = context.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE)
        return mapOf(
            "nama" to (pref.getString(KEY_USER_NAMA, "") ?: ""),
            "email" to (pref.getString(KEY_USER_EMAIL, "") ?: "")
        )
    }

    fun isLoggedIn(context: Context): Boolean {
        return context.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE)
            .getBoolean(KEY_IS_LOGGED_IN, false)
    }

    fun logout(context: Context) {
        context.getSharedPreferences(PREF_NAME, Context.MODE_PRIVATE)
            .edit()
            .putBoolean(KEY_IS_LOGGED_IN, false)
            .remove(KEY_USER_NAMA)
            .remove(KEY_USER_EMAIL)
            .apply()
    }
}
