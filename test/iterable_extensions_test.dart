import 'package:philiprehberger_collection_ext/collection_ext.dart';
import 'package:test/test.dart';

void main() {
  group('IterableExt', () {
    test('groupBy groups elements', () {
      final result = [1, 2, 3, 4].groupBy((n) => n.isEven ? 'even' : 'odd');
      expect(result['odd'], equals([1, 3]));
      expect(result['even'], equals([2, 4]));
    });

    test('countBy counts occurrences', () {
      final result = ['a', 'b', 'a', 'c', 'a'].countBy((s) => s);
      expect(result, equals({'a': 3, 'b': 1, 'c': 1}));
    });

    test('chunk splits into groups', () {
      expect([1, 2, 3, 4, 5].chunk(2), equals([[1, 2], [3, 4], [5]]));
    });

    test('chunk throws on non-positive size', () {
      expect(() => [1, 2].chunk(0), throwsArgumentError);
    });

    test('distinctBy removes duplicates', () {
      final result = [1, 2, 3, 2, 1].distinctBy((n) => n).toList();
      expect(result, equals([1, 2, 3]));
    });

    test('minBy returns minimum element', () {
      expect(['banana', 'apple', 'cherry'].minBy((s) => s.length), equals('apple'));
    });

    test('minBy returns null for empty', () {
      expect(<String>[].minBy((s) => s.length), isNull);
    });

    test('maxBy returns maximum element', () {
      expect(['banana', 'apple', 'cherries'].maxBy((s) => s.length), equals('cherries'));
    });

    test('zip pairs elements', () {
      final result = [1, 2, 3].zip(['a', 'b', 'c']).toList();
      expect(result, equals([(1, 'a'), (2, 'b'), (3, 'c')]));
    });

    test('zip stops at shorter iterable', () {
      final result = [1, 2].zip(['a', 'b', 'c']).toList();
      expect(result.length, equals(2));
    });

    test('firstWhereOrNull returns null when not found', () {
      expect([1, 2, 3].firstWhereOrNull((n) => n > 5), isNull);
    });

    test('firstWhereOrNull returns first match', () {
      expect([1, 2, 3].firstWhereOrNull((n) => n > 1), equals(2));
    });

    test('sortedBy returns sorted copy', () {
      final original = ['banana', 'apple', 'cherry'];
      final sorted = original.sortedBy((s) => s.length);
      expect(sorted, equals(['apple', 'banana', 'cherry']));
      expect(original, equals(['banana', 'apple', 'cherry'])); // original unchanged
    });
  });
}
