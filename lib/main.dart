import 'package:flutter/material.dart';
import 'package:water_traker_app/home_screen.dart';
import 'package:intl/intl.dart';

void main(){
  runApp(WaterTrackerApp());
}
class WaterTrackerApp extends StatelessWidget {
  const WaterTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Tracker',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
