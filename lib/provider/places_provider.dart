import 'dart:io';

import 'package:flutter/widgets.dart';

import '../models/place.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _places = [];

  List<Place> get placesList {
    return [..._places];
  }

  void addPlace(String title, File selectedImage) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      placeName: title,
      location: null,
      image: selectedImage,
    );

    _places.add(newPlace);
    notifyListeners();
  }
}
