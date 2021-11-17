import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

class ImageInput extends StatefulWidget {
  final Function onSelectedImage;

  ImageInput(this.onSelectedImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(source: ImageSource.camera);

    //* This case is for handling the case that the user opened the camera but did not take any picture
    if (imageFile == null) {
      return;
    }

    setState(() {
      _selectedImage = File(imageFile.path);
    });

    //* Using the setState, we are making sure that the taken image is displayed to the add place screen.
    /**
     * * But there is no provision of adding the pictures to the local storage
     * * If we do not store the pictures in the local storage, we are losing the data which the users are trying to provide
     * * Every time we will use the app, or run it, all the data shall be erased, therefore we have to store the images on the mobile hard drive
     * * For that reason, we are going to access the Hard Drive of the mobile device and store the images at a particular location of our choice
     * * For that we are using the path_provider package to access the hard drive storage paths
     * * We are also using the path package for constructing new paths
     */

    //* First we have to get the name of the base directory of the Mobile Device, where we are allowed to store files
    final appDir = await syspaths.getApplicationDocumentsDirectory();

    //* The next thing is to get the name of the file that was added by the user, in this case, the captured image
    final basePath = await path.basename(imageFile.path);

    //* After getting these 2 data, we simply have to copy the image file to another location
    await imageFile.saveTo('${appDir.path}/$basePath');

    final savedImage = File('${appDir.path}/$basePath');

    widget.onSelectedImage(savedImage);
  }

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
            : const Text('No Image selected', textAlign: TextAlign.center),
        alignment: Alignment.center,
      ),
      const SizedBox(height: 10),
      Expanded(
        child: OutlinedButton.icon(
          icon: Icon(Icons.camera),
          onPressed: _takePicture,
          label: Text('Take Picture'),
        ),
      ),
    ]);
  }
}
