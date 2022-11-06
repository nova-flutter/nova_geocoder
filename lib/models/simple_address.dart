

import 'package:nova_google_services_core/nova_google_services_core.dart';

class SimpleAddress {
  SimpleAddress({
    this.streetNumber,
    this.route,
    this.subLocality,
    this.locality,
    this.administrativeAreaLevel3,
    this.administrativeAreaLevel2,
    this.administrativeAreaLevel1,
    this.country,
    this.postalCode,
    required this.location,
    required this.formattedAddress,
  });

  final String? streetNumber;
  final String? route;
  final String? subLocality;
  final String? locality;
  final String? administrativeAreaLevel3;
  final String? administrativeAreaLevel2;
  final String? administrativeAreaLevel1;
  final String? country;
  final String? postalCode;
  final LatLngLiteral location;
  final String formattedAddress;

  String? get city => locality;

  String? get province => administrativeAreaLevel1;

  @override
  String toString() {
    return 'SimpleAddress{streetNumber: $streetNumber, route: $route, subLocality: $subLocality, locality: $locality, administrativeAreaLevel3: $administrativeAreaLevel3, administrativeAreaLevel2: $administrativeAreaLevel2, administrativeAreaLevel1: $administrativeAreaLevel1, country: $country, postalCode: $postalCode, location: $location, formattedAddress: $formattedAddress}';
  }
}
