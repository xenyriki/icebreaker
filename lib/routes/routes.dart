import 'package:flutter/material.dart';
import 'package:ice_breaker/screens/game/game_screen.dart';
import 'package:ice_breaker/screens/home/home_screen.dart';
import 'package:ice_breaker/screens/rules/rules_screen.dart';

Map <String,WidgetBuilder> getAppRoutes (){
  return <String , WidgetBuilder>{
    '/home'      : ( BuildContext context ) => HomeScreen(),
    '/game'  : ( BuildContext context ) => GameScreen(),
    '/rules'  : ( BuildContext context ) => RulesScreen(),
  };
}