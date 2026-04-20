import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E24),
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.05))),
      ),
      child: const Text(
        'Nama: Dimas Adit Thalia Putra | NIM: 244107050037',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 12,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
