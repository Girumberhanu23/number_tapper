import 'package:flutter/material.dart';
import 'package:number_tapper/core/constants.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
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
            child: ElevatedButton(
              onPressed: () {},
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
