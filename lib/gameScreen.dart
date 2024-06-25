import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:number_tapper/core/constants.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  double positionX = 0;
  double positionY = 0;
  Random random = Random();
  Timer? timer;
  int timeRemaining = 30;
  int score = 0;
  int highScore = 0;

  void changeButtonPosition() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    setState(() {
      positionX = random.nextDouble() * (width - 70);
      positionY = random.nextDouble() * (height - 140);
    });
  }

  void startGame() {
    setState(() {
      positionX = 0;
      positionY = 0;
      timeRemaining = 30;
      score = 0;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timeRemaining > 0) {
          timeRemaining--;
        } else {
          timer.cancel();
          endGame();
        }
      });
    });
  }

  void endGame() {
    if (score > highScore) {
      setState(() {
        highScore = score;
      });
    }
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Game Over'),
            content: RichText(
                text: TextSpan(
                    style: TextStyle(color: black, fontSize: 20),
                    children: [
                  TextSpan(text: "Score: "),
                  TextSpan(
                      text: score.toString(),
                      style: TextStyle(
                          color: blue,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                  TextSpan(text: "\nHighScore: "),
                  TextSpan(
                      text: highScore.toString(),
                      style: TextStyle(
                          color: blue,
                          fontSize: 20,
                          fontWeight: FontWeight.w500))
                ])),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  startGame();
                },
                child: Text(
                  'Play Again',
                  style: TextStyle(color: white),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(blue)),
              )
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    startGame();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
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
                  text: score.toString(),
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
                    text: "00\":${timeRemaining}'",
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
              onPressed: () {
                changeButtonPosition();
                setState(() {
                  score++;
                });
              },
              child: Text(
                (score + 1).toString(),
                style: TextStyle(
                    color: white, fontSize: 18, fontWeight: FontWeight.w600),
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
