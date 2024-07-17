import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  final String email;

  AdminScreen({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Screen"),
      ),
      body: Center(
        child: Text("Welcome, $email"),
      ),
    );
  }
}
