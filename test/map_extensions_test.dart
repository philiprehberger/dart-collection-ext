import 'package:philiprehberger_collection_ext/collection_ext.dart';
import 'package:test/test.dart';

void main() {
  group('MapExt', () {
    test('filterKeys filters by key', () {
      final result = {'a': 1, 'b': 2, 'c': 3}.filterKeys((k) => k != 'b');
      expect(result, equals({'a': 1, 'c': 3}));
    });

    test('filterValues filters by value', () {
      final result = {'a': 1, 'b': 2, 'c': 3}.filterValues((v) => v > 1);
      expect(result, equals({'b': 2, 'c': 3}));
    });

    test('mapKeys transforms keys', () {
      final result = {'a': 1, 'b': 2}.mapKeys((k) => k.toUpperCase());
      expect(result, equals({'A': 1, 'B': 2}));
    });

    test('filterKeys preserves empty map', () {
      expect(<String, int>{}.filterKeys((_) => true), isEmpty);
    });
  });

  group('mapValues', () {
    test('transforms values', () {
      final result = {'a': 1, 'b': 2}.mapValues((v) => v * 10);
      expect(result, equals({'a': 10, 'b': 20}));
    });

    test('empty map returns empty map', () {
      final result = <String, int>{}.mapValues((v) => v.toString());
      expect(result, isEmpty);
    });

    test('can change value type', () {
      final result = {'a': 1, 'b': 2}.mapValues((v) => '$v!');
      expect(result, equals({'a': '1!', 'b': '2!'}));
    });
  });
}
