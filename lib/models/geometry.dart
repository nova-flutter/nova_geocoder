import 'package:meta/meta.dart';

import 'coordinates.dart';

@immutable
class Geometry {
  const Geometry({
    this.bounds,
    required this.location,
    required this.locationType,
    required this.viewport,
  });

  final Bounds? bounds;
  final Coordinates location;
  final String locationType;
  final Viewport viewport;

  @override
  String toString() {
    return 'Geometry{ bounds: $bounds, location: $location, locationType: $locationType, viewport: $viewport,}';
  }

  factory Geometry.fromMap(Map<String, dynamic> map) {
    return Geometry(
      bounds: map['bounds'] == null ? null : Bounds.fromMap(map['bounds']),
      location: Coordinates.fromMap(map['location']),
      locationType: map['location_type'] as String,
      viewport: Viewport.fromMap(map['viewport']),
    );
  }
}

@immutable
class Bounds {
  const Bounds({
    required this.northeast,
    required this.southwest,
  });

  final Coordinates northeast;
  final Coordinates southwest;

  @override
  String toString() {
    return 'Bounds{ northeast: $northeast, southwest: $southwest,}';
  }

  factory Bounds.fromMap(Map<String, dynamic> map) {
    return Bounds(
      northeast: Coordinates.fromMap(map['northeast']),
      southwest: Coordinates.fromMap(map['southwest']),
    );
  }
}

@immutable
class Viewport {
  const Viewport({
    required this.northeast,
    required this.southwest,
  });

  final Coordinates northeast;
  final Coordinates southwest;

  @override
  String toString() {
    return 'Viewport{ northeast: $northeast, southwest: $southwest,}';
  }

  factory Viewport.fromMap(Map<String, dynamic> map) {
    return Viewport(
      northeast: Coordinates.fromMap(map['northeast']),
      southwest: Coordinates.fromMap(map['southwest']),
    );
  }
}
