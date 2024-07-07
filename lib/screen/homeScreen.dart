// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:attendance/screen/courses.dart';
import 'package:attendance/screen/messages.dart';
import 'package:attendance/screen/notification.dart';
import 'package:attendance/screen/classes.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<Map<String, dynamic>> admins = [];
List<Map<String, dynamic>> students = [];
List<Map<String, dynamic>> IoT = [];
List<Map<String, dynamic>> HCI = [];
List<Map<String, dynamic>> Linux = [];
List<Map<String, dynamic>> SAD = [];
List<Map<String, dynamic>> Graphics = [];

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int currentIndex = 0;
  final screens = [
    HomeScreenContent(),
    const Courses(),
    const Messages(),
    const Notice(),
  ];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // Method to load data
  Future<void> _loadData() async {
    DataService dataService = DataService();
    await dataService.fetchData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
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
        items: [
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

// Separate widget for the home screen content
class HomeScreenContent extends StatelessWidget {
  HomeScreenContent({super.key});

  // Function to get student count based on course name
  int getStudentCount(String courseName) {
    switch (courseName) {
      case 'IoT':
        return IoT.length;
      case 'HCI':
        return HCI.length;
      case 'Linux':
        return Linux.length;
      case 'SAD':
        return SAD.length;
      case 'Graphics':
        return Graphics.length;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("data");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 102, 255),
        centerTitle: true,
        actions: [
          Icon(Icons.menu),
          Padding(padding: EdgeInsets.only(right: 10))
        ],
        title: Text(
          "Attendance App",
          style: TextStyle(
            color: Colors.white,
            wordSpacing: 2,
            letterSpacing: 2,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, bottom: 10, left: 15, right: 15),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 102, 255),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(left: 3, bottom: 15),
                  child: Text(
                    admins.isNotEmpty
                        ? 'Hello, ${admins[0]['fname']} ${admins[0]['lname']}'
                        : 'Hello, Admin',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                      wordSpacing: 1,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 15),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search here......",
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(.5),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15),
            child: Column(
              children: [
                GridView.builder(
                  itemCount: catNames.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: catColors[index],
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: catIcons[index],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          catNames[index],
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black.withOpacity(.6),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Courses",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Courses(),
                          ),
                        );
                      },
                      child: Text(
                        "See All..",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                GridView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        (MediaQuery.of(context).size.height - 50 - 25) /
                            (4 * 240),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => classScreen(imgList[index]),
                          ),
                        );
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 243, 243, 243),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Image.asset(
                                "images/${imgList[index]}.png",
                                width: 100,
                                height: 100,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              imgList[index],
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(.6),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              getStudentCount(imgList[index]).toString() +
                                  " Students",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DataService {
  // Method to fetch data from the server
  Future<Map<String, dynamic>> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost/attendance/data.php'));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);

        // Assign data to variables
        admins = List<Map<String, dynamic>>.from(data['admins']);
        students = List<Map<String, dynamic>>.from(data['students']);
        IoT = List<Map<String, dynamic>>.from(data['iot']);
        HCI = List<Map<String, dynamic>>.from(data['hci']);
        Linux = List<Map<String, dynamic>>.from(data['linux']);
        SAD = List<Map<String, dynamic>>.from(data['sad']);
        Graphics = List<Map<String, dynamic>>.from(data['graphics']);

        print("$data Is here");
        return data; // Ensure to return the fetched data
      } else {
        print("Failed to load data with status code: ${response.statusCode}");
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("An error occurred: $e");
      throw Exception('Failed to load data');
    }
  }
}
