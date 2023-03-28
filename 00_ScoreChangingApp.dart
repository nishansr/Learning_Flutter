import 'package:flutter/material.dart';

void main() {
  runApp(const ScoreApp());
}

class ScoreApp extends StatelessWidget {
  const ScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Score App',
      home: ScoreHome(),
    );
  }
}

class ScoreHome extends StatefulWidget {
  const ScoreHome({super.key});

  @override
  State<ScoreHome> createState() => _ScoreHomeState();
}

class _ScoreHomeState extends State<ScoreHome> {
  int stars = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
          child: Icon(Icons.restore),
          onPressed: () {
            setState(() {
              stars = 0;
            });
          }),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Score Changer'),
        titleTextStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.green.shade400,
      ),
      backgroundColor: const Color.fromARGB(255, 174, 255, 178),
      body: Column(
        children: [
          const SizedBox(height: 50),
          const Center(
            child: Text('Score is',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color.fromARGB(255, 145, 46, 46))),
          ),
          const SizedBox(height: 50),
          Text("${stars}",
              style: TextStyle(fontSize: 90, fontWeight: FontWeight.bold)),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    stars++;
                  });
                },
                child: Text('Increase',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade400,
                ),
              ),
              const SizedBox(width: 25),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      stars--;
                    });
                  },
                  child: Text(
                    'Decrease',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade400)),
            ],
          )
        ],
      ),
    );
  }
}
