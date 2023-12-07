import 'package:artifia_quiz_app/utility/function.dart';
import 'package:artifia_quiz_app/viewModel/home_Screen.dart';
import 'package:artifia_quiz_app/viewModel/quiz_Page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({super.key});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<QuizProvider>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          prov.mark <= 3
              ? Image.asset('assets/low score.png')
              : Image.asset('assets/Group 8.png'),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
              onPressed: () {
                prov.indexIncrease = 0;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            prov.mark <= 3 ? Quiz_page() : MyHome_Page()));
              },
              child: prov.mark <= 3 ? const Text('try Again') : Text('Back'))
        ],
      )),
    );
  }
}
