import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile_scanner/mobile_scanner.dart';

class ScanCardScreen extends StatefulWidget {
  final String className; // Add this line

  const ScanCardScreen({Key? key, required this.className})
      : super(key: key); // Update constructor

  @override
  State<ScanCardScreen> createState() => _ScanCardScreenState();
}

class _ScanCardScreenState extends State<ScanCardScreen> {
  List<String> scannedCodes = [];
  Uint8List? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.className} Attendance"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: MobileScanner(
              controller: MobileScannerController(
                detectionSpeed: DetectionSpeed.noDuplicates,
              ),
              onDetect: (capture) {
                final List barcodes = capture.barcodes;
                final Uint8List? capturedImage = capture.image;

                for (final barcode in barcodes) {
                  print('barcode value is ${barcode.displayValue}');
                  setState(() {
                    scannedCodes.add(barcode.displayValue);
                    image = capturedImage;
                  });
                }
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Scanned QR Data:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: scannedCodes.length,
                      itemBuilder: (context, index) {
                        return Text(
                          scannedCodes[index],
                          style: TextStyle(fontSize: 16),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  if (image != null)
                    Expanded(
                      child: Image.memory(image!),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      scannedCodes.clear();
                    });
                  },
                  child: Text(
                    'Clear',
                    style: TextStyle(
                        letterSpacing: 2,
                        color: Colors.black.withOpacity(.8),
                        fontWeight: FontWeight.w600),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    final response = await http.post(
                      Uri.parse('http://192.168.0.108/attendance/record.php'),
                      headers: {'Content-Type': 'application/json'},
                      body: jsonEncode({
                        'className': widget.className,
                        'names': scannedCodes,
                      }),
                    );
                    if (response.statusCode == 200) {
                      print('Data sent successfully');
                      setState(() {
                        scannedCodes.clear();
                      });
                    } else {
                      print('Failed to send data');
                    }
                  },
                  child: Text(
                    'Send',
                    style: TextStyle(
                        letterSpacing: 2,
                        color: Colors.black.withOpacity(.8),
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
