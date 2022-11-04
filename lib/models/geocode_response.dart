import 'package:meta/meta.dart';

import 'address.dart';

@immutable
class GeocodeResponse {
  const GeocodeResponse._({
    required this.status,
    required this.results,
    required String? errorMessage,
  }) : _errorMessage = errorMessage;

  final String status;
  final String? _errorMessage;
  final List<Address> results;

  bool get isSuccess => status == 'OK';

  String get errorMessage => _errorMessage!;

  @override
  String toString() {
    return 'GeocodeResponse{ status: $status, _errorMessage: $_errorMessage, results: $results,}';
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
      status: map['status'] as String,
      errorMessage: map['error_message'],
      results: results,
    );
  }

  ///
  ///
  ///
  factory GeocodeResponse.fromError(String errorMessage) {
    return GeocodeResponse._(
      status: 'Error',
      errorMessage: errorMessage,
      results: const [],
    );
  }
}
