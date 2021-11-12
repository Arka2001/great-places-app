import 'package:flutter/material.dart';
import 'package:great_places_app/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

import 'provider/places_provider.dart';
import 'screens/places_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => PlacesProvider(),
      child: MaterialApp(
        title: 'Great Places',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        initialRoute: '/',
        routes: {
          PlacesListScreen.routeName: (ctx) => const PlacesListScreen(),
          AddPlaceScreen.routeName: (ctx) => const AddPlaceScreen(),
        },
      ),
    );
  }
}
