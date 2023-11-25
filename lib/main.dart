import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';
import 'package:world_time/pages/change_location.dart';
import 'package:world_time/pages/page1.dart';
import 'package:world_time/pages/page2.dart';
import 'package:world_time/pages/page3.dart';
import 'package:world_time/pages/navbar.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/nav': (context) => Navigation(),
    '/home': (context) => Home(),
    '/location': (context) => ChangeLocation(),
    '/page1': (context) => Page1(),
    '/page2': (context) => Page2(),
    '/page3': (context) => Page3(),
  }
));
