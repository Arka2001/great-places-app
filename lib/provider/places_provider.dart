import 'dart:io';

import 'package:flutter/widgets.dart';

import '../models/place.dart';
import '../helper/db_helper.dart';

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
    DBHelper.insert('places', {
      'id': newPlace.id,
      'title': newPlace.placeName,
      'image': newPlace.image.path,
    });
  }
}
