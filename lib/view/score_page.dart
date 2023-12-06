import 'package:artifia_quiz_app/view/home_Screen.dart';
import 'package:flutter/material.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({super.key});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(1, 72, 20, 80),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/Group 8.png'),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(),));
          }, child: Text('back'))
        ],
      )),
    );
  }
}
