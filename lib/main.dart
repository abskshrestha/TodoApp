import 'package:flutter/material.dart';
import 'package:todoapp/screens/todo_list.dart';
import 'screens/add_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const ToDoList(),
    );
  }
}
