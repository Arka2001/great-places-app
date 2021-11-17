import 'dart:io';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String? address;

  PlaceLocation({
    required this.latitude,
    required this.longitude,
    this.address,
  });
}

class Place {
  final String id;
  final String placeName;
  final PlaceLocation?
      location; //* Since any location consists of Latitude and Longitude, as well as the address of a place, therefore we have built another class for that
  final File image; //* Since we are going to work with local images

  Place({
    required this.id,
    required this.placeName,
    required this.location,
    required this.image,
  });
}
