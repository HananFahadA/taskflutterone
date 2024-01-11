import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tasknew/TaskScreen.dart';
import 'package:tasknew/taskproider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Taskproider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(body: TaskScreen()),
      ),
    );
  }
}
