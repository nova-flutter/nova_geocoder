import 'package:nova_google_services_core/nova_google_services_core.dart';

import 'address.dart';

class GeocodeResponse {
  const GeocodeResponse._({
    required this.status,
    required this.results,
    this.errorMessage,
  });

  final ResponseStatus status;
  final String? errorMessage;
  final List<Address> results;

  ///
  ///
  ///
  bool get isSuccess => status == ResponseStatus.ok;

  @override
  String toString() {
    return 'GeocodeResponse{status: $status, errorMessage: $errorMessage, results: $results}';
  }

  ///
  ///
  ///
  factory GeocodeResponse.fromMap(Map<String, dynamic> map) {
    final results = <Address>[];

    final jResults = map['results'] as List;
    if (jResults.isNotEmpty) {
      for (final item in jResults) {
        final address = Address.fromMap(item);
        results.add(address);
      }
    }

    return GeocodeResponse._(
      status: ResponseStatus.fromValue(map['status']),
      errorMessage: map['error_message'],
      results: results,
    );
  }

  ///
  ///
  ///
  factory GeocodeResponse.fromError(String errorMessage) {
    return GeocodeResponse._(
      status: ResponseStatus.unknownError,
      errorMessage: errorMessage,
      results: const [],
    );
  }
}
