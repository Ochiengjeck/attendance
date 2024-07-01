// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:attendance/screen/index.dart';
import 'package:flutter/material.dart';

class Notice extends StatefulWidget {
  const Notice({super.key});

  @override
  State<Notice> createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Notifications"),
        centerTitle: true,
      ),
    );
  }
}
