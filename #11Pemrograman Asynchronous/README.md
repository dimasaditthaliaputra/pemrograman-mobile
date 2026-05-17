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
> - Carilah judul buku favorit Anda di Google Books, lalu ganti ID buku pada variabel `path` di kode tersebut. Caranya ambil di URL browser Anda seperti gambar berikut ini.
>
> ![URL Google Books](assets/image/image4.png)
> ![edit get data parameters](assets/image/image5.png)
>
> - Kemudian cobalah akses di browser URI tersebut dengan lengkap seperti ini. Jika menampilkan data JSON, maka Anda telah berhasil. Lakukan _capture_ milik Anda dan tulis di `README` pada laporan praktikum. Lalu lakukan commit dengan pesan "**W11: Soal 2**".
>
> ![data JSON](assets/image/image6.png)

### Langkah 5: Tambah kode di **`ElevatedButton`**

Tambahkan kode pada `onPressed` di `ElevatedButton` seperti berikut.

![edit button](assets/image/image7.png)

Lakukan run aplikasi Flutter Anda. Anda akan melihat tampilan akhir seperti gambar berikut. Jika masih terdapat error, silakan diperbaiki hingga bisa running.

> **Soal 3**
>
> - Jelaskan maksud kode langkah 5 tersebut terkait `substring` dan `catchError`!
>
> **_Jawaban_**

- `substring()`: digunakan untuk mengambil sebagian kecil string berdasarkan indeks awal dan akhir yang diberikan. Pada kode tersebut, digunakan untuk mengambil 450 karakter pertama dari string yang dikembalikan oleh Future `getData()`. Jika string terlalu panjang, maka akan dipotong menjadi 450 karakter.
- `catchError()`: digunakan untuk menangani error yang terjadi pada Future (`getData()`), jika tidak ada error maka akan mengembalikan nilai dari Future, jika ada error maka akan mengembalikan nilai dari error.

> - Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "**W11: Soal 3**".

![run aplikasi](assets/image/image8.gif)

---

## Praktikum 2: Menggunakan await/async untuk menghindari callbacks

Ada alternatif penggunaan Future yang lebih clean, mudah dibaca dan dirawat, yaitu pola **async/await**. Intinya pada dua kata kunci ini:

- `async` digunakan untuk menandai suatu method sebagai asynchronous dan itu harus ditambahkan di depan kode function.
- `await` digunakan untuk memerintahkan menunggu sampai eksekusi suatu function itu selesai dan mengembalikan sebuah `value`. Untuk `then` bisa digunakan pada jenis method apapun, sedangkan `await` hanya bekerja di dalam method `async`.

### Langkah 1: Buka file **`main.dart`**

Tambahkan tiga method berisi kode seperti berikut di dalam `class _FuturePageState`.

```dart
Future<int> returnOneAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 1;
}

Future<int> returnTwoAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 2;
}

Future<int> returnThreeAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 3;
}
```

![async1](assets/image/image9.png)

### Langkah 2: Tambah method **`count()`**

Lalu tambahkan lagi method ini di bawah ketiga method sebelumnya.

![async2](assets/image/image10.png)

### Langkah 3: Panggil **`count()`**

Lakukan _comment_ kode sebelumnya, ubah isi kode `onPressed()` menjadi seperti berikut.

![async3](assets/image/image11.png)

### **Langkah 4: Run**

Akhirnya, **run** atau tekan **F5** jika aplikasi belum running. Maka Anda akan melihat seperti gambar berikut, hasil angka 6 akan tampil setelah delay 9 detik.

![async4](assets/image/image12.gif)

> **Soal 4**
>
> 1. Jelaskan maksud kode langkah 1 dan 2 tersebut!

**_Jawaban_**

