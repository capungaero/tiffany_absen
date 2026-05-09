# Setup Supabase

Aplikasi ini saat ini berjalan dengan MySQL (`mysqli`). Supabase memakai PostgreSQL, jadi koneksi bisa disiapkan lewat environment variable, tetapi skema/data MySQL perlu dimigrasikan sebelum aplikasi benar-benar memakai Supabase.

## 1. Buat project Supabase

1. Buka dashboard Supabase dan buat project baru.
2. Simpan database password dengan aman.
3. Ambil host dari menu Project Settings > Database, formatnya biasanya `db.<project-ref>.supabase.co`.

## 2. Set environment database

Contoh konfigurasi untuk Supabase:

```env
DB_DRIVER=postgre
DB_HOST=db.<project-ref>.supabase.co
DB_PORT=5432
DB_NAME=postgres
DB_USER=postgres
DB_PASS=<supabase-database-password>
DB_SSL=1
```

Untuk lokal MySQL, biarkan default atau gunakan:

```env
DB_DRIVER=mysqli
DB_HOST=localhost
DB_PORT=3306
DB_NAME=newtiffa_timesheet
DB_USER=root
DB_PASS=
DB_SSL=0
```

## 3. Migrasi database

File SQL project sekarang format MySQL. Jangan import langsung ke Supabase karena syntax seperti `AUTO_INCREMENT`, tipe data, index, dan beberapa query MySQL perlu dikonversi ke PostgreSQL.

Rekomendasi aman:

1. Export schema MySQL.
2. Konversi schema ke PostgreSQL.
3. Import schema ke Supabase.
4. Export data MySQL per tabel ke CSV.
5. Import CSV ke tabel Supabase.
6. Test login, presensi, upload, sync, payroll.

## 4. Catatan kompatibilitas kode

Beberapa query di aplikasi masih spesifik MySQL, contohnya raw SQL, fungsi tanggal, dan asumsi driver `mysqli`. Jika Supabase akan menjadi database utama, perlu audit query menyeluruh dan test semua modul.

Status saat ini: aplikasi sudah siap membaca konfigurasi Supabase via env, tetapi belum otomatis memigrasikan schema/data MySQL ke PostgreSQL.

## 5. Hasil konversi schema/data

Saya sudah menyiapkan converter di `tools/convert_mysql_to_supabase.py` dan hasil output lokal di `database/supabase/`.

File hasil:

- `database/supabase/schema.sql` - schema PostgreSQL untuk Supabase.
- `database/supabase/data.sql` - semua data hasil konversi dari dump MySQL terbaru.
- `database/supabase/data_chunks/` - data dipecah menjadi beberapa file agar lebih mudah dijalankan di SQL Editor.
- `database/supabase/all.sql` - gabungan schema + data.

Urutan import yang disarankan:

1. Jalankan `database/supabase/schema.sql` di Supabase SQL Editor.
2. Jalankan `database/supabase/data_chunks/data_part_001.sql` sampai file terakhir secara berurutan.
3. Jika memakai `psql`, boleh import `schema.sql` lalu `data.sql` langsung.

File `data.sql`, `all.sql`, dan `data_chunks/` sengaja di-ignore dari Git karena berisi data real karyawan/aplikasi.
