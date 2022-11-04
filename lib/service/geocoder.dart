import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import '../models/geocode_response.dart';

class Geocoder {
  Geocoder(this._apiKey)
      : _log = Logger('NovaGeocode'),
        _language = 'en';

  final Logger _log;
  String _apiKey;
  String _language;
  String? _region;
  String? _locationType;

  String get apiKey => _apiKey;

  String get language => _language;

  String? get region => _region;

  String? get locationType => _locationType;

  void setApiKey(String key) => _apiKey = key;

  void setLanguage(String language) => _language = language;

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
    final fApiKey = apiKey ?? _apiKey;
    final fLanguage = language ?? _language;
    final fRegion = region ?? _region;
    final fLocationType = locationType ?? _locationType;

    final qp = <String, dynamic>{
      'key': fApiKey,
      'latlng': '$latitude,$longitude',
      'language': fLanguage,
      if (fRegion != null) 'region': fRegion,
      if (fLocationType != null) 'location_type': fLocationType,
    };

    final resp = await _handleRequest(qp);
    return resp;
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
    final fApiKey = apiKey ?? _apiKey;
    final fLanguage = language ?? _language;
    final fRegion = region ?? _region;
    final fLocationType = locationType ?? _locationType;

    final qp = <String, dynamic>{
      'key': fApiKey,
      'address': address,
      'language': fLanguage,
      if (fRegion != null) 'region': fRegion,
      if (fLocationType != null) 'location_type': fLocationType,
    };

    final resp = await _handleRequest(qp);
    return resp;
  }

  ///
  ///
  ///
  Future<GeocodeResponse> _handleRequest(
    Map<String, dynamic> queryParams,
  ) async {
    final url = Uri.https(
      'maps.googleapis.com',
      '/maps/api/geocode/json',
      queryParams,
    );

    _log.info('Request: ${url.toString()}');

    try {
      var response = await http.get(url);
      final data = response.body;
      _log.info('Request: ${url.toString()}, Response: $data');
      final jsonBody = json.decode(data);
      final gr = GeocodeResponse.fromMap(jsonBody);
      return gr;
    } catch (error) {
      _log.warning('Request: ${url.toString()}, Response: $error');
      final gr = GeocodeResponse.fromError(error.toString());
      return gr;
    }
  }
}
