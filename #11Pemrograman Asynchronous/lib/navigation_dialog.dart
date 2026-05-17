import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  Color color = Colors.blue.shade700;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: Text('Navigation Dialog Dimas'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Pick Color'),
          onPressed: () {
            _showColorDialog(context);
          },
        ),
      ),
    );
  }

  _showColorDialog(BuildContext context) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Very important question'),
          content: const Text('Please choose a color'),
          actions: <Widget>[
            // TextButton(
            //   child: const Text('Red'),
            //   onPressed: () {
            //     color = Colors.red.shade700;
            //     Navigator.pop(context, color);
            //   },
            // ),
            // TextButton(
            //   child: const Text('Green'),
            //   onPressed: () {
            //     color = Colors.green.shade700;
            //     Navigator.pop(context, color);
            //   },
            // ),
            // TextButton(
            //   child: const Text('Blue'),
            //   onPressed: () {
            //     color = Colors.blue.shade700;
            //     Navigator.pop(context, color);
            //   },
            // ),
            TextButton(
              child: const Text('Purple'),
              onPressed: () {
                color = Color(0xFF462C7D);
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Pink'),
              onPressed: () {
                color = Color(0xFFFF4081);
                Navigator.pop(context, color);
              },
            ),
            TextButton(
              child: const Text('Blue'),
              onPressed: () {
                color = Color(0xFF121358);
                Navigator.pop(context, color);
              },
            ),
          ],
        );
      },
    );
    setState(() {});
  }
}