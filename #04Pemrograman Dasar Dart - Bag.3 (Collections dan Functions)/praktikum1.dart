// Kode Langkah 1 - Operasi Dasar List
// void main() {
//   var list = [1, 2, 3];
//   assert(list.length == 3);
//   assert(list[1] == 2);
//   print(list.length);
//   print(list[1]);

//   list[1] = 1;
//   assert(list[1] == 1);
//   print(list[1]);
// }

// Kode Langkah 3 - List.filled dengan tipe eksplisit

// void main() {
//   final list = List.filled(5, null);
//   assert(list.length == 3);
//   assert(list[1] == 2);
//   print(list.length);
//   print(list[1]);

//   list[1] = 'Dimas Adit Thalia Putra';
//   list[2] = '244107060037';
//   assert(list[1] == 1);
//   print(list[1]);
//   print(list[2]);
// }

void main() {
  final List<String?> list = List.filled(5, null);
  assert(list.length == 5);
  assert(list[1] == null);
  print(list.length);
  print(list[1]);

  list[1] = 'Dimas Adit Thalia Putra';
  list[2] = '244107060037';
  assert(list[1] == 'Dimas Adit Thalia Putra');
  assert(list[2] == '244107060037');
  print(list[1]);
  print(list[2]);
}
