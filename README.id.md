# AutoConfirm4D

[English](README.md) | [Bahasa Indonesia](README.id.md) | [Español](README.es.md)

Modul KernelSU / Magisk yang membuat layar kunci Samsung langsung terbuka setelah
digit PIN ke-4, tanpa menekan OK.

Modul ini tidak mengubah SystemUI dan tidak menyentuh penyimpanan kredensial. Ia hanya
mengatur satu nilai di database sistem, `Settings.Secure n_digits_pin_enabled = 4`,
yaitu opsi "N digit PIN" bawaan Samsung. PIN tetap diverifikasi oleh sistem lewat
jalur yang sama dengan tombol OK.

## Persyaratan

| Item | Persyaratan |
|---|---|
| Perangkat | Samsung Galaxy dengan One UI (lihat kompatibilitas) |
| Root | KernelSU atau Magisk (aplikasi manager yang bisa flash modul) |
| LSPosed | **Tidak perlu.** Modul ini tidak melakukan hook |
| Kunci layar | PIN **tepat 4 digit** |
| Cadangan | Fingerprint aktif dan berfungsi (sangat disarankan) |

## Kompatibilitas

| Perangkat | One UI | Build | Status |
|---|---|---|---|
| Galaxy A36 (SM-A366B) | 9.0 | CP2A.260605.016.A366BXXUCDZIF | Diuji, berfungsi |
| Galaxy lainnya | 6.x - 9.x | - | Belum diuji |

| Solusi root | Status |
|---|---|
| KernelSU | Jalur skrip boot dipakai di perangkat uji |
| Magisk | Belum diuji |
| Tombol Action | Perlu manager yang mendukung `action.sh`. Jika tidak ada, pakai perintah Termux di bawah |

Hanya baris "Diuji" yang sudah diverifikasi. Di perangkat lain, setting bisa tidak ada,
diabaikan, atau ditimpa. Cek dengan `settings get secure n_digits_pin_enabled`.

## Pasang

1. Pastikan PIN tepat 4 digit dan fingerprint berfungsi.
2. Buka manager root, masuk ke Modul, pilih Install dari penyimpanan, pilih zip.
3. Reboot.
4. Kunci ponsel lalu masukkan PIN. Layar harus terbuka setelah digit ke-4.

## Matikan

- Tekan tombol **Action** pada modul di manager (toggle ON/OFF), atau
- Hapus modul (nilai awal dikembalikan), atau
- Dari Termux:

```
su -c "settings put secure n_digits_pin_enabled 0"
```

Menonaktifkan modul di manager tidak mereset setting. Gunakan Action atau perintah di atas dulu.

## Sebelum mengganti PIN

Matikan modul dulu, ganti PIN, lalu aktifkan lagi jika PIN baru 4 digit.

## Jika terkunci

Saat opsi aktif, input berhenti di 4 digit. PIN selain 4 digit tidak bisa diketik.
Buka dengan fingerprint, lalu jalankan perintah di bagian "Matikan". Tanpa fingerprint,
masuk Safe Mode; setting tersimpan di database Settings, jadi factory reset adalah
pilihan terakhir.

## Batasan

- Setiap 4 digit salah dihitung sebagai percobaan gagal, termasuk timer lockout Samsung.
- Perilaku setelah update firmware tidak dijamin. Uji ulang tiap update.
- Belum diverifikasi: apakah Samsung Settings menimpa nilai saat jenis kunci diubah.
- Bukan bypass keamanan. PIN 4 digit lebih lemah dari PIN yang lebih panjang, dengan atau tanpa modul ini.

## Lisensi

MIT
