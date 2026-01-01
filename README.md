# Dashboard Telemetri F1

Platform analisis telemetri F1 yang komprehensif, terdiri dari API backend berkinerja tinggi, dasbor admin berbasis Laravel, dan frontend Next.js yang modern.

## 🏗 Teknologi yang Digunakan

Proyek ini dibangun menggunakan arsitektur microservices:

### 1. Front-end
- **Framework:** Next.js 16 (App Router)
- **Bahasa:** TypeScript
- **Library UI:** React 19
- **Styling:** Tailwind CSS 4
- **Path:** `front-end/`

### 2. Back-end API (Pemrosesan Data)
- **Framework:** FastAPI (Python)
- **Server:** Uvicorn
- **Pemrosesan Data:** Pandas, Numpy, Scikit-learn, FastF1
- **Path:** `back-end/api/`

### 3. Back-end Admin
- **Framework:** Laravel (PHP)
- **Database ORM:** Eloquent
- **Panel Admin:** Kustom (Laravel Blade/Vue)
- **Path:** `back-end/admin/`

### 4. Infrastruktur
- **Database:** PostgreSQL 15
- **Containerization:** Docker
- **Orchestration:** Docker Compose

---

## 🚀 Panduan Memulai

### Prasyarat
- [Git](https://git-scm.com/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)

### Langkah Instalasi

1. **Clone repository**
   ```bash
   git clone https://github.com/KhalidFinny/f1-telemetry-dashboard.git
   cd f1-telemetry-dashboard
   ```

2. **Konfigurasi Environment Variable**
   Siapkan file `.env` yang diperlukan untuk setiap layanan.

   **Back-end Admin (Laravel)**
   ```bash
   cp back-end/admin/.env.example back-end/admin/.env
   ```
   > **Catatan:** Layanan `admin` menggunakan driver `file` untuk cache dan session secara default untuk memastikan startup berjalan lancar.

   **Back-end API (FastAPI)**
   ```bash
   cp back-end/api/.env.example back-end/api/.env
   ```

   **Front-end (Next.js)**
   ```bash
   cp front-end/.env.example front-end/.env
   ```

3. **Jalankan dengan Docker Compose**
   Dari direktori root (di mana `docker-compose.yml` berada), jalankan:

   ```bash
   docker compose up --build
   ```
   Perintah ini akan membangun image dan memulai semua layanan. Tunggu hingga Anda melihat pesan "database system is ready to accept connections" di log.

4. **Inisialisasi Layanan (Langkah Penting)**
   Setelah container berjalan, Anda harus menginisialisasi layanan Admin. Buka terminal baru dan jalankan:

   **Jalankan Migrasi Database:**
   ```bash
   docker compose exec admin php artisan migrate
   ```

   **Generate Application Key:**
   ```bash
   docker compose exec admin php artisan key:generate
   ```

---

## 🌐 Mengakses Aplikasi

Setelah layanan berjalan, Anda dapat mengaksesnya di:

| Layanan | URL | Deskripsi |
|---------|-----|-----------|
| **Front-end** | [http://localhost:3000](http://localhost:3000) | Antarmuka pengguna utama untuk visualisasi telemetri |
| **Dokumen API** | [http://localhost:8000/docs](http://localhost:8000/docs) | Swagger UI untuk layanan FastAPI |
| **Dasbor Admin** | [http://localhost:8001](http://localhost:8001) | Panel admin untuk mengelola pengguna dan data |

---

## 📂 Struktur Proyek

```
f1-telemetry-dashboard/
├── back-end/
│   ├── admin/          # Dasbor Admin Laravel
│   └── api/            # Layanan Telemetri FastAPI
├── front-end/          # Aplikasi Frontend Next.js
├── docker-compose.yml  # Konfigurasi layanan Docker
└── README.md           # Dokumentasi Proyek
```

## 🛠 Pemecahan Masalah (Troubleshooting)

- **Admin 500 Error:** Jika Anda melihat "Server Error" di halaman Login Admin, pastikan Anda telah menjalankan perintah `key:generate` yang tercantum di Langkah 4.
- **Koneksi Database Ditolak:** Layanan Admin menunggu Database hingga "healthy". Jika macet, periksa log `db` untuk melihat error.
- **Migrasi Gagal:** Pastikan layanan `db` sedang berjalan (`docker ps`) sebelum menjalankan `php artisan migrate`.
- **Windows vs Linux:** Proyek ini menggunakan `.gitattributes` untuk memaksakan "line endings" gaya Linux. Jika skrip gagal di Windows, pastikan Git Anda dikonfigurasi untuk mematuhi `.gitattributes`.
