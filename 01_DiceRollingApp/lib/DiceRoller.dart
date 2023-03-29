import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(DiceRollerApp());
}

class DiceRollerApp extends StatelessWidget {
  const DiceRollerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Dice Roller App',
      debugShowCheckedModeBanner: false,
      home: DiceRoller(),
    );
  }
}

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int sum = 0;
  int diceNumber = 1;
  ChangeDice() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
      if (diceNumber == 6) {
        sum++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Dice Roller',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.restore),
          onPressed: () {
            setState(() {
              sum = 0;
            });
          }),
      body: Column(children: [
        SizedBox(
          height: 25,
        ),
        Center(
          child: Image.asset(
            "assets/dice-six-faces-${diceNumber}.png",
            height: 250,
            width: 250,
          ),
        ),
        SizedBox(
          height: 25,
        ),
        MaterialButton(
          color: Colors.blue.shade200,
          onPressed: () {
            ChangeDice();
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Roll",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 23,
        ),
        Text(
          "You Rolled:",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        Text(
          "${diceNumber}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 80,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          "You got 6 '${sum}' times.",
          style: TextStyle(fontSize: 20, color: Colors.red.shade500),
        ),
      ]),
      backgroundColor: Color.fromARGB(255, 198, 248, 72),
    );
  }
}
