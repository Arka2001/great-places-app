import 'package:flutter/material.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Places List Screen'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/add-place');
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(child: Text('This is the places List Screen')),
    );
  }
}
