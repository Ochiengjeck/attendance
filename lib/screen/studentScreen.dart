// studentScreen.dart
import 'package:flutter/material.dart';

class StudentScreen extends StatelessWidget {
  final String email;

  StudentScreen({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Screen"),
      ),
      body: Center(
        child: Text("Welcome, $email"),
      ),
    );
  }
}
