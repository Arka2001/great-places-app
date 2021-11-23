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
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.placeName,
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.fetch('user_places');

    _places = dataList
        .map(
          (item) => Place(
            id: item['id'],
            placeName: item['title'],
            location: null,
            image: File(
              item['image'],
            ),
          ),
        )
        .toList();
    notifyListeners();
  }
}
