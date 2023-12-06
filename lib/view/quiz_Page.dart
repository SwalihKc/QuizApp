import 'package:artifia_quiz_app/model/fetchData.dart';
import 'package:artifia_quiz_app/model/quiz_Data.dart';
import 'package:artifia_quiz_app/utility/function.dart';
import 'package:artifia_quiz_app/view/score_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Quiz_page extends StatefulWidget {
  const Quiz_page({super.key});

  @override
  State<Quiz_page> createState() => _Quiz_pageState();
}

int indexIncrease = 0;

bool isCorrect = false;

class _Quiz_pageState extends State<Quiz_page> {
  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
        backgroundColor: Color.fromARGB(1, 72, 20, 80),
        body: FutureBuilder<List<QuizData>>(
          future: fetchAlbum(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child:
                      CircularProgressIndicator()); // Show a loading indicator
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Text('Error: ${snapshot.error}');
            } else {
              // Display data when the API call is successful

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(alignment: Alignment.center,
                          child: Text(
                            '${snapshot.data?[indexIncrease].question}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 20, top: 10),
                            child: Container(
                              height: 60,
                              width: 10,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(13),
                                  border: Border.all(color: Colors.white),
                                  color: snapshot
                                              .data?[indexIncrease]
                                              .options[index]
                                              .isCorrect ==
                                          true
                                      ? Colors.green
                                      : Colors.red),
                              child: Text(
                                  '${snapshot.data?[indexIncrease].options[index].text}'),
                            ),
                          );
                        },
                        itemCount: 4,
                        shrinkWrap: true,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (indexIncrease <= 2) {
                            indexIncrease++;
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ScorePage(),
                                ));
                          }
                        });
                      },
                      child: Text('Next'),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(155, 50),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
          },
        ));
  }
}
