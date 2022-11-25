import 'package:flutter/material.dart';
import 'package:coffee_shop_ui_08/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomePage(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.orange
      ),
    );
  }
}
