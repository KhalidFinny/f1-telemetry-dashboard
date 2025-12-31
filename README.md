# Dokumentasi F1 Telemetry

Proyek ini adalah aplikasi telemetri balapan F1 yang terdiri dari beberapa layanan (microservices) yang dikelola menggunakan Docker. Dokumentasi ini mencakup panduan setup, stack teknologi yang digunakan, dan cara menjalankan aplikasi.

## Tech Stack

Proyek ini terbagi menjadi tiga komponen utama:

**1. Front-end**
- Framework: **Next.js 16** (App Router)
- Library UI: **React 19**
- Styling: **Tailwind CSS 4**
- Bahasa: **TypeScript**

**2. Back-end API (Data Processing)**
- Framework: **FastAPI**
- Server: **Uvicorn**
- Data Science Libs: **Pandas**, **Numpy**, **Scikit-learn**, **FastF1**
- Fungsi: Menangani pemrosesan data telemetri F1.

**3. Back-end Admin**
- Framework: **Laravel** (PHP)
- Tooling: **Composer**, **Artisan**
- Fungsi: Dashboard administrasi dan manajemen data.

**4. Infrastruktur**
- Containerization: **Docker**
- Orchestration: **Docker Compose**

---

## Prasyarat

Sebelum memulai, pastikan perangkat Anda telah terinstal:

1.  **Git**: Untuk melakukan clone repository.
2.  **Docker Desktop**: Untuk menjalankan container aplikasi.

---

## Cara Setup

Ikuti langkah-langkah berikut untuk menjalankan aplikasi di komputer lokal Anda.

### 1. Clone Repository
Unduh kode sumber proyek ke komputer lokal Anda:

```bash
git clone <repository-url>
cd f1-telemetry
```

### 2. Konfigurasi Environment Variables
Anda perlu membuat file konfigurasi `.env` untuk setiap layanan. Gunakan file contoh `.env.example` yang tersedia sebagai dasar.

**Untuk Back-end Admin:**
```bash
cp Back-end/admin/.env.example Back-end/admin/.env
```

**Untuk Back-end API:**
```bash
cp Back-end/api/.env.example Back-end/api/.env
```

**Untuk Front-end:**
```bash
cp Front-end/.env.example Front-end/.env
```

> **Catatan:** Periksa isi masing-masing file `.env` dan sesuaikan nilai konfigurasi jika diperlukan (seperti koneksi database atau API key).

### 3. Jalankan Aplikasi dengan Docker Compose
Jalankan perintah berikut di root folder proyek (di mana file `docker-compose.yml` berada) untuk membangun dan menjalankan semua layanan:

```bash
docker compose up --build
```

Tunggu hingga proses build selesai dan semua container berjalan. Anda akan melihat log dari masing-masing layanan di terminal.

---

## Akses Aplikasi

Setelah semua layanan berjalan, Anda dapat mengaksesnya melalui browser:

- **Front-end (User Interface)**: [http://localhost:3000](http://localhost:3000)
- **Back-end API (Docs/Swagger)**: [http://localhost:8000/docs](http://localhost:8000/docs)
- **Back-end Admin**: [http://localhost:8001](http://localhost:8001)

---

## Struktur Folder

Berikut adalah gambaran umum struktur direktori proyek:

```
f1-telemetry/
├── Back-end/
│   ├── admin/          # Source code Laravel (Admin Dashboard)
│   └── api/            # Source code FastAPI (Data Telemetri)
├── Front-end/          # Source code Next.js (Aplikasi Web)
├── docker-compose.yml  # Konfigurasi orkestrasi Docker
└── README.md           # Dokumentasi proyek
```

## Troubleshooting

- **Port Conflict**: Jika aplikasi gagal berjalan, pastikan port 3000, 8000, atau 8001 tidak sedang digunakan oleh aplikasi lain.
- **Docker Error**: Pastikan Docker Desktop dalam keadaan *Running* sebelum menjalankan perintah `docker compose`.
