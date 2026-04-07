# Laporan Praktikum #05 Aplikasi Pertama dan Widget Dasar Flutter

## Identitas Mahasiswa

| Atribut | Nilai                   |
| ------- | ----------------------- |
| Nama    | Dimas Adit Thalia Putra |
| NIM     | 244107060037            |
| Kelas   | SIB-2E                  |

---

## Praktikum Membuat Project Flutter Pertama Anda

### Langkah 1: Membuat Project

Luncurkan Visual Studio Code dan buka palet perintah (dengan `F1`, `Ctrl+Shift+P`, atau `Shift+Cmd+P`). Ketik "flutter new". Pilih perintah **Flutter: New Project**.

![Install Flutter](codelabs_img/installproject.png)

Pilih **Application** lalu pilih folder tempat project akan dibuat.

Terakhir, beri nama proyek Anda. Beri nama seperti `namer_app` atau `my_awesome_namer`.

![Naming Project](codelabs_img/namingproject.png)

> **Catatan:** Jika VS Code menampilkan jendela modal yang menanyakan untuk mempercayai isi folder tersebut, pilih **Ya**.

---

### Langkah 2: Menyalin & Menempelkan Aplikasi Awal

Anda sekarang akan menimpa isi 3 file dengan scaffold dasar aplikasi.

#### `pubspec.yaml`

Buka file `pubspec.yaml` pada project Anda, lalu ganti isinya dengan kode berikut:

```yaml
name: namer_app
description: A new Flutter project.

publish_to: "none" # Remove this line if you wish to publish to pub.dev

version: 0.0.1+1

environment:
  sdk: ">=2.19.4 <4.0.0"

dependencies:
  flutter:
    sdk: flutter

  english_words: ^4.0.0
  provider: ^6.0.0

dev_dependencies:
  flutter_test:
    sdk: flutter

  flutter_lints: ^2.0.0

flutter:
  uses-material-design: true
```

![Pubspec.yaml](codelabs_img/pubspec.png)

#### `analysis_options.yaml`

Buka file `analysis_options.yaml` pada project Anda, lalu ganti isinya dengan kode berikut:

```yaml
include: package:flutter_lints/flutter.yaml

linter:
  rules:
    prefer_const_constructors: false
    prefer_final_fields: false
    use_key_in_widget_constructors: false
    prefer_const_literals_to_create_immutables: false
    prefer_const_constructors_in_immutables: false
    avoid_print: false
```

![Analysis Options](codelabs_img/analysis_options.png)

#### `lib/main.dart`

Buka file `main.dart` pada direktori `lib/`, lalu ganti isinya dengan kode berikut:

```dart
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Column(
        children: [
          Text('A random idea:'),
          Text(appState.current.asLowerCase),
        ],
      ),
    );
  }
}
```

> 50 baris kode ini adalah keseluruhan aplikasi sejauh ini. Pada bagian berikutnya, jalankan aplikasi dalam mode debug dan mulai kembangkan aplikasi Anda.

![Main.dart](codelabs_img/main.png)

---

### Langkah 3: Menambahkan Tombol

Langkah ini menambahkan tombol **Next** untuk menghasilkan pasangan kata baru.

#### Meluncurkan aplikasi

Pertama, buka `lib/main.dart` dan pastikan Anda memilih perangkat target. Di bagian pojok kanan bawah VS Code, Anda akan menemukan tombol yang menampilkan perangkat target saat ini. Klik tombol untuk mengubahnya.

![Select Device](codelabs_img/selectdevice.png)

Selagi `lib/main.dart` terbuka, temukan tombol "play" di pojok kanan atas jendela VS Code lalu klik tombol tersebut.

![Run App](codelabs_img/runapp.png)

Setelah beberapa saat, aplikasi Anda diluncurkan dalam mode debug. Tampilannya masih terlihat biasa saja.

![App Running](codelabs_img/apprunning.png)

> **Catatan:** Jika target pengembangan Anda adalah perangkat seluler, kemungkinan sebagian teks terhalang oleh notch atau status bar. Anda akan segera mempelajari cara memperbaiki ini.

