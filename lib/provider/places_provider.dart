import 'package:flutter/widgets.dart';

import '../models/place.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _places = [];

  List<Place> get placesList {
    return [..._places];
  }
}
