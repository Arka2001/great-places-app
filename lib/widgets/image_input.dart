import 'dart:io';

import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({Key? key}) : super(key: key);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      //* For the image preview
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey,
          ),
        ),
        child: _selectedImage != null
            ? Image.file(
                _selectedImage!,
                fit: BoxFit.cover,
                width: double.infinity,
              )
            : Text('No Image selected', textAlign: TextAlign.center),
        alignment: Alignment.center,
      ),
      SizedBox(height: 10),
      Expanded(
        child: OutlinedButton.icon(
          icon: Icon(Icons.camera),
          onPressed: () {
            //TODO Open the camera/gallery, i.e., the image picker
          },
          label: Text('Take Picture'),
        ),
      ),
    ]);
  }
}
