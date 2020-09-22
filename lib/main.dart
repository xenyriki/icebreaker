import 'package:flutter/material.dart';
import 'package:ice_breaker/constants.dart';
import 'package:ice_breaker/routes/routes.dart';
import 'package:ice_breaker/screens/home/home_screen.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //hides bottom and status bar
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ice Breaker',
      initialRoute: '/home',
      routes: getAppRoutes(),
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor
      ),
      home: HomeScreen(),
    );
  }
}
