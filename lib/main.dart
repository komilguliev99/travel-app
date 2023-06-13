import 'package:flutter/material.dart';
import 'package:travel_ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel UI',
      theme: ThemeData(
        primaryColor: Colors.blue[500],
        scaffoldBackgroundColor: const Color(0xFFF3F5F7),
      ),
      home: const HomePage(),
    );
  }
}
