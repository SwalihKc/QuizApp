import 'package:artifia_quiz_app/viewModel/quiz_Page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHome_Page extends StatefulWidget {
  const MyHome_Page({
    super.key,
  });

  @override
  State<MyHome_Page> createState() => _MyHome_PageState();
}

class _MyHome_PageState extends State<MyHome_Page> {
  @override
  Widget build(BuildContext context) {
    final higt = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.purple[800],
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
                                builder: (context) => Quiz_page()));
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
