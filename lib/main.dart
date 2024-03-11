import 'package:flutter/material.dart';
import 'package:news_app/src/pages/tabs_page.dart';
import 'package:news_app/src/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: TabsPage(),
      theme: myTheme,
    );
  }
}