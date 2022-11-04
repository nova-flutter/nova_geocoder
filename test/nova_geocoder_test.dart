import 'package:nova_geocoder/nova_geocoder.dart';
import 'package:test/test.dart';

void main() {
  const apiKey = 'api-key';
  //
  test('LatLng to address', () async {
    final geocoder = Geocoder(apiKey);
    final resp = await geocoder.fromLatLng(37.773972, -122.431297);
    expect(resp.status, 'OK');
    expect(resp.results.length, greaterThan(0));
    expect(resp.results.first.getSimpleAddress().city, 'San Francisco');
  });

  //
  test('Text to address', () async {
    final geocoder = Geocoder(apiKey);
    final resp = await geocoder.fromAddress('Golden Gate Heights');
    expect(resp.status, 'OK');
    expect(resp.results.length, greaterThan(0));
    expect(resp.results.first.getSimpleAddress().city, 'San Francisco');
  });
}
