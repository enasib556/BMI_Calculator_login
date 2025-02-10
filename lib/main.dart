import 'package:flutter/material.dart';
import 'package:project1/pages/BMI/bmi_calculator.dart';
import 'package:project1/pages/calculator.dart';
import 'package:project1/pages/login.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiCalculator() ,
    );
  }
}