**Screenshot:**

<!-- TODO: Tambahkan screenshot aplikasi diluncurkan di sini -->

#### Hot Reload Pertama

Di bagian bawah `lib/main.dart`, tambahkan sesuatu pada string di objek `Text` pertama, dan simpan file tersebut (dengan `Ctrl+S` atau `Cmd+S`). Misalnya:

```dart
// ...

    return Scaffold(
      body: Column(
        children: [
          Text('A random AWESOME idea:'),  // ← Example change.
          Text(appState.current.asLowerCase),
        ],
      ),
    );

// ...
```

![Code Change](codelabs_img/awesomeText.png)

Perhatikan bagaimana aplikasi segera berubah tetapi kata yang acak tetap sama. Situasi ini menunjukkan fitur _stateful Hot Reload_ Flutter terkenal yang sedang bekerja. Hot reload dipicu saat Anda menyimpan perubahan untuk file sumber.

**Screenshot:**

![Hot Reload](codelabs_img/hotreload.png)

#### Menambahkan tombol

Berikutnya, tambahkan tombol di bagian bawah `Column`, tepat di bawah instance `Text` kedua.

```dart
// ...

    return Scaffold(
      body: Column(
        children: [
          Text('A random AWESOME idea:'),
          Text(appState.current.asLowerCase),

          // ↓ Add this.
          ElevatedButton(
            onPressed: () {
              print('button pressed!');
            },
            child: Text('Next'),
          ),

        ],
      ),
    );

// ...
```

![Code Change](codelabs_img/buttonCode.png)

Saat Anda menyimpan perubahan, aplikasi diperbarui kembali: Sebuah tombol muncul dan, saat Anda mengklik tombol tersebut, _Konsol Debug_ di VS Code menampilkan pesan **button pressed!**.

**Screenshot:**

![Button Pressed](codelabs_img/buttonPressed.png)

#### Perilaku pertama Anda

Scroll ke `MyAppState` pada `lib/main.dart` lalu tambahkan metode `getNext`.

```dart
// ...

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  // ↓ Add this.
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}

// ...
```

![Code Change](codelabs_img/getNextCode.png)

Metode `getNext()` menetapkan ulang `current` dengan `WordPair` acak baru. Ia juga memanggil `notifyListeners()` yang memastikan bahwa semua widget yang mendengarkan `MyAppState` diberi tahu tentang pembaruan ini.

Tindakan terakhir adalah memanggil metode `getNext` dari callback tombol tersebut.

```dart
// ...

          ElevatedButton(
            onPressed: () {
              appState.getNext();  // ← This instead of print().
            },
            child: Text('Next'),
          ),

// ...
```

![Code Change](codelabs_img/getNext.png)

Simpan dan uji coba aplikasi sekarang. Aplikasi akan menghasilkan pasangan kata acak baru setiap kali Anda menekan tombol **Next**.

**Screenshot:**

![Button Pressed](codelabs_img/beforePress.png)

![Button Pressed](codelabs_img/afterPress.png)

---

### Memperindah tampilan aplikasi

#### Mengekstrak widget

Baris yang bertanggung jawab untuk menampilkan pasangan kata saat ini kini tampak seperti berikut: `Text(appState.current.asLowerCase)`. Untuk mengubahnya menjadi sesuatu yang lebih kompleks, disarankan untuk mengekstrak baris ini ke widget terpisah. Memiliki beberapa widget untuk beberapa bagian logis dari UI Anda adalah cara penting dalam mengelola kompleksitas pada Flutter.

Flutter menyediakan pembantu pemfaktoran ulang untuk mengekstrak widget, tetapi sebelum Anda menggunakannya, pastikan bahwa baris yang akan diekstrak hanya mengakses yang diperlukan. Sekarang baris tersebut mengakses `appState`, tetapi sebenarnya baris tersebut hanya perlu mengetahui apa pasangan kata saat ini.

Oleh karena itu, tulis ulang widget `MyHomePage` sebagai berikut:

##### `lib/main.dart`

