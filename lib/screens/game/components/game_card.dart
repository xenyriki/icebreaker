import 'package:flutter/material.dart';
import 'package:ice_breaker/constants.dart';


class GameCard extends StatelessWidget {

  GameCard({this.cardBackColor,this.cardChild,this.onPress});

  final Color cardBackColor;
  final Text cardChild;
  final Function onPress;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        height: MediaQuery.of(context).size.width - 100,
        width: double.maxFinite,
        child: Card(
            color: cardBackColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(
                color: kPrimaryColor,
                width: 7.0
              )
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  cardChild,
                ],
              ),
            )
        ),
      ),
    );
  }
}
