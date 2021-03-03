import 'package:bmi_calculator/details.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF0A0e19),
        primaryColor: Color(0xFF0A0e23)
      ),
      routes: {
        '/': (context)=>InputPage(),

      },
    );
  }
}


