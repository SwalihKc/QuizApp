import 'package:artifia_quiz_app/view/quiz_Page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final higt = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(1, 72, 20, 80),
      body: Column(
        children: [
          Container(
            height: higt / 1.5,
            width: width / 1,
            color: Color.fromARGB(1, 72, 20, 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                    'assets/pngtree-quiz-time-speech-bubble-isolated-design-png-image_6579430 1.png'),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                height: higt / 3,
                width: width / 1,
                color: Color.fromARGB(1, 72, 20, 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Quiz_page(),
                            ));
                      },
                      child: Text(
                        'Start Quiz',
                        style: GoogleFonts.kanit(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(158, 53),
                        backgroundColor: Color.fromRGBO(127, 61, 255, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const Column(
                      children: [
                        Text(
                          'powered by',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'www.artifitia.com',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
