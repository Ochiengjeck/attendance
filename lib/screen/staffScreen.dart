// staffScreen.dart
import 'package:flutter/material.dart';

class StaffScreen extends StatelessWidget {
  final String email;

  StaffScreen({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Staff Screen"),
      ),
      body: Center(
        child: Text("Welcome, $email"),
      ),
    );
  }
}
