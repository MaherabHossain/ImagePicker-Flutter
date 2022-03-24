

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Data(), child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  File _image;

  Future imageFromCamera() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image.path);
    });
  }

  void imageFromGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
          Container(
            height: 500,
            width: double.infinity,
            color: Colors.blue,
            child: _image == null
                ? Center(child: Text('No Image Selected'))
                : Image.file(_image),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  imageFromCamera();
                },
                icon: Icon(Icons.camera_alt_outlined),
                label: Text('Camera'),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  imageFromGallery();
                },
                icon: Icon(Icons.add_photo_alternate),
                label: Text('Camera'),
              )
            ],
          )
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
