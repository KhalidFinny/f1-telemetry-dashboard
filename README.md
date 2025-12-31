# F1 Telemetry Dashboard

A comprehensive F1 telemetry analysis platform consisting of a high-performance backend API, a Laravel-based admin dashboard, and a modern Next.js frontend.

## 🏗 Tech Stack

This project is built using a microservices architecture:

### 1. Front-end
- **Framework:** Next.js 16 (App Router)
- **Language:** TypeScript
- **UI Library:** React 19
- **Styling:** Tailwind CSS 4
- **Path:** `front-end/`

### 2. Back-end API (Data Processing)
- **Framework:** FastAPI (Python)
- **Server:** Uvicorn
- **Data Processing:** Pandas, Numpy, Scikit-learn, FastF1
- **Path:** `back-end/api/`

### 3. Back-end Admin
- **Framework:** Laravel (PHP)
- **Database ORM:** Eloquent
- **Admin Panel:** Custom built with Laravel Blade/Vue
- **Path:** `back-end/admin/`

### 4. Infrastructure
- **Database:** PostgreSQL 15
- **Containerization:** Docker
- **Orchestration:** Docker Compose

---

## 🚀 Getting Started

### Prerequisites
- [Git](https://git-scm.com/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/KhalidFinny/f1-telemetry-dashboard.git
   cd f1-telemetry-dashboard
   ```

2. **Configure Environment Variables**
   Set up the necessary `.env` files for each service. You can copy the provided examples:

   **Back-end Admin (Laravel)**
   ```bash
   cp back-end/admin/.env.example back-end/admin/.env
   ```

   **Back-end API (FastAPI)**
   ```bash
   cp back-end/api/.env.example back-end/api/.env
   ```

   **Front-end (Next.js)**
   ```bash
   cp front-end/.env.example front-end/.env
   ```
   > **Note:** Open each `.env` file and review the configurations. Ensure database credentials in `back-end/admin/.env` match those in `docker-compose.yml`.

3. **Run with Docker Compose**
   From the root directory (where `docker-compose.yml` is located), run:

   ```bash
   docker compose up --build
   ```
   This command will build the images for the frontend, api, and admin services, and start the PostgreSQL database.

---

## 🌐 Accessing the Application

Once the services are up and running, you can access them at:

| Service | URL | Description |
|---------|-----|-------------|
| **Front-end** | [http://localhost:3000](http://localhost:3000) | Main user interface for telemetry visualization |
| **API Documentation** | [http://localhost:8000/docs](http://localhost:8000/docs) | Swagger UI for the FastAPI service |
| **Admin Dashboard** | [http://localhost:8001](http://localhost:8001) | Admin panel for managing users and data |

---

## 📂 Project Structure

```
f1-telemetry-dashboard/
├── back-end/
│   ├── admin/          # Laravel Admin Dashboard
│   └── api/            # FastAPI Telemetry Service
├── front-end/          # Next.js Frontend Application
├── docker-compose.yml  # Docker services configuration
└── README.md           # Project Documentation
```

## 🛠 Troubleshooting

- **Port Conflicts:** Ensure ports `3000`, `8000`, `8001`, and `5432` are not occupied by other applications.
- **Database Connection:** If the Admin service fails to connect to the database, ensure the `db` service is healthy and the credentials in `back-end/admin/.env` match the `docker-compose.yml` values (User: `f1_user`, DB: `f1_telemetry`).
- **Permissions:** on Linux/Mac, you might need to run docker commands with `sudo` or check file permissions for the `storage` directory in Laravel.
