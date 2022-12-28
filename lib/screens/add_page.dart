import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

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
              decoration: InputDecoration(
                hintText: 'Add todo',
              ),
            ),
            TextField(
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
