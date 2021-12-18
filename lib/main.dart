import 'package:flutter/material.dart';

import 'screens/todo_screen.dart';

void main() {
  runApp(const Todey());
}

class Todey extends StatelessWidget {
  const Todey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: TodoScreen(),
    );
  }
}
