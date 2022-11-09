import 'package:flutter/material.dart';
import 'package:experience_flutter/pages/HomePage.dart';
import 'package:experience_flutter/pages/WelcomePage.dart';

bool switchMain = true;

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: switchMain ? HomePage() : WelcomePage(),
    ));
