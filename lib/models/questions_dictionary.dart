import 'dart:math';
import 'questions.dart';


class QuestionsDictionary {

  Random _random = Random();

  List<Question> _questionData = [
    Question(
      level: 1,
      questionText: '"What do you think is the hardest part of what I do for a living?"',
    ),
    Question(
      level: 1,
      questionText: '"What reality show do you think I\'m most likely to binge watch? Explain."',
    ),
    Question(
      level: 1,
      questionText: '"What\'s the first thing you noticed about me?"',
    ),
    Question(
      level: 1,
      questionText: '"If Myspace was still a thing what would my profile song be?"',
    ),
  ];

  //Get random number to get the index of the list question to show
  int getRandom(){
    int min = 0, max = _questionData.length;
    return min + _random.nextInt(max - min);
  }


  List<int> _usedQuestions = []; //empty list to save used question index
  int _questionIndex = 0;

  bool checkUsedQuestions(int _number){
    //checks if the random number exists in the used questions
    if(_usedQuestions.contains(_number)){
      return false;
    }
    return true;
  }

  String getQuestion(int currentLevel){
    bool checked = false;
    //while the number exists in the used questions list we will be generating random numbers
    //else we add the number to the list and return the question
    while(!checked){
      _questionIndex = getRandom();
      if(checkUsedQuestions(_questionIndex)){
        _usedQuestions.add(_questionIndex);
        checked = true;
      }
    }
    print(_questionIndex);
    print(_usedQuestions);
    return _questionData[_questionIndex].questionText;
  }

  void resetUsedQuestions(){
    //Empty the used questions list
    _usedQuestions.clear();
  }

  bool nextLevel(){
    //if the len of the used questions is equal to the len of the total questions we go to next level
    if(_usedQuestions.length==_questionData.length){
      //all questions have been showed so next lvl obviously
      return true;
    }
    return false;
  }
}



