import 'package:flutter/material.dart';
import 'package:number_tapper/core/constants.dart';
import 'package:number_tapper/gameScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Tapper Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: darkBlue,
        appBarTheme: AppBarTheme(color: darkBlue),
        useMaterial3: true,
      ),
      home: GameScreen(),
    );
  }
}
