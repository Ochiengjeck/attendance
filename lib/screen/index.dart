// ignore_for_file: prefer_const_constructors

import 'package:attendance/screen/courses.dart';
import 'package:attendance/screen/messages.dart';
import 'package:attendance/screen/notification.dart';
import 'package:flutter/material.dart';


class index extends StatefulWidget {
  const index({super.key});

  @override
  _indexState createState() => _indexState();
}

class _indexState extends State<index> {
  int currentIndex = 0;
  final screens = [
    index(),
    Courses(),
    Messages(),
    Notice(),
  ];
  List<String> catNames = [
    "Category",
    'Classes',
    'Free Courses',
    'BookStore',
    'Live Courses',
    'LeaderBoard'
  ];

  List<Color> catColors = [
    Color.fromARGB(242, 153, 0, 255),
    Color.fromARGB(235, 0, 174, 255),
    Color.fromARGB(255, 0, 162, 255),
    Color.fromARGB(207, 81, 255, 0),
    Color.fromARGB(197, 0, 110, 255),
    Color.fromARGB(226, 14, 19, 85),
  ];

  List<Icon> catIcons = [
    Icon(
      Icons.category,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.video_library,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.assignment,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.store,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.play_circle_fill,
      color: Colors.white,
      size: 30,
    ),
    Icon(
      Icons.emoji_events,
      color: Colors.white,
      size: 30,
    ),
  ];

  List<String> imgList = ['IoT', 'HCI', 'Linux', 'SAD', 'Graphics'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 102, 255),
        centerTitle: true,
        actions: const [
          Icon(Icons.menu),
          Padding(padding: EdgeInsets.only(right: 10))
        ],
        title: Text(
          "Attendance App",
          style: TextStyle(
              color: Colors.white,
              wordSpacing: 2,
              letterSpacing: 2,
              fontWeight: FontWeight.w600),
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        iconSize: 30,
        selectedItemColor: Color.fromARGB(255, 2, 124, 223).withOpacity(.7),
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: "Classes"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Messages"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notifications"),
        ],
      ),
    );
  }
}
