import 'package:artifia_quiz_app/viewModel/score_page.dart';
import 'package:flutter/material.dart';
class QuizProvider extends ChangeNotifier{
 int indexIncrease = 0;
 int mark = 0;

int? selectedIndex;
 findIndex(index){
   selectedIndex = index;
   notifyListeners();
 }
 changeToNull(){
  selectedIndex=null;
  notifyListeners();

 }
 changeQuestion(BuildContext context){
    if (indexIncrease <= 2) {
                            indexIncrease++;
                            

                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ScorePage(),
                                ));
                          }
                          notifyListeners();
 }

}