import 'package:nova_geocoder/models/geocode_status.dart';
import 'package:nova_geocoder/nova_geocoder.dart';
import 'package:test/test.dart';

void main() {
  const apiKey = 'api-key';
  //
  test('LatLng to address', () async {
    final geocoder = Geocoder(apiKey);
    final resp = await geocoder.fromLatLng(37.773972, -122.431297);
    if (!resp.isSuccess) {
      expect(resp.results.length, 0);
    } else {
      expect(resp.status, GeocodeStatus.ok);
      expect(resp.results.length, greaterThan(0));
      expect(resp.results.first.getSimpleAddress().city, 'San Francisco');
    }
  });

  //
  test('Text to address', () async {
    final geocoder = Geocoder(apiKey);
    final resp = await geocoder.fromAddress('Golden Gate Heights');
    if (!resp.isSuccess) {
      expect(resp.results.length, 0);
    } else {
      expect(resp.status, GeocodeStatus.ok);
      expect(resp.results.length, greaterThan(0));
      expect(resp.results.first.getSimpleAddress().city, 'San Francisco');
    }
  });
}
