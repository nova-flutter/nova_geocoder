///
///
///
class LatLngLiteral {
  const LatLngLiteral({
    required this.lat,
    required this.lng,
  });

  /// Latitude in decimal degrees
  final double lat;

  /// Longitude in decimal degrees
  final double lng;

  @override
  String toString() {
    return 'LatLngLiteral{ lat: $lat, lng: $lng,}';
  }

  factory LatLngLiteral.fromMap(Map<String, dynamic> map) {
    return LatLngLiteral(
      lat: map['lat'].toDouble(),
      lng: map['lng'].toDouble(),
    );
  }
}
