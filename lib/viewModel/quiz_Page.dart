import 'package:artifia_quiz_app/model/fetchData.dart';
import 'package:artifia_quiz_app/model/quiz_Data.dart';
import 'package:artifia_quiz_app/utility/function.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Quiz_page extends StatefulWidget {
  const Quiz_page({super.key});

  @override
  State<Quiz_page> createState() => _Quiz_pageState();
}

class _Quiz_pageState extends State<Quiz_page> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<QuizProvider>(context);
    final int _duration = 10;
    final CountDownController _controller = CountDownController();

    return Scaffold(
        backgroundColor: Colors.purple[600],
        body: FutureBuilder<List<QuizData>>(
          future: fetchAlbum(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Text('Error: ${snapshot.error}');
            } else {
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularCountDownTimer(
                        controller: _controller,
                        width: MediaQuery.of(context).size.width / 2.7,
                        height: MediaQuery.of(context).size.height / 2.7,
                        duration: _duration,
                        fillColor: Colors.purpleAccent[100]!,
                        ringColor: Colors.grey[300]!,
                        backgroundColor: Colors.purple[500],
                        backgroundGradient: null,
                        strokeWidth: 20.0,
                        strokeCap: StrokeCap.round,
                        textStyle: const TextStyle(
                          fontSize: 33.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),

                        // Format for the Countdown Text.
                        textFormat: CountdownTextFormat.S,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '${snapshot.data?[prov.indexIncrease].question}',
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
                                padding:
                                    const EdgeInsets.only(left: 20, top: 10),
                                child: GestureDetector(
                                  onTap: () {
                                    if (snapshot.data?[prov.indexIncrease]
                                            .options[index].isCorrect ==
                                        true) {
                                      prov.mark++;
                                    }
                                    prov.findIndex(index);
                                    _controller.pause();
                                    Future.delayed(const Duration(seconds: 3),
                                        () {
                                      prov.changeToNull();
                                    });
                                  },
                                  child: Container(
                                    height: 60,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        border: Border.all(color: Colors.white),
                                        color: prov.selectedIndex == index &&
                                                snapshot
                                                        .data?[
                                                            prov.indexIncrease]
                                                        .options[index]
                                                        .isCorrect ==
                                                    true
                                            ? Colors.green
                                            : prov.selectedIndex == index &&
                                                    snapshot
                                                            .data?[prov
                                                                .indexIncrease]
                                                            .options[index]
                                                            .isCorrect ==
                                                        false
                                                ? Colors.red
                                                : Colors.transparent),
                                    child: Text(
                                      '${snapshot.data?[prov.indexIncrease].options[index].text}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ));
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
                          prov.changeQuestion(context);
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
                ),
              );
            }
          },
        ));
  }
}
