import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ice_breaker/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo_nb.png',
            scale: 2,
          ),
          Text(
            'ICE BREAKER',
            style: kTitleStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 740,
          ),
          FlatButton(
            child: Text(
              'START',
              style: kLabelButtonStyle1,
              textAlign: TextAlign.center,
            ),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 55),
            color: Colors.red,
            onPressed: () {
              Navigator.pushNamed(context, '/game');
            },
            shape: StadiumBorder(),
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 770,
          ),
          FlatButton(
            child: Text(
              'HOW TO PLAY',
              style: kLabelButtonStyle2,
              textAlign: TextAlign.center,
            ),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 55),
            color: Colors.blue,
            shape: StadiumBorder(),
            onPressed: () {
              Navigator.pushNamed(context, '/rules');
            },
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 770,
          ),
          Text('0.0.1')
        ],
      ),
    );
  }
}