```dart
// ...

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;                 // ← Add this.

    return Scaffold(
      body: Column(
        children: [
          Text('A random AWESOME idea:'),
          Text(pair.asLowerCase),                // ← Change to this.
          ElevatedButton(
            onPressed: () {
              appState.getNext();
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}

// ...
```

![Code Change](codelabs_img/extractCode.png)

Bagus. Widget `Text` tidak lagi merujuk kepada keseluruhan `appState`.

Sekarang, panggil menu **Refactor**. Pada VS Code, Anda melakukan ini melalui salah satu dari dua cara:

1. Klik kanan potongan kode yang ingin Anda faktorkan ulang (dalam hal ini `Text`) dan pilih **Refactor...** dari menu drop-down,
2. ATAU Pindahkan kursor Anda ke potongan kode yang ingin Anda faktorkan ulang (dalam hal ini, `Text`), lalu tekan `Ctrl+.` (Win/Linux) atau `Cmd+.` (Mac).

![Refactor Menu](codelabs_img/refactor1.png)

![Refactor Menu](codelabs_img/refactor2.png)

Pada menu **Refactor**, pilih **Extract Widget**. Tetapkan nama, seperti **BigCard**, lalu klik `Enter`.

Tindakan ini secara otomatis membuat class baru, `BigCard`, di akhir file saat ini. Class tersebut akan terlihat seperti berikut:

##### `lib/main.dart`

```dart
// ...

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    return Text(pair.asLowerCase);
  }
}

// ...
```

Perhatikan bagaimana aplikasi tetap berjalan meskipun pemfaktoran ulang sedang berlangsung.

#### Menambahkan Kartu

Sekarang saatnya membuat widget baru ini menjadi UI tebal yang kita bayangkan di awal bagian ini.

Temukan class `BigCard` dan metode `build()` yang berada di dalamnya. Sama seperti sebelumnya, panggil menu **Refactor** pada widget `Text`. Namun, kali ini Anda tidak akan mengekstrak widget.

Sebagai gantinya, pilih **Wrap with Padding**. Tindakan ini menciptakan widget induk baru di sekitar widget `Text` bernama `Padding`. Setelah menyimpannya, Anda akan melihat bahwa kata acak tersebut telah memiliki ruang yang lebih luas.

![Code Change](codelabs_img/wrapWithPadding1.png)

![Code Change](codelabs_img/wrapWithPadding2.png)

Tingkatkan padding dari nilai default `8.0`. Misalnya, gunakan `20` untuk padding yang lebih luas.

> **Catatan**: Flutter menggunakan Komposisi, bukan Pewarisan, kapan pun tersedia. Di sini, padding tidak menjadi _atribut_ dari `Text`, melainkan sebuah widget! Dengan begitu, widget dapat fokus pada tanggung jawab masing-masing, dan Anda, sebagai developer, memiliki kebebasan penuh mengenai cara menyusun UI.

Berikutnya, tempatkan kursor Anda pada widget `Padding`, buka menu **Refactor**, lalu pilih **Wrap with widget...**.

Tindakan ini memungkinkan Anda untuk menentukan widget induk. Ketik "Card" dan tekan **Enter**.

![Code Change](codelabs_img/wrapWithCard1.png)

![Code Change](codelabs_img/wrapWithCard2.png)

Kode ini menggabungkan widget `Padding`, dan juga `Text`, dengan widget `Card`.

![Result](codelabs_img/result1.png)

#### Tema dan gaya

Untuk membuat kartu menjadi lebih menarik, beri warna yang lebih kaya pada kartu tersebut. Karena ada baiknya untuk menjaga skema warna yang konsisten, gunakan `Theme` aplikasi untuk memilih warna.

Buat perubahan berikut untuk metode `build()` `BigCard`.

##### `lib/main.dart`

```dart
// ...

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);       // ← Add this.

    return Card(
      color: theme.colorScheme.primary,    // ← And also this.
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Text(pair.asLowerCase),
      ),
    );
  }

// ...
```

![Code Change](codelabs_img/theme1.png)

Kedua baris baru ini melakukan banyak hal:

