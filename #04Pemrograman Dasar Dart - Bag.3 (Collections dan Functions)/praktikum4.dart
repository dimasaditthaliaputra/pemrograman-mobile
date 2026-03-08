// Langkah 1 & 2 - Spread Operator (...)
// Error: print(list1) -> list1 tidak terdefinisi, harusnya list
// void main() {
//   var list = [1, 2, 3];
//   var list2 = [0, ...list];
//   print(list);   // fix: list1 -> list
//   print(list2);
//   print(list2.length);
// }

// Langkah 3 - Null-aware Spread Operator (...?)
// void main() {
//   var list = [1, 2, 3];
//   var list2 = [0, ...list];
//   print(list); // fix: list1 -> list
//   print(list2);
//   print(list2.length);

//   var list1 = [1, 2, null];
//   print(list1);
//   var list3 = [0, ...?list1];
//   print(list3.length);
// }
// + tambah NIM via spread
// void main() {
//   var list = [1, 2, 3];
//   var list2 = [0, ...list];
//   print(list); // fix: list1 -> list
//   print(list2);
//   print(list2.length);

//   var list1 = [1, 2, null];
//   print(list1);
//   var list3 = [0, ...?list1];
//   print(list3.length);

//   // Tambah NIM menggunakan Spread Operator
//   var charNIM = [2, 4, 4, 1, 0, 7, 0, 6, 0, 0, 3, 7];
//   var nim = [...charNIM];
//   print(nim);
// }

// Langkah 4 - Collection If (if biasa)
// void main() {
//   bool promoActive = true;
//   var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
//   print(nav);
// }
// void main() {
//   bool promoActive = true;
//   var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
//   print(nav); // promoActive = true → Outlet muncul

//   promoActive = false;
//   var nav2 = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
//   print(nav2); // promoActive = false → Outlet tidak muncul
// }

// Langkah 5 - Collection If (if-case)
// void main() {
//   var nav2 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
//   print(nav2);
// }
// void main() {
//   var login = 'Manager';
//   var nav2 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
//   print(nav2);

//   login = 'Staff';
//   var nav3 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
//   print(nav3);
// }

// Langkah 6 - Collection For
void main() {
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);
}
