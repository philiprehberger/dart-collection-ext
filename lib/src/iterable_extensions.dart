/// Extension methods for Iterable.
extension IterableExt<T> on Iterable<T> {
  /// Group elements by a key function.
  ///
  /// ```dart
  /// [1, 2, 3, 4].groupBy((n) => n.isEven ? 'even' : 'odd')
  /// // => {'odd': [1, 3], 'even': [2, 4]}
  /// ```
  Map<K, List<T>> groupBy<K>(K Function(T) key) {
    final map = <K, List<T>>{};
    for (final element in this) {
      (map[key(element)] ??= []).add(element);
    }
    return map;
  }

  /// Count elements by a key function.
  ///
  /// ```dart
  /// ['a', 'b', 'a', 'c', 'a'].countBy((s) => s)
  /// // => {'a': 3, 'b': 1, 'c': 1}
  /// ```
  Map<K, int> countBy<K>(K Function(T) key) {
    final map = <K, int>{};
    for (final element in this) {
      final k = key(element);
      map[k] = (map[k] ?? 0) + 1;
    }
    return map;
  }

  /// Split into chunks of [size].
  ///
  /// ```dart
  /// [1, 2, 3, 4, 5].chunk(2) // => [[1, 2], [3, 4], [5]]
  /// ```
  List<List<T>> chunk(int size) {
    if (size <= 0) throw ArgumentError.value(size, 'size', 'Must be positive');
    final list = toList();
    final chunks = <List<T>>[];
    for (var i = 0; i < list.length; i += size) {
      chunks.add(list.sublist(i, i + size > list.length ? list.length : i + size));
    }
    return chunks;
  }

  /// Remove duplicates by a key function.
  ///
  /// ```dart
  /// [{'id': 1}, {'id': 2}, {'id': 1}].distinctBy((m) => m['id'])
  /// // => [{'id': 1}, {'id': 2}]
  /// ```
  Iterable<T> distinctBy<K>(K Function(T) key) sync* {
    final seen = <K>{};
    for (final element in this) {
      if (seen.add(key(element))) {
        yield element;
      }
    }
  }

  /// Find the element with the minimum value by a key function.
  ///
  /// Returns `null` if the iterable is empty.
  T? minBy<K extends Comparable<K>>(K Function(T) key) {
    T? result;
    K? minKey;
    for (final element in this) {
      final k = key(element);
      if (minKey == null || k.compareTo(minKey) < 0) {
        result = element;
        minKey = k;
      }
    }
    return result;
  }

  /// Find the element with the maximum value by a key function.
  ///
  /// Returns `null` if the iterable is empty.
  T? maxBy<K extends Comparable<K>>(K Function(T) key) {
    T? result;
    K? maxKey;
    for (final element in this) {
      final k = key(element);
      if (maxKey == null || k.compareTo(maxKey) > 0) {
        result = element;
        maxKey = k;
      }
    }
    return result;
  }

  /// Pair elements with another iterable.
  ///
  /// ```dart
  /// [1, 2, 3].zip(['a', 'b', 'c']) // => [(1, 'a'), (2, 'b'), (3, 'c')]
  /// ```
  Iterable<(T, U)> zip<U>(Iterable<U> other) sync* {
    final iterA = iterator;
    final iterB = other.iterator;
    while (iterA.moveNext() && iterB.moveNext()) {
      yield (iterA.current, iterB.current);
    }
  }

  /// Like [firstWhere] but returns `null` instead of throwing.
  ///
  /// ```dart
  /// [1, 2, 3].firstWhereOrNull((n) => n > 5) // => null
  /// ```
  T? firstWhereOrNull(bool Function(T) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  /// Return a sorted copy by a key function.
  ///
  /// ```dart
  /// ['banana', 'apple', 'cherry'].sortedBy((s) => s.length)
  /// // => ['apple', 'banana', 'cherry']
  /// ```
  List<T> sortedBy<K extends Comparable<K>>(K Function(T) key) {
    final list = toList();
    list.sort((a, b) => key(a).compareTo(key(b)));
    return list;
  }
}
