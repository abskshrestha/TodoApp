import 'dart:convert';

import 'package:flutter/material.dart';
import '../screens/add_page.dart';
import 'package:http/http.dart' as http;

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To do list"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return const ListTile(
            title: Text('Sample Text'),
          );
        },
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

  Future<void> fetchTodo() async {
    //API get call
    final url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['items'] as List; //converts to srting

      setState(() {
        items = result;
      });
    } else {
      //show error
    }
  }


  //notes snaack bar but in add page 
  // need to learn todo ??
  //maja toh aa raha hao bt i beed to undeastand
}
