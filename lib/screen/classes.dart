import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'homeScreen.dart';

class classScreen extends StatefulWidget {
  final String img;

  classScreen(this.img, {Key? key}) : super(key: key);

  @override
  State<classScreen> createState() => _classScreenState();
}

class _classScreenState extends State<classScreen> {
  List<String> students = []; // Initialize an empty list for students

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when the widget initializes
  }

  void fetchData() async {
    try {
      // Fetch data based on widget.img using your data service
      DataService dataService = DataService();
      Map<String, dynamic> data = await dataService.fetchData();

      // Assign the correct list of students based on widget.img
      setState(() {
        switch (widget.img) {
          case 'IoT':
            students =
                data['iot'].map<String>((student) => student['name']).toList();
            break;
          case 'HCI':
            students =
                data['hci'].map<String>((student) => student['name']).toList();
            break;
          case 'Linux':
            students = data['linux']
                .map<String>((student) => student['name'])
                .toList();
            break;
          case 'SAD':
            students =
                data['sad'].map<String>((student) => student['name']).toList();
            break;
          case 'Graphics':
            students = data['graphics']
                .map<String>((student) => student['name'])
                .toList();
            break;
          default:
            students = []; // Handle default case or invalid img value
        }
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
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
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.img} class list",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                InkWell(
                  onTap: () {
                    // Implement your action
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
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Date 1')),
                    DataColumn(label: Text('Date 2')),
                    DataColumn(label: Text('Date 3')),
                  ],
                  rows: List<DataRow>.generate(
                    students.length,
                    (index) => DataRow(
                      cells: [
                        DataCell(Text(students[index])),
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
          ],
        ),
      ),
    );
  }
}

String _formatDate(DateTime date) {
  return DateFormat('yyyy-MM-dd').format(date);
}
