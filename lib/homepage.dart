import 'dart:async';

import 'package:flappybird/doge.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double dogeYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = dogeYaxis;
  bool gameHasStarted = false;

  void jump() {
    setState(() {
      time = 0;
      initialHeight = dogeYaxis;
    });
  }

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      time += 0.04;
      height = -4.9 * time * time + 3.7 * time;
      setState(() {
        // dogeYaxis = dogeYaxis + 0.1;
        dogeYaxis = initialHeight - height;
      });

      if (dogeYaxis > 1) {
        timer.cancel();
        gameHasStarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  if (gameHasStarted) {
                    jump();
                  } else {
                    startGame();
                  }
                },
                child: AnimatedContainer(
                  alignment: Alignment(0, dogeYaxis),
                  duration: Duration(milliseconds: 0),
                  color: Colors.blue,
                  child: MyDoge(),
                ),
              )),

          Container(
            height:15,
            color: Colors.green
          ),

          Expanded(
            child: Container(
              color: Colors.brown[700],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("SCORE", style:TextStyle(color: Colors.white, fontSize: 20)),
                        SizedBox(
                          height: 20,
                        ),
                        Text("0",style:TextStyle(color: Colors.white, fontSize: 40)),
                      ]),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("HIGH SCORE",style:TextStyle(color: Colors.white, fontSize: 20)),
                        SizedBox(
                          height: 20,
                        ),
                        Text("10",style:TextStyle(color: Colors.white, fontSize: 40)),
                      ])
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
