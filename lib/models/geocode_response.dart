import 'address.dart';
import 'geocode_status.dart';

class GeocodeResponse {
  const GeocodeResponse._({
    required this.status,
    required this.results,
    this.errorMessage,
  });

  final GeocodeStatus status;
  final String? errorMessage;
  final List<Address> results;

  ///
  ///
  ///
  bool get isSuccess => status == GeocodeStatus.ok;

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
      status: GeocodeStatus.fromValue(map['status']),
      errorMessage: map['error_message'],
      results: results,
    );
  }

  ///
  ///
  ///
  factory GeocodeResponse.fromError(String errorMessage) {
    return GeocodeResponse._(
      status: GeocodeStatus.unknownError,
      errorMessage: errorMessage,
      results: const [],
    );
  }
}
