void main() {
  String nama = "Dimas Adit Thalia Putra";
  String nim = "244107060037";

  for (int i = 0; i <= 201; i++) {
    bool isPrima = true;

    for (int j = 2; j * j <= i; j++) {
      if (i % j == 0) {
        isPrima = false;
        break;
      }
    }

    if (isPrima) {
      print("$i : Nama: $nama, NIM: $nim");
    } else {
      print("$i");
    }
  }
}