

import 'address_component.dart';
import 'geometry.dart';
import 'simple_address.dart';


class Address {
  const Address({
    required this.addressComponents,
    required this.formattedAddress,
    required this.geometry,
    required this.placeId,
    required this.types,
  });

  final List<AddressComponent> addressComponents;
  final String formattedAddress;
  final Geometry geometry;
  final String placeId;
  final List<String> types;

  @override
  String toString() {
    return 'Address{ addressComponents: $addressComponents, formattedAddress: $formattedAddress, geometry: $geometry, placeId: $placeId, types: $types,}';
  }

  SimpleAddress getSimpleAddress() {
    final address = SimpleAddress(
      streetNumber: _getAddressComponent('street_number')?.longName,
      route: _getAddressComponent('route')?.longName,
      subLocality: _getAddressComponent('sublocality')?.longName,
      locality: _getAddressComponent('locality')?.longName,
      administrativeAreaLevel3:
          _getAddressComponent('administrative_area_level_3')?.longName,
      administrativeAreaLevel2:
          _getAddressComponent('administrative_area_level_2')?.longName,
      administrativeAreaLevel1:
          _getAddressComponent('administrative_area_level_1')?.longName,
      country: _getAddressComponent('country')?.longName,
      postalCode: _getAddressComponent('postal_code')?.longName,
      location: geometry.location,
      formattedAddress: formattedAddress,
    );
    return address;
  }

  AddressComponent? _getAddressComponent(String type) {
    for (final c in addressComponents) {
      if (c.types.contains(type)) return c;
    }
    return null;
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      addressComponents: parseAddressComponentArray(map['address_components']),
      formattedAddress: map['formatted_address'] as String,
      geometry: Geometry.fromMap(map['geometry']),
      placeId: map['place_id'] as String,
      types: map['types']?.cast<String>() ?? const <String>[],
    );
  }
}
