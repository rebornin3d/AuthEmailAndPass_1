

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:html';
import 'screens/login.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Storage App',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
                .copyWith(secondary: Colors.orange)),
        home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Image'),),
      body: Column(
        children: <Widget>[

          ElevatedButton(onPressed: () async {
            final results = await FilePicker.platform.pickFiles(
              allowMultiple: false,
              type: FileType.custom,
              allowedExtensions: ['png', 'jpg'],
            );

            if (results == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('No file selected'),
                ),
              );
              return null;
            }
            final path = results.files.single.path!;
            final fileName = results.files.single.path;

            print(path);
            print(fileName);
          },
            child: Text('Upload file'),)


        ],
      ),
    );
  }
}
