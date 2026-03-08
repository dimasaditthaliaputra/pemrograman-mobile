// Langkah 1 & 2 - Record literal
// void main() {
//   var record = ('first', a: 2, b: true, 'last');
//   print(record);
// }

// Langkah 3 - Fungsi tukar() dengan Records
(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}
// void main() {
//   var before = (10, 20);
//   print('Sebelum tukar: $before');
//   var after = tukar(before);
//   print('Sesudah tukar: $after');
// }

// Langkah 4 - Record type annotation + inisialisasi
// void main() {
//   var before = (10, 20);
//   print('Sebelum tukar: $before');
//   var after = tukar(before);
//   print('Sesudah tukar: $after');

//   (String, int) mahasiswa;
//   mahasiswa = ('Dimas Adit Thalia Putra', 244107060037);
//   print(mahasiswa);
// }

// void main() {
//   var before = (10, 20);
//   print('Sebelum tukar: $before');
//   var after = tukar(before);
//   print('Sesudah tukar: $after');

//   (String, int) mahasiswa;
//   mahasiswa = ('Dimas Adit Thalia Putra', 244107060037);
//   print(mahasiswa);
// }

// Langkah 5 - Akses field Record dengan $1, .a, .b, $2
// void main() {
//   var before = (10, 20);
//   print('Sebelum tukar: $before');
//   var after = tukar(before);
//   print('Sesudah tukar: $after');

//   (String, int) mahasiswa;
//   mahasiswa = ('Dimas Adit Thalia Putra', 244107060037);
//   print(mahasiswa);

//   var mahasiswa2 = ('first', a: 2, b: true, 'last');

//   print(mahasiswa2.$1); // Prints 'first'
//   print(mahasiswa2.a); // Prints 2
//   print(mahasiswa2.b); // Prints true
//   print(mahasiswa2.$2); // Prints 'last'
// }
void main() {
  var before = (10, 20);
  print('Sebelum tukar: $before');
  var after = tukar(before);
  print('Sesudah tukar: $after');

  (String, int) mahasiswa;
  mahasiswa = ('Dimas Adit Thalia Putra', 244107060037);
  print(mahasiswa);

  var mahasiswa2 = (
    'Dimas Adit Thalia Putra',
    a: 244107060037,
    b: true,
    'SIB-2E',
  );

  print(mahasiswa2.$1); // nama
  print(mahasiswa2.a); // NIM
  print(mahasiswa2.b); // status aktif
  print(mahasiswa2.$2); // kelas
}

