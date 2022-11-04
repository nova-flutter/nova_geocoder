import 'package:meta/meta.dart';

@immutable
class Coordinates {
  const Coordinates.fromLatLng(this.latitude, this.longitude);

  const Coordinates({
    required this.latitude,
    required this.longitude,
  });

  Coordinates.fromMap(Map<String, dynamic> map)
      : latitude = map["lat"].toDouble(),
        longitude = map["lng"].toDouble();

  final double latitude;

  final double longitude;

  @override
  String toString() => '{$latitude,$longitude}';
}
