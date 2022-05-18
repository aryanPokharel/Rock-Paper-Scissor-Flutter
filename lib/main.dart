import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rock Paper Scissors',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int moveNumber = 1;
  int userMove = 0;
  String result = '';
  int score = 0;
  String resultColor = 'yellow';

  String calculator(userMove, computerMove) {
    if (userMove == computerMove) {
      result = 'draw';
      resultColor = 'yellow';
    } else if (userMove == 1 && computerMove == 2) {
      result = 'lost';
      score--;
      resultColor = 'red';
    } else if (userMove == 1 && computerMove == 3) {
      result = 'victory';
      score++;
      resultColor = 'green';
    } else if (userMove == 2 && computerMove == 1) {
      result = 'victory';
      score++;
      resultColor = 'green';
    } else if (userMove == 2 && computerMove == 3) {
      result = 'lost';
      score--;
      resultColor = 'red';
    } else if (userMove == 3 && computerMove == 1) {
      result = 'lost';
      score--;
      resultColor = 'red';
    } else {
      result = 'victory';
      score++;
      resultColor = 'green';
    }
    return result;
  }

  void paper() {
    setState(() {
      moveNumber = Random().nextInt(3) + 1;
      userMove = 1;
      calculator(userMove, moveNumber);
    });
  }

  void scissor() {
    setState(() {
      moveNumber = Random().nextInt(3) + 1;
      userMove = 2;
      calculator(userMove, moveNumber);
    });
  }

  void rock() {
    setState(() {
      moveNumber = Random().nextInt(3) + 1;
      userMove = 3;
      calculator(userMove, moveNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 35, 57, 0),
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Choose A Move!',
                style: TextStyle(
                  color: Colors.green,
                  fontFamily: "Font1",
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Score : $score',
            style: TextStyle(
                color: Color.fromARGB(255, 174, 4, 241),
                fontWeight: FontWeight.bold,
                fontSize: 25),
            textAlign: TextAlign.right,
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Image.asset(
              'assets/${moveNumber}.jpg',
              height: 80,
              width: 80,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "VS",
              style: TextStyle(
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                  fontSize: 40),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                shape: const CircleBorder(),
                onPressed: paper,
                child: Image.asset(
                  'assets/1.jpg',
                  height: 80,
                  width: 80,
                ),
              ),
              MaterialButton(
                shape: const CircleBorder(),
                onPressed: scissor,
                child: Image.asset(
                  'assets/2.jpg',
                  height: 80,
                  width: 80,
                ),
              ),
              MaterialButton(
                shape: const CircleBorder(),
                onPressed: rock,
                child: Image.asset(
                  'assets/3.jpg',
                  height: 80,
                  width: 80,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Result : ',
                style: TextStyle(
                    color: Color.fromARGB(255, 68, 10, 0),
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '$result',
                style: TextStyle(
                    color: (result.toLowerCase() == 'victory')
                        ? Colors.green
                        : ((result.toLowerCase() == 'draw')
                            ? Colors.yellow
                            : Colors.red),
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
          SizedBox(
            height: 50,
            child: Text('The ad shall be displayed here!'),
          ),
        ],
      ),
    );
  }
}
