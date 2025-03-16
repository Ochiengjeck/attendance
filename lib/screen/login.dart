import 'package:attendance/screen/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:attendance/screen/studentScreen.dart';
import 'package:attendance/screen/adminScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void navigateBasedOnEmail(String email) {
    const String emailSuffix = '@ueab.ac.ke';
    if (email.endsWith(emailSuffix)) {
      String emailPrefix = email.substring(0, email.indexOf(emailSuffix));
      if (emailPrefix.startsWith('s')) {
        if (emailPrefix.startsWith('staff')) {
          Navigator.push(
            context,
            // MaterialPageRoute(builder: (context) => StaffScreen(email: email)),
            MaterialPageRoute(builder: (context) => Homescreen()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StudentScreen(email: email)),
          );
        }
      } else if (emailPrefix.startsWith('admin')) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AdminScreen(email: email)),
        );
      } else {
        // Handle unknown email case
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Invalid Login !!"),
              content: Text("Please use a valid Email ID"),
              actions: <Widget>[
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } else {
      // Handle invalid email suffix case
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Email Error !!!"),
            content: Text(
                "Please use your school Email address,\nInclude \"@ueab.ac.ke\" "),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.chat_bubble_outline,
                  size: 100.0,
                  color: Colors.lightBlueAccent,
                ),
                SizedBox(height: 40.0),

                // Email TextField
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 20.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightBlueAccent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightBlueAccent,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),

                // Password TextField
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 20.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightBlueAccent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.lightBlueAccent,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  ),
                ),
                SizedBox(height: 24.0),

                // Login Button
                Material(
                  elevation: 5.0,
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: () {
                      String email = emailController.text.trim();
                      navigateBasedOnEmail(email);
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),

                // Register Button
                Material(
                  elevation: 5.0,
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(30.0),
                  child: MaterialButton(
                    onPressed: () {
                      // Implement registration functionality.
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
