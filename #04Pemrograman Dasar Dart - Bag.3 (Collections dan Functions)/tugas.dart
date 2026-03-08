// Soal 2a
/*
String sapa(String nama, int umur) {
  return 'Halo, $nama! Umurku $umur tahun.';
}

void main() {
  print(sapa('Dimas', 20));
}
*/

// Soal 2b
/*
String sapa(String nama, [String kota = 'Malang']) {
  return '$nama dari $kota';
}

void main() {
  print(sapa('Dimas'));          
  print(sapa('Dimas', 'Batu'));
}
*/

// Soal 2c
/*
void info({required String nama, int nim = 0}) {
  print('Nama: $nama, NIM: $nim');
}

void main() {
  info(nama: 'Dimas', nim: 244107060037);
  info(nama: 'Adit');
}
*/

// Soal 2d
/*
void proses(int nilai, int Function(int) operasi) {
  print(operasi(nilai));
}

void main() {
  proses(5, (x) => x * x);
}
*/

// Soal 3
/*
int kuadrat(int x) => x * x;

void main() {
  var fn = kuadrat; 
  print(fn(4));     

  var list = [3, 1, 4, 1, 5];
  list.sort((a, b) => a.compareTo(b));
  print(list);

  Function multiplier(int faktor) {
    return (int x) => x * faktor;
  }

  var kaliTiga = multiplier(3);
  print(kaliTiga(7));
}
*/

// Soal 4
/*
void main() {
  var angka = [1, 2, 3, 4, 5];
  angka.forEach((n) {
    print('Nilai: $n, Kuadrat: ${n * n}');
  });

  var salam = (String nama) => 'Halo, $nama!';
  print(salam('Dimas'));
}
*/

// Soal 5a
/*
var a = 'top-level';

void fungsiLuar() {
  var b = 'dalam fungsiLuar';

  void fungsiDalam() {
    var c = 'dalam fungsiDalam';
    print(a);
    print(b);
    print(c);
  }

  fungsiDalam();
}

void main() {
  fungsiLuar();
}
*/

// Soal 5b
/*
Function buat_counter() {
  int hitungan = 0;

  return () {
    hitungan++;
    print('Hitungan: $hitungan');
  };
}

void main() {
  var counter = buat_counter();
  counter();
  counter();
  counter();

  var counter2 = buat_counter();
  counter2();
}
*/

// Soal 6a
/*
(String, int, String) getInfoMahasiswa() {
  return ('Dimas Adit Thalia Putra', 244107060037, 'SIB-2E');
}

void main() {
  var (nama, nim, kelas) = getInfoMahasiswa();
  print('Nama : $nama');
  print('NIM  : $nim');
  print('Kelas: $kelas');
}
*/

// Soal 6b
/*
({String nama, int nim}) getMahasiswa() {
  return (nama: 'Dimas', nim: 244107060037);
}

void main() {
  var mhs = getMahasiswa();
  print(mhs.nama);
  print(mhs.nim);
}
*/

// Soal 6c
Map<String, dynamic> getInfo() {
  return {
    'nama': 'Dimas Adit Thalia Putra',
    'nim': 244107060037,
    'kelas': 'SIB-2E',
  };
}

void main() {
  var info = getInfo();
  print(info['nama']);
  print(info['nim']);
}