- `Future<int> returnOneAsync() async` Mendefinisikan sebuah fungsi asynchronous yang akan mengembalikan nilai integer setelah selesai dieksekusi. Keyword `await` digunakan untuk menunggu fungsi `Future.delayed` selesai sebelum mengembalikan nilai 1.
- `Future<int> returnTwoAsync() async` Sama seperti fungsi sebelumnya, namun akan mengembalikan nilai integer 2 setelah selesai dieksekusi.
- `Future<int> returnThreeAsync()` Sama seperti fungsi sebelumnya, namun akan mengembalikan nilai integer 3 setelah selesai dieksekusi.
- `Future count()` Mendefinisikan sebuah fungsi asynchronous yang akan mengembalikan nilai integer (hasil penjumlahan dari ketiga fungsi sebelumnya) setelah selesai dieksekusi. Keyword `await` digunakan untuk menunggu fungsi `returnOneAsync()`, `returnTwoAsync()`, dan `returnThreeAsync()` selesai sebelum mengembalikan nilai 1.

> **Asynchronous** adalah konsep pemrograman yang memungkinkan aplikasi tetap responsif dengan menjalankan tugas-tugas lain (seperti operasi I/O, network request, atau delay) secara konkuren tanpa harus memblokir/menghentikan eksekusi program utama. Di dalam ekosistem **Dart**, mekanisme ini diimplementasikan dengan sangat elegan menggunakan kombinasi kata kunci `async` dan `await`.
>
> 🔗 **Referensi Resmi:** [Dart Dev - Async-Await](https://dart.dev/libraries/async/async-await)

> 2. Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "**W11: Soal 4**".

---

## Praktikum 3: Menggunakan Completer di Future

Menggunakan Future dengan `then`, `catchError`, `async`, dan `await` mungkin sudah cukup untuk banyak kasus, tetapi ada alternatif melakukan operasi async di Dart dan Flutter yaitu dengan `class Completer`.

**Completer** membuat object Future yang mana Anda dapat menyelesaikannya nanti (late) dengan return sebuah value atau error.

Setelah Anda menyelesaikan praktikum 2, Anda dapat melanjutkan praktikum 3 ini. Selesaikan langkah-langkah praktikum berikut ini menggunakan editor Visual Studio Code (VS Code) atau Android Studio atau code editor lain kesukaan Anda. Jawablah di laporan praktikum Anda pada setiap soal yang ada di beberapa langkah praktikum ini.

### Langkah 1: Buka **`main.dart`**

Pastikan telah impor package async berikut.

```dart
import 'package:async/async.dart';
```

![completer1](assets/image/image13.png)

### Langkah 2: Tambahkan variabel dan method

Tambahkan variabel late dan method di `class _FuturePageState` seperti ini.

```dart
late Completer completer;

Future getNumber() {
  completer = Completer<int>();
  calculate();
  return completer.future;
}

Future calculate() async {
  await Future.delayed(const Duration(seconds : 5));
  completer.complete(42);
}
```

![completer2](assets/image/image14.png)

### Langkah 3: Ganti isi kode **`onPressed()`**

Tambahkan kode berikut pada fungsi `onPressed()`. Kode sebelumnya bisa Anda _comment_.

![completer3](assets/image/image15.png)

### Langkah 4: Run

Terakhir, **run** atau tekan **F5** untuk melihat hasilnya jika memang belum running. Bisa juga lakukan **hot restart** jika aplikasi sudah running. Maka hasilnya akan seperti gambar berikut ini. Setelah 5 detik, maka angka 42 akan tampil.

![completer4](assets/image/image16.gif)

> **Soal 5**
>
> - Jelaskan maksud kode langkah 2 tersebut!

**_Jawaban_**
Kode pada Langkah 2 mengimplementasikan kelas **`Completer`** sebagai mekanisme kontrol alur kerja asinkron untuk menyelesaikan (_resolve_) objek `Future` secara manual dalam ekosistem Dart. Berikut adalah analisis akademis mengenai struktur kode tersebut:

1. **`late Completer completer;`**
   Mendeklarasikan variabel `completer` bertipe `Completer` dengan menggunakan modifier `late`. Hal ini merepresentasikan teknik penangguhan inisialisasi (_late initialization_), di mana alokasi memori objek ditangguhkan hingga runtime mengeksekusi metode `getNumber()`, alih-alih diinisialisasi secara instan saat siklus hidup objek kelas dimulai.

2. **Metode `getNumber()`**
   - `completer = Completer<int>();`: Melakukan instansiasi objek `Completer` baru dengan tipe parameter generik `<int>`. Hal ini menegaskan bahwa nilai hasil akhir (_resolved value_) dari operasi asinkron tersebut wajib berupa tipe data integer.
   - `calculate();`: Memicu pemanggilan metode `calculate()` secara _non-blocking_ untuk menjalankan operasi asinkron di latar belakang tanpa menghambat alur eksekusi thread utama.
   - `return completer.future;`: Mengembalikan properti `.future` dari objek `completer`. Properti ini bertindak sebagai representasi komitmen (_promise_) atas nilai masa depan. Komponen pemanggil (misalnya _event listener_ `onPressed()`) dapat mendaftarkan fungsi callback menggunakan metode `.then()` untuk mendengarkan perubahan status _Future_ dari _pending_ menjadi _fulfilled_.

3. **Metode `calculate()`**
   - Dideklarasikan dengan modifier `async` untuk memungkinkannya mengelola eksekusi instruksi asinkron secara sekuensial menggunakan operator `await`.
   - `await Future.delayed(const Duration(seconds: 5));`: Menangguhkan alur eksekusi kode di bawahnya selama 5 detik untuk mensimulasikan latensi operasi I/O (seperti request API atau querying data) tanpa membekukan antarmuka pengguna (_UI freezing_).
   - `completer.complete(42);`: Setelah durasi jeda terpenuhi, completer secara manual memanggil fungsi `.complete(42)`. Aksi ini memindahkan status _Future_ dari _pending_ menjadi _fulfilled_ serta mendistribusikan nilai `42` kepada _listener_ eksternal untuk memperbarui keadaan (_state_) melalui `setState()`.

> - Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "**W11: Soal 5**".

### Langkah 5: Ganti method **`calculate()`**

Gantilah isi code method `calculate()` seperti kode berikut, atau Anda dapat membuat `calculate2()`

![change_calculate](assets/image/image17.png)

### Langkah 6: Pindah ke **`onPressed()`**

Ganti menjadi kode seperti berikut.

```dart
getNumber().then((value) {
  setState(() {
    result = value.toString();
  });
}).catchError((e) {
  result = 'An error occurred';
});
```

![change_on_pressed](assets/image/image18.png)

> **Soal 6**
>
> - Jelaskan maksud perbedaan kode langkah 2 dengan langkah 5-6 tersebut!

**_Jawaban_**
Perbedaan antara implementasi pada Langkah 2 dengan Langkah 5-6 terdapat pada implementasi alur kerja asinkron dari yang awalnya bersifat optimistik (_optimistic flow_) menjadi alur kerja yang tangguh (_robust flow_) melalui integrasi manajemen _error_ (_exception handling_). Perbedaan signifikan dari kedua pendekatan tersebut dapat dianalisis sebagai berikut:

- **Penerapan Manajemen Pengecualian (_Exception Handling_):**
  - **Langkah 2 (Pendekatan Optimistik):** Metode `calculate()` dirancang dengan asumsi ideal bahwa proses asinkron akan selalu berhasil dieksekusi. Ketidakberadaan blok pelindung (_protective block_) membuat aplikasi rentan terhadap kegagalan runtime. Jika terjadi gangguan selama proses _delay_, pengecualian tidak akan tertangkap (_unhandled exception_), berpotensi mengakibatkan kebocoran memori (_memory leak_), atau membuat objek `Completer` terjebak dalam status _pending_ selamanya (_hanging future_).
  - **Langkah 5 (Pendekatan Defensif):** Blok pelindung `try-catch` diintegrasikan dalam metode `calculate()`. Struktur ini secara aktif memantau jalannya instruksi asinkron. Apabila runtime mendeteksi adanya kegagalan, kendali eksekusi program akan dialihkan secara aman ke blok `catch` untuk meminimalkan dampak fatal (_fatal crash_) pada aplikasi.

- **Dualitas Transisi Status Future (_State Transition of Future_):**
  - **Langkah 2:** Objek `Completer` hanya didefinisikan untuk memicu transisi status _Future_ satu arah, yaitu dari _pending_ menuju _fulfilled_ (berhasil) secara manual melalui fungsi `completer.complete(42)`.
  - **Langkah 5-6:** Objek `Completer` dikonfigurasi untuk menangani dualitas status _Future_ (berhasil atau gagal). Melalui instruksi `completer.completeError({})`, sistem mampu mengirimkan sinyal penolakan (_rejection_) secara eksplisit ke subsistem pemanggil. Pola arsitektur ini selaras dengan konsep _Resolve/Reject_ standar industri untuk merepresentasikan status akhir dari komputasi asinkron secara formal.

- **Resiliensi Antarmuka Pengguna (_UI Resiliency_ & _State Management_):**
  - **Langkah 2:** Antarmuka pengguna (_UI_) hanya siap menerima data ketika proses berhasil melalui rantaian method `.then()`. Jika terjadi _error_ di latar belakang, aplikasi akan kehilangan responsivitas karena tidak adanya pembaruan status (_state update_) untuk kasus kegagalan.
  - **Langkah 6:** Rantai pemanggilan _Future_ pada event handler `onPressed()` diperluas dengan menambahkan blok `.catchError((e) { ... })`. Penambahan ini bertindak sebagai _fallback mechanism_. Ketika sinyal `completeError` dipicu oleh metode `calculate()`, aplikasi akan secara otomatis merespons kegagalan tersebut dengan mengubah _state_ `result` menjadi `'An error occurred'`. Hal ini menjamin antarmuka pengguna tetap interaktif dan informatif di segala skenario eksekusi.

> - Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "**W11: Soal 6**".

![running_completer](assets/image/image19.gif)

---

## Praktikum 4: Memanggil Future secara paralel

Ketika Anda membutuhkan untuk menjalankan banyak Future secara bersamaan, ada sebuah class yang dapat Anda gunakan yaitu: `FutureGroup`.

`FutureGroup` tersedia di package `async`, yang mana itu harus diimpor ke file dart Anda, seperti berikut.

```dart
import 'package:async/async.dart';
```

**FutureGroup** adalah sekumpulan dari Future yang dapat run secara paralel. Ketika run secara paralel, maka konsumsi waktu menjadi lebih hemat (cepat) dibanding run method async secara single setelah itu method async lainnya.

Ketika semua code async paralel selesai dieksekusi, maka FutureGroup akan return value sebagai sebuah `List`, sama juga ketika ingin menambahkan operasi paralel dalam bentuk `List`.

> **Perhatian:** Diasumsikan Anda telah berhasil menyelesaikan Praktikum 3.

### Langkah 1: Buka file **`main.dart`**

Tambahkan method ini ke dalam `class _FuturePageState`

![adding_future_group](assets/image/image20.png)

### Langkah 2: Edit **`onPressed()`**

Anda bisa hapus atau comment kode sebelumnya, kemudian panggil method dari langkah 1 tersebut.

![running_future_group](assets/image/image21.png)

### Langkah 3: Run

Anda akan melihat hasilnya dalam 3 detik berupa angka 6 lebih cepat dibandingkan praktikum sebelumnya menunggu sampai 9 detik.

![running_future_group_gif](assets/image/image22.gif)

> **Soal 7**
>
> - Capture hasil praktikum Anda berupa GIF dan lampirkan di README. Lalu lakukan commit dengan pesan "**W11: Soal 7**".

### Langkah 4: Ganti variabel **`futureGroup`**

Anda dapat menggunakan FutureGroup dengan `Future.wait` seperti kode berikut.

```dart
final futures = Future.wait<int>([
  returnOneAsync(),
  returnTwoAsync(),
  returnThreeAsync(),
]);
```

![adding_future_wait](assets/image/image23.png)
![running_future_wait](assets/image/image22.gif)

> **Soal 8**
>
> - Jelaskan maksud perbedaan kode langkah 1 dan 4!

***Jawaban***
Perbedaan utama antara FutureGroup dan Future.wait terletak pada cara pengelolaan koleksi proses asinkron. FutureGroup bersifat dinamis karena objek Future dapat ditambahkan secara bertahap menggunakan .add() dan perlu ditutup dengan .close() sebelum dijalankan. Sebaliknya, Future.wait menggunakan daftar Future yang sudah ditentukan sejak awal sehingga lebih sederhana dan praktis. Selain itu, FutureGroup memerlukan package eksternal async dan kode yang lebih panjang, sedangkan Future.wait merupakan fitur bawaan Dart yang lebih ringkas, efisien, dan umum digunakan untuk eksekusi paralel sederhana.

