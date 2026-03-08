// Langkah 1 - Tipe Data Set: halogens
// void main() {
//   var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
//   print(halogens);
// }

// // Langkah 3 - Eksperimen names1, names2, names3
// void main() {
//   var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
//   print(halogens);

//   var names1 = <String>{};
//   Set<String> names2 = {}; // This works, too.
//   var names3 = {}; // Creates a map, not a set.

//   print(names1);
//   print(names2);
//   print(names3);
// }

void main() {
  var names1 = <String>{};
  Set<String> names2 = {};

  names1.add('Dimas Adit Thalia Putra');
  names1.add('244107060037');

  names2.addAll(['Dimas Adit Thalia Putra', '244107060037']);

  print("ini names1");
  print(names1);
  print("ini names2");
  print(names2);
}