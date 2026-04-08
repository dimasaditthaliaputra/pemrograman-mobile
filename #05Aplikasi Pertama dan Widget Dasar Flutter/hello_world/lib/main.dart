import 'package:flutter/material.dart';
import 'package:hello_world/basic_widgets/_dateTimePicker_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Hello World',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const DateTimePickerWidget(title: 'Project Hello World'),
    );
  }
}