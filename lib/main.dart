import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        platform: TargetPlatform.android,
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Color(0xFF0A0E21),
              secondary: Color(0xFFEB155),
            ),
        // scaffoldBackgroundColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF500E28),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w300,
            letterSpacing: 5,
            shadows: <Shadow>[
              Shadow(
                color: Color(0xFFFFFFFF),
                offset: Offset(0.5, 0.5),
                blurRadius: 5,
              ),
            ],
          ),
          color: Color(0xFF500E28),
          // toolbarHeight: 40,
          // elevation: 0,
          centerTitle: true,
        ),
      ),
      home: InputPage(),
    );
  }
}
