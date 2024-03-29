import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddPage extends StatefulWidget {
  final Map? todo;

  AddPage({
    Key? key,
    this.todo,
  }) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController titleController =
      TextEditingController(); //controllers declaring as a top level variable
  TextEditingController descriptionController =
      TextEditingController(); //controllers

  bool isEdit = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.todo != null) {
      isEdit = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
            title: Text(isEdit ? 'Edit Page' : 'Add Todo'),
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
              onPressed: 
              isEdit? updateData : submitData,
              child: Text(
                isEdit? 'Update' : 'Submit'),
            ),
          ]),
        ),
      ),
    );
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
      titleController.text = ''; //resets the form

      descriptionController.text = ''; //resets the form empty

      print('Todo added successfully');

      showSuccessMessage('Todo added successfully');
    } else {
      print('creation failure');
      showErrorMessage('creation failure');
    }
  }

  void showSuccessMessage(String message) {
    final snackBar = SnackBar(content: Text(message));

    ScaffoldMessenger.of(context).showSnackBar(snackBar); //show snackbar
  }

// need to make changes to make it work edit: kept inside materialapp and it worked

  void showErrorMessage(String message) {
    final snackBar = SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red);

    ScaffoldMessenger.of(context).showSnackBar(snackBar); //show snackbar
  }

//just to continue on the journey

//idk why i understood most of it swagger api and all debugged that bug by wnsuring it is a top level variable above override
//challenging fun nighttime code is good i guess

//time stamp 18:00

}
