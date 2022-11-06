import 'package:nova_google_services_core/nova_google_services_core.dart';

import '../models/geocode_response.dart';

class Geocoder extends GoogleWebService {
  String? _region;
  String? _locationType;

  Geocoder({
    String? apiKey,
    bool debug = false,
  }) : super(
          baseUri: Uri.https('maps.googleapis.com'),
          serviceName: 'NovaGeocoder',
          debug: debug,
          apiKey: apiKey,
        );

  String? get region => _region;

  String? get locationType => _locationType;

  void setRegion(String region) => _region = region;

  void setLocationType(String type) => _locationType = type;

  ///
  ///
  ///
  Future<GeocodeResponse> fromLatLng(
    double latitude,
    double longitude, {
    String? apiKey,
    String? language,
    String? region,
    String? locationType,
  }) async {
    final fRegion = region ?? _region;
    final fLocationType = locationType ?? _locationType;

    final qp = <String, dynamic>{
      'latlng': '$latitude,$longitude',
      if (language != null) 'language': language,
      if (fRegion != null) 'region': fRegion,
      if (fLocationType != null) 'location_type': fLocationType,
    };

    try {
      final data = await doGet(
        path: '/maps/api/geocode/json',
        params: qp,
      );
      return GeocodeResponse.fromMap(data);
    } catch (error) {
      final gr = GeocodeResponse.fromError(error.toString());
      return gr;
    }
  }

  ///
  ///
  ///
  Future<GeocodeResponse> fromAddress(
    String address, {
    String? apiKey,
    String? language,
    String? region,
    String? locationType,
  }) async {
    final fRegion = region ?? _region;
    final fLocationType = locationType ?? _locationType;

    final qp = <String, dynamic>{
      'address': address,
      if (apiKey != null) 'key': apiKey,
      if (language != null) 'language': language,
      if (fRegion != null) 'region': fRegion,
      if (fLocationType != null) 'location_type': fLocationType,
    };

    try {
      final data = await doGet(
        path: '/maps/api/geocode/json',
        params: qp,
      );
      return GeocodeResponse.fromMap(data);
    } catch (error) {
      final gr = GeocodeResponse.fromError(error.toString());
      return gr;
    }
  }
}
