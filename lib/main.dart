import 'package:animation_experiment/shaker_widget/shaker_widget_example.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations Experiment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ShakerWidgetExample(),
    );
  }
}
