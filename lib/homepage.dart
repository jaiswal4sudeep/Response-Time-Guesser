import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Color> colors = [
    Colors.amberAccent,
    Colors.redAccent,
    Colors.greenAccent,
    Colors.blueAccent,
    Colors.orangeAccent,
  ];
  int randomXaxis = 10;
  int randomYaxis = 10;
  int timeTaken = 0;
  Stopwatch stopwatch = Stopwatch();

  void randomization() async {
    randomXaxis = Random().nextInt(300);
    randomYaxis = Random().nextInt(500);
    stopwatch.stop();
    setState(() {
      timeTaken = stopwatch.elapsed.inMilliseconds;
    });
  }

  @override
  void initState() {
    stopwatch = Stopwatch()..start();
    randomization();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Response Time Guesser"),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: randomXaxis.toDouble(),
            top: randomYaxis.toDouble(),
            child: GestureDetector(
              onTap: () async {
                setState(() {
                  stopwatch = Stopwatch()..start();
                  randomization();
                });
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: colors[Random().nextInt(4)],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Response Time is $timeTaken ms!",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
