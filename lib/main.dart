import 'package:animation_sample/samples/sample1.dart';
import 'package:animation_sample/samples/sample2.dart';
import 'package:animation_sample/samples/sample3.dart';
import 'package:animation_sample/samples/sample5.dart';
import 'package:animation_sample/samples/sample6.dart';
import 'package:animation_sample/samples/smaple4.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Sample6());
  }
}
