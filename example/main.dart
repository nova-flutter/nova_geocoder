import 'package:nova_geocoder/nova_geocoder.dart';

void main(List<String> arguments) async {
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
}
