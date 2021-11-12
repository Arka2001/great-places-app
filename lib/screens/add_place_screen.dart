import 'package:flutter/material.dart';
import 'package:great_places_app/widgets/image_input.dart';

/**
 * * AddPlaceScreen takes all the inputs from the user and then using a submit functionality we are adding the new data
 * * Since we are using a form wherein our user shall provide some sort of input, which shall invoke the change of state of the app
 * * Therefore we are using a Stateful widget for our AddPlaceScreen
 */

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({Key? key}) : super(key: key);

  static const routeName = '/add-place';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Place'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        labelText: 'Title',
                      ),
                    ),
                    SizedBox(height: 10),
                    ImageInput(),
                  ],
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                //TODO Add the new Place information to the List of Data
              },
              icon: Icon(Icons.add),
              label: Text('Add Place'),
            ),
          ],
        ),
      ),
    );
  }
}
