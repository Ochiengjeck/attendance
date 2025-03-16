# Attendance App

This project is a Flutter application that allows lecturers to conveniently take class attendance by simply scanning student IDs. The app communicates with a MySQL database using PHP scripts provided in the "php files" folder. Follow the instructions below to set up and run the application.

## Features

- **Easy Attendance Tracking**: Lecturers can scan student IDs for quick attendance recording.
- **Database Interaction**: The app communicates with a MySQL database via PHP scripts for storing and retrieving attendance data.
- **User-Friendly Interface**: Designed with an intuitive UI for ease of use.

## Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) installed on your machine.
- [XAMPP](https://www.apachefriends.org/index.html) or any other local server environment to run PHP and MySQL.
- Basic knowledge of Flutter and PHP.

## Setup Instructions

### 1. Set Up the Database

1. **Start XAMPP**:
   - Open XAMPP Control Panel and start the Apache and MySQL services.

2. **Create a Database**:
   - Open phpMyAdmin by navigating to `http://localhost/phpmyadmin`.
   - Create a new database (e.g., `attend`).
   - Import the sql file provided in the "php files" folder into your database


2. Set Up PHP Files
Copy PHP Files:
Copy the provided PHP files from the "php files" folder into the htdocs directory of your XAMPP installation (e.g., C:\xampp\htdocs\attendance).


# NOTE: Ensure PHP Files are Correct !!
    Make sure the PHP files are configured to connect to your database. Modify the database connection details if necessary.

3. Set Up Flutter Project
clone this project into your local machine
on the terminal, run the following commnds
flutter clean
flutter create .

4. Run the Flutter App
Start the App:
Connect a device or start an emulator.
Run the Flutter app:

# Conclusion
You now have an Attendance App built with Flutter that communicates with a MySQL database to facilitate easy attendance tracking. Modify the PHP and Flutter code as needed to fit your requirements. For any issues or contributions, feel free to reach out!


### Summary of Content
- **Introduction**: Describes what the app does.
- **Features**: Highlights key functionalities.
- **Prerequisites**: Lists the necessary software and knowledge.
- **Setup Instructions**: Detailed steps for setting up the database, PHP files, and Flutter project.
- **Conclusion**: Encourages further modifications and contributions.
