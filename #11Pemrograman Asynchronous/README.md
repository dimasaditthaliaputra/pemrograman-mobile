# Laporan Praktikum #11 Pemrograman Asynchronous

## Identitas Mahasiswa

| Atribut | Nilai                   |
| ------- | ----------------------- |
| Nama    | Dimas Adit Thalia Putra |
| NIM     | 244107060037            |
| Kelas   | SIB-2E                  |

---

## Praktikum 1: Mengunduh Data dari Web Service (API)

Selesaikan langkah-langkah praktikum berikut ini menggunakan editor Visual Studio Code (VS Code) atau Android Studio atau code editor lain kesukaan Anda. Jawablah di laporan praktikum Anda pada setiap soal yang ada di beberapa langkah praktikum ini.

### **Langkah 1: Buat Project Baru**
Buatlah sebuah project flutter baru dengan nama **books** di folder **src week-11** repository GitHub Anda. 

Kemudian Tambahkan dependensi `http` dengan mengetik perintah berikut di terminal.
```bash
flutter pub add http
```

![Flutter pub add](assets/image/image.png)

### Langkah 2: Cek file **`pubspec.yaml`**
Jika berhasil install plugin, pastikan plugin `http` telah ada di file `pubspec` ini seperti berikut.
```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0
```

![pubspec.yaml](assets/image/image1.png)

**Jika Anda menggunakan macOS**, Anda harus mengaktifkan fitur networking pada file `macos/Runner/DebugProfile.entitlements` dan `macos/Runner/Release.entitlements` dengan menambahkan kode berikut:

<img style="width: 386.00px" src="img/2ca9ef3a2e1c08ba.png">

### Langkah 3: Buka file **`main.dart`**
Ketiklah kode seperti berikut ini.

> **Soal 1**
> 
> Tambahkan **nama panggilan Anda** pada `title` app sebagai identitas hasil pekerjaan Anda.

![main.dart](assets/image/image2.png)

> **Catatan:** 
> 
> Tidak ada yang spesial dengan kode di `main.dart` tersebut. Perlu diperhatikan di kode tersebut terdapat widget `CircularProgressIndicator` yang akan menampilkan animasi berputar secara terus-menerus, itu pertanda bagus bahwa aplikasi Anda responsif (tidak freeze/lag). Ketika animasi terlihat berhenti, itu berarti UI menunggu proses lain sampai selesai.

### Langkah 4: Tambah method **`getData()`**
Tambahkan method ini ke dalam `class _FuturePageState` yang berguna untuk mengambil data dari API Google Books.

![getData()](assets/image/image3.png)

> **Soal 2**
> 
> * Carilah judul buku favorit Anda di Google Books, lalu ganti ID buku pada variabel `path` di kode tersebut. Caranya ambil di URL browser Anda seperti gambar berikut ini.
> 
> ![URL Google Books](assets/image/image4.png)
> ![edit get data parameters](assets/image/image5.png)
> 
> * Kemudian cobalah akses di browser URI tersebut dengan lengkap seperti ini. Jika menampilkan data JSON, maka Anda telah berhasil. Lakukan *capture* milik Anda dan tulis di `README` pada laporan praktikum. Lalu lakukan commit dengan pesan "**W11: Soal 2**".
> 
> ![data JSON](assets/image/image6.png)

### Langkah 5: Tambah kode di **`ElevatedButton`**
Tambahkan kode pada `onPressed` di `ElevatedButton` seperti berikut.

![edit button](assets/image/image7.png)

Lakukan run aplikasi Flutter Anda. Anda akan melihat tampilan akhir seperti gambar berikut. Jika masih terdapat error, silakan diperbaiki hingga bisa running.

> **Soal 3**
> 
> * Jelaskan maksud kode langkah 5 tersebut terkait `substring` dan `catchError`!
>
***Jawaban***
* `substring()`: digunakan untuk mengambil sebagian kecil string berdasarkan indeks awal dan akhir yang diberikan. Pada kode tersebut, digunakan untuk mengambil 450 karakter pertama dari string yang dikembalikan oleh Future `getData()`. Jika string terlalu panjang, maka akan dipotong menjadi 450 karakter.
* `catchError()`: digunakan untuk menangani error yang terjadi pada Future (`getData()`), jika tidak ada error maka akan mengembalikan nilai dari Future, jika ada error maka akan mengembalikan nilai dari error.

> * Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "**W11: Soal 3**".

![run aplikasi](assets/image/image8.gif)