import 'package:flutter/material.dart';
import 'package:great_places_app/provider/places_provider.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<PlacesProvider>(
        child: const Center(
          child: Text("There are no Places here. Start adding some!"),
        ),
        builder: (ctx, greatPlaces, ch) => greatPlaces.placesList.isEmpty
            ? ch!
            : ListView.builder(
                itemCount: greatPlaces.placesList.length,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(
                      greatPlaces.placesList[i].image,
                    ),
                  ),
                  title: Text(greatPlaces.placesList[i].placeName),
                  onTap: () {
                    //TODO Go to Places Detail Screen
                  },
                ),
              ),
      ),
    );
  }
}
