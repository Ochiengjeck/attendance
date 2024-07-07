// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;

// Define variables to store data
List<Map<String, dynamic>> admins = [];
List<Map<String, dynamic>> students = [];
List<Map<String, dynamic>> IoT = [];
List<Map<String, dynamic>> HCI = [];
List<Map<String, dynamic>> Linux = [];
List<Map<String, dynamic>> SAD = [];
List<Map<String, dynamic>> Graphics = [];

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
