// Langkah 1 - Map literals
// void main() {
//   var gifts = {
//     // Key:    Value
//     'first': 'partridge',
//     'second': 'turtledoves',
//     'fifth': 1
//   };

//   var nobleGases = {
//     2: 'helium',
//     10: 'neon',
//     18: 2,
//   };

//   print(gifts);
//   print(nobleGases);
// }

// Langkah 3 - Map constructor + tambah elemen nama & NIM
// void main() {
//   var gifts = {
//     // Key:    Value
//     'first': 'partridge',
//     'second': 'turtledoves',
//     'fifth': 1
//   };

//   var nobleGases = {2: 'helium', 10: 'neon', 18: 'argon'};

//   var mhs1 = Map<String, String>();
//   gifts['first'] = 'partridge';
//   gifts['second'] = 'turtledoves';
//   gifts['fifth'] = 'golden rings';

//   var mhs2 = Map<int, String>();
//   nobleGases[2] = 'helium';
//   nobleGases[10] = 'neon';
//   nobleGases[18] = 'argon';

//   print(gifts);
//   print(nobleGases);
// }

void main() {
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1,
    'nama': 'Dimas Adit Thalia Putra',
    'nim': '244107060037',
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
    'nama': 'Dimas Adit Thalia Putra',
    'nim': '244107060037',
  };

  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  var mhs1 = Map<String, String>();
  mhs1['nama'] = "Dimas Adit Thalia Putra";
  mhs1['nim'] = "244107060037";

  var mhs2 = Map<int, String>();
  mhs2[1] = "Dimas Adit Thalia Putra";
  mhs2[2] = "244107060037";

  print("ini variabel gifts");
  print(gifts);
  print("ini variabel nobleGases");
  print(nobleGases);
  print("ini variabel mhs1");
  print(mhs1);
  print("ini variabel mhs2");
  print(mhs2);
}
