import 'package:flutter/material.dart';
import 'package:googlemapdemo/google_map_screeen.dart';
import 'package:googlemapdemo/my_location.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: MyLocation(),
    );
  }
}
