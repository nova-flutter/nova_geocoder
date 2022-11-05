import 'lat_lng_literal.dart';

class Geometry {
  const Geometry({
    this.bounds,
    required this.location,
    required this.locationType,
    required this.viewport,
  });

  final Bounds? bounds;
  final LatLngLiteral location;
  final String locationType;
  final Viewport viewport;

  @override
  String toString() {
    return 'Geometry{ bounds: $bounds, location: $location, locationType: $locationType, viewport: $viewport,}';
  }

  factory Geometry.fromMap(Map<String, dynamic> map) {
    return Geometry(
      bounds: map['bounds'] == null ? null : Bounds.fromMap(map['bounds']),
      location: LatLngLiteral.fromMap(map['location']),
      locationType: map['location_type'] as String,
      viewport: Viewport.fromMap(map['viewport']),
    );
  }
}

class Bounds {
  const Bounds({
    required this.northeast,
    required this.southwest,
  });

  final LatLngLiteral northeast;
  final LatLngLiteral southwest;

  @override
  String toString() {
    return 'Bounds{ northeast: $northeast, southwest: $southwest,}';
  }

  factory Bounds.fromMap(Map<String, dynamic> map) {
    return Bounds(
      northeast: LatLngLiteral.fromMap(map['northeast']),
      southwest: LatLngLiteral.fromMap(map['southwest']),
    );
  }
}

class Viewport {
  const Viewport({
    required this.northeast,
    required this.southwest,
  });

  final LatLngLiteral northeast;
  final LatLngLiteral southwest;

  @override
  String toString() {
    return 'Viewport{ northeast: $northeast, southwest: $southwest,}';
  }

  factory Viewport.fromMap(Map<String, dynamic> map) {
    return Viewport(
      northeast: LatLngLiteral.fromMap(map['northeast']),
      southwest: LatLngLiteral.fromMap(map['southwest']),
    );
  }
}
