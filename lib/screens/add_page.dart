import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddPage extends StatefulWidget {
  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  TextEditingController titleController = TextEditingController(); //controllers
  TextEditingController descriptionController =
      TextEditingController(); //controllers
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
              onPressed: () {},
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
  //get the data from the form
  var titleController;
  final title = titleController.text;
  var descriptionController;
  final description = descriptionController.text;

  final body = {
    'title': title,
    'description': description,
    'isCompleted': false,
  };

  //submit data to the  server
  final url = 'http://api.nstack.in/v1/todos'; //provided by backend dev
  final uri = Uri.parse(url); //convert url to uri
  final response = await http.post(uri, body: body);
  //show success of fail message based on status
  print(response);
 }
