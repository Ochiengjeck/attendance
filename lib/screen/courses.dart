import 'package:attendance/screen/classes.dart';
import 'package:flutter/material.dart';

// Define the variables that you want to use across different files
final List<String> catNames = [
  "Category",
  'Classes',
  'Free Courses',
  'BookStore',
  'Live Courses',
  'LeaderBoard'
];

final List<Color> catColors = [
  Color.fromARGB(242, 153, 0, 255),
  Color.fromARGB(235, 0, 174, 255),
  Color.fromARGB(255, 0, 162, 255),
  Color.fromARGB(207, 81, 255, 0),
  Color.fromARGB(197, 0, 110, 255),
  Color.fromARGB(226, 14, 19, 85),
];

final List<Icon> catIcons = [
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

final List<String> imgList = ['IoT', 'HCI', 'Linux', 'SAD', 'Graphics'];

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Your classes'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 15, right: 15),
        child: Column(
          children: [
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
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: imgList.length,
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
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 243, 243, 243),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Image.asset(
                              "images/${imgList[index]}.png",
                              width: 100,
                              height: 100,
                            ),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                                imgList[index].length.toString() +
                                    " Students Enrolled",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(.5),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
