// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'scan.dart';

// ignore: must_be_immutable
class classScreen extends StatefulWidget {
  String img;
  classScreen(this.img);

  @override
  State<classScreen> createState() => _classScreenState();
}

class _classScreenState extends State<classScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> names = [
      'Tamandani Mangochi',
      'Jeckonia Opiyo',
      'Bob Colimo',
      'Charlie Puth',
      'David Gutea',
      'Eva Max',
      'Franklin Ochieng',
      'Grace Ramesh',
      'Hannah Montanah',
      'Ivan Delvis',
      'Jack Ripper'
    ];
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.img,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            wordSpacing: 2,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.notifications,
              size: 28,
              color: const Color.fromARGB(255, 21, 150, 255),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("images/${widget.img}.png"),
                ),
              ),
              // child: Center(
              //   child: Container(
              //     padding: EdgeInsets.all(10),
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       shape: BoxShape.circle,
              //     ),
              //     child: Icon(Icons.assessment),
              //   ),
              // ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.img} class list",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ScanCardScreen(className: widget.img),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 15, 200, 224),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Text(
                      "Take Attendance",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          letterSpacing: 2,
                          wordSpacing: 2,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Date 1')),
                      DataColumn(label: Text('Date 2')),
                      DataColumn(label: Text('Date 3')),
                    ],
                    rows: List<DataRow>.generate(
                      names.length,
                      (index) => DataRow(
                        cells: [
                          DataCell(Text(names[index])),
                          DataCell(Text(_formatDate(DateTime.now()))),
                          DataCell(Text(_formatDate(
                              DateTime.now().add(Duration(days: 2))))),
                          DataCell(Text(_formatDate(
                              DateTime.now().add(Duration(days: 4))))),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String _formatDate(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}