- Pertama, kode ini meminta tema aplikasi saat ini dengan `Theme.of(context)`.
- Kemudian, kode ini menentukan warna kartu agar sama dengan properti `colorScheme` dari tema. Skema warna menampung banyak warna, dan `primary` adalah warna aplikasi yang paling terlihat dan mencolok.

Kini, kartu telah diwarnai dengan warna primer aplikasi.

![Result](codelabs_img/result2.png)

Anda dapat mengubah warna ini serta skema warna keseluruhan aplikasi dengan men-scroll ke atas ke `MyApp` dan mengubah warna seed untuk `ColorScheme` di sana.

> **Tips**: Class `Colors` Flutter memberikan akses mudah ke palet warna pilihan kepada Anda, seperti `Colors.deepOrange` atau `Colors.red`.

Perhatikan bagaimana warna berubah dengan halus. Perubahan ini disebut **animasi implisit**. Banyak widget Flutter akan berinterpolasi antarnilai dengan lancar agar UI tidak hanya "berpindah" antarstatus.

#### TextTheme

Kartu tersebut masih memiliki masalah: ukuran teks terlalu kecil dan warnanya membuat teks sulit dibaca. Untuk memperbaiki masalah ini, buat perubahan berikut pada metode `build()` `BigCard`.

##### `lib/main.dart`

```dart
// ...

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // ↓ Add this.
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),
        // ↓ Change this line.
        child: Text(pair.asLowerCase, style: style),
      ),
    );
  }

// ...
```

![Code Change](codelabs_img/theme2.png)

![Result](codelabs_img/result3.png)

#### Meningkatkan aksesibilitas

Flutter membuat aplikasi dapat diakses secara default. Misalnya, setiap aplikasi Flutter menampilkan semua teks dan elemen interaktif di aplikasi dengan tepat untuk pembaca layar, seperti TalkBack dan VoiceOver.

Namun, Anda mungkin ingin mempertahankan kesederhanaan visual pair.asLowerCase. Gunakan properti semanticsLabel Text untuk mengganti konten visual widget teks dengan konten semantik yang lebih sesuai untuk pembaca layar:

##### `lib/main.dart`

```dart
// ...

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.all(20),

        // ↓ Make the following change.
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }

// ...
```

![Code Change](codelabs_img/theme3.png)

Kini, pembaca layar melafalkan setiap pasangan kata yang dihasilkan dengan tepat, namun UI tidak berubah.

#### Menempatkan UI di tengah

Setelah pasangan kata acak dihadirkan dengan gaya visual yang cukup, saatnya menempatkan UI di tengah jendela/layar aplikasi.

Pertama, buka metode `build()` `MyHomePage`, dan buat perubahan berikut:

##### `lib/main.dart`

```dart
// ...

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,  // ← Add this.
        children: [
          Text('A random AWESOME idea:'),
          BigCard(pair: pair),
          ElevatedButton(
            onPressed: () {
              appState.getNext();
            },
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}

// ...
```

![Code Change](codelabs_img/center1.png)

Tindakan ini menempatkan turunan dalam `Column` di tengah pada sumbu utamanya (vertikal).

![Result](codelabs_img/result4.png)

Widget Inspector itu sendiri berada di luar cakupan codelab ini, tetapi Anda dapat melihat bahwa ketika Column ditandai, kode ini tidak menghabiskan keseluruhan lebar aplikasi. Kode ini hanya menghabiskan ruang horizontal sebanyak yang diperlukan oleh turunan UI.

Anda dapat menempatkan kolom itu sendiri di tengah. Letakkan kursor Anda di Column, buka menu Refactor (dengan Ctrl+. atau Cmd+.), lalu pilih Wrap with Center.

![Code Change](codelabs_img/center2.png)

![Result](codelabs_img/result5.png)

##### `lib/main.dart`

```dart
// ...

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigCard(pair: pair),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                appState.getNext();
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );

// ...
```

**Screenshot:**

![UI Final Step 5](codelabs_img/ui_final_step5.png)
![Result](codelabs_img/result6.png)
