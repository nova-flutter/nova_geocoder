# Nova Geocoder [![Pub](https://img.shields.io/pub/v/nova_geocoder.svg)](https://pub.dev/packages/nova_geocoder)

A package to transform a description of a location i.e. street address, town name into latitude and longitude and vice versa.

This package uses [Google Maps Geocoding API](https://developers.google.com/maps/documentation/geocoding/intro) and requires an API key. Please check [this link](https://developers.google.com/maps/documentation/geocoding/get-api-key) out to obtain your API key.

🍭 Remember to enable `Geocoding API` for your API key.

### Sample Usage

```dart
import 'package:nova_geocoder/nova_geocoder.dart';

final geocoder = Geocoder(apiKey: 'api-key')
  ..setLanguage('en')
  ..setRegion('us');

final response1 = await geocoder.fromLatLng(37.773972, -122.431297);
if (!response1.isSuccess) {
  print('Response 1 error: ${response1.errorMessage}\n');
} else {
  print('Response 1 \n');
  final location = response1.results.first;
  print(location.geometry.location);
  print(location.geometry.bounds);
  print(location.geometry.viewport);
  print(location.formattedAddress);
}

final response2 = await geocoder.fromAddress('Golden Gate Heights');
if (!response2.isSuccess) {
  print('Response 2 error: ${response2.errorMessage}\n');
} else {
  print('Response 2 \n');
  final location = response2.results.first;
  print(location.geometry.location);
  print(location.geometry.bounds);
  print(location.geometry.viewport);
  print(location.formattedAddress);

  final simpleAddress = location.getSimpleAddress();
  print(simpleAddress.location);
  print(simpleAddress.city);
  print(simpleAddress.country);
}

geocoder.dispose();
```
