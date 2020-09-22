import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ice_breaker/constants.dart';
import 'package:ice_breaker/models/questions_dictionary.dart';
import 'package:ice_breaker/screens/game/components/game_card.dart';
import 'package:flip_card/flip_card.dart';

QuestionsDictionary questDic = QuestionsDictionary();

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  GlobalKey<FlipCardState> cardKeyPlayer1 = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> cardKeyPlayer2 = GlobalKey<FlipCardState>();

  String updatedQuestion = '';
  int level = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //PLAYER 1
            buildGameCard(cardKeyPlayer1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Ink(
                  decoration: ShapeDecoration(
                    color: kBackgroundButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.brightness_5),
                    color: kMainTextColor,
                    onPressed: () {
                      buildPopUpMenu(context);
                    },
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 80.0),
                  child: Text(
                    'Progress',
                    style: kLabelButtonStyle2,
                  ),
                  decoration: BoxDecoration(
                    color: kBackgroundButtonColor,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                Ink(
                  decoration: ShapeDecoration(
                    color: kBackgroundButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.replay_outlined),
                    color: kMainTextColor,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            //PLAYER 2
            buildGameCard(cardKeyPlayer2),
          ],
        ),
      ),
    );
  }

Widget buildGameCard(player) {
    return
      FlipCard(
        key: player,
        flipOnTouch: false,
        front: GameCard(
          onPress: () {
            player.currentState.toggleCard();
            setState(
                  () {
                if(questDic.nextLevel()){
                  if(level == 3){
                    questDic.resetUsedQuestions();
                    buildPopUpEndGame(context);
                    //toggle card
                    player.currentState.toggleCard();
                  }else{
                    //toggle card obviously
                    player.currentState.toggleCard();
                    //increase level
                    level++;
                    //restart _usedQuestions list
                    questDic.resetUsedQuestions();
                    //show popup going to next level
                    buildPopUpNextLevel(context);
                  }
                }else{
                  updatedQuestion = questDic.getQuestion(level);
                }
              },
            );
          },
          cardBackColor: kPrimaryColor,
          cardChild: Text(
            'LEVEL '+ level.toString(),
            style: kLabelCardStyle,
          ),
        ),
        back: GameCard(
          cardBackColor: kBackgroundColor,
          cardChild: Text(
            updatedQuestion,
            style: kQuestionCardStyle,
            textAlign: TextAlign.center,
          ),
          onPress: () {
            player.currentState.toggleCard();
          },
        ),
      );
  }
}

buildPopUpMenu(context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return RotatedBox(
        quarterTurns: 1,
        child: Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            height: MediaQuery.of(context).size.width - 100,
            width: MediaQuery.of(context).size.height - 450,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('MENU', style: kMenuTitleStyle),
                  SizedBox(
                    width: double.infinity,
                    height: 20.0,
                  ),
                  FlatButton(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Change level',
                      style: kMenuOptionsStyle,
                    ),
                    onPressed: () {},
                  ),
                  FlatButton(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Exit',
                      style: kMenuOptionsStyle,
                    ),
                    onPressed: () {
                      questDic.resetUsedQuestions();
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

buildPopUpNextLevel(context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          height: MediaQuery.of(context).size.width - 100,
          width: MediaQuery.of(context).size.height - 450,
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('CONGRATS LEVEL COMPLETE', style: kMenuTitleStyle),
                SizedBox(
                  width: double.infinity,
                  height: 20.0,
                ),
                FlatButton(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Next Level',
                    style: kMenuOptionsStyle,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

buildPopUpEndGame(context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          height: MediaQuery.of(context).size.width - 100,
          width: MediaQuery.of(context).size.height - 450,
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('END GAME', style: kMenuTitleStyle),
                SizedBox(
                  width: double.infinity,
                  height: 20.0,
                ),
                FlatButton(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'EXIT',
                    style: kMenuOptionsStyle,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}