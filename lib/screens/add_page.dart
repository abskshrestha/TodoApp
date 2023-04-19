import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddPage extends StatefulWidget {
  @override
  State<AddPage> createState() => _AddPageState();
}

TextEditingController titleController =
    TextEditingController(); //controllers declaring as a top level variable
TextEditingController descriptionController =
    TextEditingController(); //controllers

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Add Todo'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context); //goes back to previous page
              },
            )),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Add todo',
              ),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                hintText: 'Description',
              ),
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: 8,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: submitData,
              child: const Text('Submit'),
            ),
          ]),
        ),
      ),
    );
  }
}

//this is just to give it a start
//commit everyday
//this is the only that is different from the previous commit

Future<void> submitData() async {
  //network call take some time so we use async and await
  //get the data from the form

  // var titleController = TextEditingController();
  final title = titleController.text;
  // var descriptionController = TextEditingController();
  final description = descriptionController.text;

  final body = {
    'title': title,
    'description': description,
    'isCompleted': false,
  };

  //submit data to the  server
  const url = 'http://api.nstack.in/v1/todos';

  //provided by backend dev
  final uri = Uri.parse(url); //convert url to uri locator to identifier
  final response = await http.post(
    uri,
    body: jsonEncode(body),
    headers: {'Content-Type': 'application/json'},
  );
  //show success of fail message based on status

  print(response.statusCode);
  print(response.body);

  if (response.statusCode == 201) {
    print('Todo added successfully');
  } else {
    print('error');
    print(response.body);
  }
}

  //just to continue on the journey


//idk why i understood most of it swagger api and all debugged that bug by wnsuring it is a top level variable above override
//challenging fun nighttime code is good i guess

