import 'package:flutter/material.dart';
import 'package:todoapp/screens/add_page.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To do list"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          NavigateToAddPage();
        },
        label: const Text("Add Todo"),
      ),
    );
  }

  void NavigateToAddPage() {
    final route = MaterialPageRoute(builder: (context) => AddPage());
    Navigator.push(context, route);
  }
}
