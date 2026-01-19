# List Produk - Android Application

Aplikasi Android untuk menampilkan daftar produk dari API PHP.

## Fitur

- **Splash Screen** - Layar pembuka dengan logo
- **Welcome Screen** - Layar selamat datang dengan tombol Login dan Register
- **Login** - Halaman login untuk pengguna terdaftar
- **Register** - Halaman pendaftaran akun baru
- **Home** - Menampilkan daftar produk dari API dengan fitur pencarian
- **Profile** - Halaman profil pengguna dengan tombol logout

## Konfigurasi API

Aplikasi ini mengambil data dari API PHP yang ada di `ListtProduk_PDCSWEB/api/Produk.php`.

### Untuk Android Emulator:
URL sudah dikonfigurasi untuk emulator: `http://10.0.2.2/ListtProduk_PDCSWEB/api/`

### Untuk Device Fisik:
Jika menggunakan device fisik, ubah URL di file `ApiHelper.kt`:

```kotlin
// Ganti dengan IP address komputer Anda
private const val BASE_URL = "http://192.168.1.XXX/ListtProduk_PDCSWEB/api/"
```

**Catatan:**
- Pastikan komputer dan device Android berada di jaringan WiFi yang sama
- Pastikan server PHP (Laragon/XAMPP) berjalan
- Pastikan firewall tidak memblokir koneksi

## Struktur Project

```
app/
├── src/main/
│   ├── java/com/a2411500011/listproduk/
│   │   ├── data/
│   │   │   ├── Produk.kt
│   │   │   └── User.kt
│   │   ├── utils/
│   │   │   ├── ApiHelper.kt
│   │   │   └── SharedPrefHelper.kt
│   │   ├── SplashActivity.kt
│   │   ├── WelcomeActivity.kt
│   │   ├── LoginActivity.kt
│   │   ├── RegisterActivity.kt
│   │   ├── HomeActivity.kt
│   │   ├── ProfileActivity.kt
│   │   └── ProdukAdapter.kt
│   └── res/
│       ├── layout/
│       ├── drawable/
│       ├── values/
│       └── menu/
```

## Dependencies

- RecyclerView - Untuk menampilkan list produk
- CardView - Untuk card item produk
- Gson - Untuk parsing JSON dari API
- Glide - Untuk load gambar produk dari URL
- Material Components - Untuk UI components

## Build & Run

1. Buka project di Android Studio
2. Sync Gradle files
3. Pastikan logo ada di `res/drawable/img.png`
4. Konfigurasi API URL jika perlu (untuk device fisik)
5. Run aplikasi

## Catatan

- Data user disimpan lokal menggunakan SharedPreferences
- Aplikasi menggunakan tema biru dan putih
- Logo aplikasi harus ada di `@drawable/img.png`
