package com.a2411500011.listproduk.utils

import android.os.Build
import android.util.Log
import com.a2411500011.listproduk.data.ApiResponse
import com.google.gson.Gson
import java.io.BufferedReader
import java.io.InputStreamReader
import java.net.HttpURLConnection
import java.net.URL

object ApiHelper {
    private const val BASE_URL_EMULATOR = "http://10.0.2.2/ListtProduk_PDCSWEB/api/"
    private const val BASE_URL_DEVICE = "http://192.168.1.72/ListtProduk_PDCSWEB/api/"
    
    private fun isEmulator(): Boolean {
        return (Build.FINGERPRINT.startsWith("generic")
                || Build.FINGERPRINT.startsWith("unknown")
                || Build.MODEL.contains("google_sdk")
                || Build.MODEL.contains("Emulator")
                || Build.MODEL.contains("Android SDK built for x86")
                || Build.MANUFACTURER.contains("Genymotion")
                || (Build.BRAND.startsWith("generic") && Build.DEVICE.startsWith("generic"))
                || "google_sdk" == Build.PRODUCT)
    }
    
    private fun getBaseUrl(): String {
        return if (isEmulator()) {
            BASE_URL_EMULATOR
        } else {
            BASE_URL_DEVICE
        }
    }
    
    fun getProdukList(search: String = "", callback: (ApiResponse?) -> Unit) {
        Thread {
            try {
                val baseUrl = getBaseUrl()
                val urlString = if (search.isNotEmpty()) {
                    "${baseUrl}Produk.php?search=${java.net.URLEncoder.encode(search, "UTF-8")}"
                } else {
                    "${baseUrl}Produk.php"
                }
                
                Log.d("ApiHelper", "Using base URL: $baseUrl (isEmulator: ${isEmulator()})")
                
                val url = URL(urlString)
                val connection = url.openConnection() as HttpURLConnection
                connection.requestMethod = "GET"
                connection.connectTimeout = 10000
                connection.readTimeout = 10000
                
                val responseCode = connection.responseCode
                Log.d("ApiHelper", "Response code: $responseCode, URL: $urlString")
                
                if (responseCode == HttpURLConnection.HTTP_OK) {
                    val reader = BufferedReader(InputStreamReader(connection.inputStream))
                    val response = StringBuilder()
                    var line: String?
                    while (reader.readLine().also { line = it } != null) {
                        response.append(line)
                    }
                    reader.close()
                    
                    val responseString = response.toString()
                    Log.d("ApiHelper", "Response: $responseString")
                    
                    val gson = Gson()
                    try {
                        val apiResponse = gson.fromJson(responseString, ApiResponse::class.java)
                        Log.d("ApiHelper", "Parsed response - status: ${apiResponse.status}, message: ${apiResponse.message}, data count: ${apiResponse.data?.size ?: 0}")
                        callback(apiResponse)
                    } catch (e: Exception) {
                        Log.e("ApiHelper", "Error parsing JSON: ${e.message}", e)
                        callback(null)
                    }
                } else {
                    val errorStream = connection.errorStream
                    val errorResponse = if (errorStream != null) {
                        val reader = BufferedReader(InputStreamReader(errorStream))
                        val response = StringBuilder()
                        var line: String?
                        while (reader.readLine().also { line = it } != null) {
                            response.append(line)
                        }
                        reader.close()
                        response.toString()
                    } else {
                        "No error response"
                    }
                    Log.e("ApiHelper", "HTTP Error: $responseCode, Error response: $errorResponse")
                    callback(null)
                }
                connection.disconnect()
            } catch (e: Exception) {
                Log.e("ApiHelper", "Exception: ${e.message}", e)
                e.printStackTrace()
                callback(null)
            }
        }.start()
    }
}
