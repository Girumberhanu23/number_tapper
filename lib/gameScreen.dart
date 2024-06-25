import 'dart:math';

import 'package:flutter/material.dart';
import 'package:number_tapper/core/constants.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  double positionX = 100;
  double positionY = 150;
  Random random = Random();

  void changeButtonPosition() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    setState(() {
      positionX = random.nextDouble() * (width - 70);
      positionY = random.nextDouble() * (height - 140);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
            text: TextSpan(
                style: TextStyle(color: white, fontSize: 24),
                children: [
              TextSpan(text: "Score: "),
              TextSpan(
                  text: "28",
                  style: TextStyle(
                      color: blue, fontSize: 26, fontWeight: FontWeight.w800))
            ])),
        actions: [
          RichText(
              text: TextSpan(
                  style: TextStyle(color: white, fontSize: 20),
                  children: [
                TextSpan(text: "Time: "),
                TextSpan(
                    text: "00\":38'",
                    style: TextStyle(
                        color: blue, fontSize: 22, fontWeight: FontWeight.w600))
              ])),
          const SizedBox(
            width: 15,
          )
        ],
        toolbarHeight: 70,
      ),
      body: Stack(
        children: [
          Positioned(
            left: positionX,
            top: positionY,
            child: ElevatedButton(
              onPressed: changeButtonPosition,
              child: Text(
                "0",
                style: TextStyle(color: white, fontSize: 16),
              ),
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(25)),
                  shape: MaterialStateProperty.all(CircleBorder()),
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
            ),
          )
        ],
      ),
    );
  }
}
