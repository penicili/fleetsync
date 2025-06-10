# TUGAS BESAR INTEGRASI APLIKASI ENTERPRISE

## KELOMPOK 7 SI4606
- MIFTAHUL FALAH
- KATON BAGASKORO
- TITISYA DEWI
- STEFANUS JESANO


## Service-Oriented Multi-Container Application

Proyek ini merupakan implementasi arsitektur **Service-Oriented Architecture (SOA)** berbasis multi-container menggunakan Docker. Setiap service berjalan secara independen di dalam containernya masing-masing dan hanya berkomunikasi dengan service lain melalui endpoint yang telah ditentukan.

### Arsitektur dan Komunikasi

- **Isolasi Service:**  
  Setiap service (auth, driver, vehicle, route, dsb.) di-deploy sebagai container terpisah, sehingga mudah untuk dikembangkan, diuji, dan diskalakan secara independen.

- **Inter-Service Communication:**  
  Komunikasi antar service dilakukan secara internal melalui jaringan Docker, tanpa mengekspos port service ke luar kecuali yang diperlukan.

- **Gateway Service:**  
  Seluruh akses dari client ke service dilakukan melalui **Gateway Service** yang terletak bersama Auth Service. Gateway ini bertindak sebagai satu-satunya entry point bagi client, sehingga meningkatkan keamanan dan memudahkan pengelolaan traffic.

- **Keamanan & Kontrol Akses:**  
  Gateway Service juga menangani otentikasi dan otorisasi, memastikan hanya request yang valid yang dapat diteruskan ke service terkait.

### Cara Kerja

1. **Client** hanya dapat mengakses endpoint yang disediakan oleh Gateway Service.
2. Gateway Service akan meneruskan request ke service terkait sesuai kebutuhan.
3. Service-service lain hanya dapat diakses secara internal oleh Gateway, tidak langsung oleh client.

### Teknologi

- Docker & Docker Compose
- Node.js (Auth & Gateway)
- Laravel (Driver, Vehicle, Route, dll.)
- MySQL (Database untuk masing-masing service)

---

> **Catatan:**  
> Untuk membangun dan menjalankan aplikasi, gunakan perintah `docker-compose up --build` dari root project.

---