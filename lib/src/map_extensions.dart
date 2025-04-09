/// Extension methods for Map.
extension MapExt<K, V> on Map<K, V> {
  /// Filter entries by key.
  ///
  /// ```dart
  /// {'a': 1, 'b': 2, 'c': 3}.filterKeys((k) => k != 'b')
  /// // => {'a': 1, 'c': 3}
  /// ```
  Map<K, V> filterKeys(bool Function(K) test) {
    return Map.fromEntries(entries.where((e) => test(e.key)));
  }

  /// Filter entries by value.
  ///
  /// ```dart
  /// {'a': 1, 'b': 2, 'c': 3}.filterValues((v) => v > 1)
  /// // => {'b': 2, 'c': 3}
  /// ```
  Map<K, V> filterValues(bool Function(V) test) {
    return Map.fromEntries(entries.where((e) => test(e.value)));
  }

  /// Transform keys while keeping values.
  ///
  /// ```dart
  /// {'a': 1, 'b': 2}.mapKeys((k) => k.toUpperCase())
  /// // => {'A': 1, 'B': 2}
  /// ```
  Map<K2, V> mapKeys<K2>(K2 Function(K) transform) {
    return Map.fromEntries(entries.map((e) => MapEntry(transform(e.key), e.value)));
  }

  /// Returns a new map with all values transformed by [transform],
  /// keeping the original keys.
  Map<K, V2> mapValues<V2>(V2 Function(V) transform) {
    return map((key, value) => MapEntry(key, transform(value)));
  }
}
