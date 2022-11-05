class AddressComponent {
  const AddressComponent({
    required this.shortName,
    required this.longName,
    required this.types,
  });

  final String shortName;
  final String longName;
  final List<String> types;

  @override
  String toString() {
    return 'AddressComponent{ shortName: $shortName, longName: $longName, types: $types,}';
  }

  factory AddressComponent.fromMap(Map<String, dynamic> map) {
    return AddressComponent(
      shortName: map['short_name'] as String,
      longName: map['long_name'] as String,
      types: map['types']?.cast<String>() ?? const [],
    );
  }
}

///
///
///
List<AddressComponent> parseAddressComponentArray(List? items) {
  if (items == null || items.isEmpty) return const [];
  final components = <AddressComponent>[];
  for (final item in items) {
    final comp = AddressComponent.fromMap(item);
    components.add(comp);
  }
  return components;
}
