import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page2.dart'; // Pastikan ini sesuai dengan nama file yang kamu buat

void main() {
    WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kasir Cafe',
      home: Login_Page2(),
    );
  }
}

