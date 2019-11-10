import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;

  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: _image == null ? Text('No image selected.') : Image.file(_image),
      ),
      floatingActionButton: Row(
        children: <Widget>[
          FloatingActionButton(
            onPressed: getImageFromCamera,
            tooltip: 'Pick Image',
            child: Icon(Icons.add_a_photo),
          ),
          FloatingActionButton(
            onPressed: getImageFromGallery,
            tooltip: 'Pick Image',
            child: Icon(Icons.add_a_photo),
          ),
        ],
      ),
    );
  }
}
