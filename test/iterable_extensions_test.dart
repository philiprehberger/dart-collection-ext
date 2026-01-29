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

  group('partition', () {
    test('splits by predicate', () {
      final (evens, odds) = [1, 2, 3, 4, 5].partition((n) => n.isEven);
      expect(evens, equals([2, 4]));
      expect(odds, equals([1, 3, 5]));
    });

    test('all match gives empty second list', () {
      final (matches, rest) = [2, 4, 6].partition((n) => n.isEven);
      expect(matches, equals([2, 4, 6]));
      expect(rest, isEmpty);
    });

    test('none match gives empty first list', () {
      final (matches, rest) = [1, 3, 5].partition((n) => n.isEven);
      expect(matches, isEmpty);
      expect(rest, equals([1, 3, 5]));
    });

    test('empty iterable gives both empty', () {
      final (matches, rest) = <int>[].partition((n) => n.isEven);
      expect(matches, isEmpty);
      expect(rest, isEmpty);
    });
  });

  group('intersperse', () {
    test('inserts separator between elements', () {
      expect([1, 2, 3].intersperse(0).toList(), equals([1, 0, 2, 0, 3]));
    });

    test('single element has no separator', () {
      expect([1].intersperse(0).toList(), equals([1]));
    });

    test('empty iterable stays empty', () {
      expect(<int>[].intersperse(0).toList(), isEmpty);
    });
  });

  group('sliding', () {
    test('creates overlapping windows', () {
      expect(
        [1, 2, 3, 4].sliding(2).toList(),
        equals([[1, 2], [2, 3], [3, 4]]),
      );
    });

    test('with step', () {
      expect(
        [1, 2, 3, 4].sliding(2, step: 2).toList(),
        equals([[1, 2], [3, 4]]),
      );
    });

    test('size larger than list returns empty', () {
      expect([1, 2].sliding(3).toList(), isEmpty);
    });

    test('throws on invalid size', () {
      expect(() => [1, 2].sliding(0), throwsArgumentError);
    });

    test('throws on invalid step', () {
      expect(() => [1, 2].sliding(1, step: 0), throwsArgumentError);
    });
  });

  group('sumBy', () {
    test('sums values by selector', () {
      final items = [{'n': 1}, {'n': 2}, {'n': 3}];
      expect(items.sumBy((e) => e['n'] as int), equals(6));
    });

    test('empty iterable returns 0', () {
      expect(<int>[].sumBy((e) => e), equals(0));
    });
  });

  group('averageBy', () {
    test('computes average by selector', () {
      expect([2, 4, 6].averageBy((e) => e), equals(4.0));
    });

    test('empty iterable throws StateError', () {
      expect(() => <int>[].averageBy((e) => e), throwsStateError);
    });
  });

  group('frequencies', () {
    test('counts occurrences', () {
      expect(
        ['a', 'b', 'a', 'c', 'a'].frequencies(),
        equals({'a': 3, 'b': 1, 'c': 1}),
      );
    });

    test('empty iterable returns empty map', () {
      expect(<String>[].frequencies(), isEmpty);
    });

    test('single element', () {
      expect([42].frequencies(), equals({42: 1}));
    });
  });

  group('associateBy', () {
    test('creates map from key selector', () {
      final result = ['apple', 'banana', 'cherry'].associateBy((s) => s[0]);
      expect(result, equals({'a': 'apple', 'b': 'banana', 'c': 'cherry'}));
    });

    test('last wins on duplicate keys', () {
      final result = ['ant', 'ape', 'bat'].associateBy((s) => s[0]);
      expect(result['a'], equals('ape'));
      expect(result.length, equals(2));
    });

    test('empty iterable returns empty map', () {
      expect(<String>[].associateBy((s) => s), isEmpty);
    });
  });

  group('mapIndexed', () {
    test('transforms with index', () {
      expect(
        ['a', 'b', 'c'].mapIndexed((i, e) => '$i:$e').toList(),
        equals(['0:a', '1:b', '2:c']),
      );
    });

    test('empty iterable yields nothing', () {
      expect(<int>[].mapIndexed((i, e) => e).toList(), isEmpty);
    });
  });

  group('whereIndexed', () {
    test('filters by index', () {
      expect(
        [10, 20, 30, 40].whereIndexed((i, e) => i.isEven).toList(),
        equals([10, 30]),
      );
    });

    test('filters by element and index', () {
      expect(
        [1, 2, 3, 4, 5].whereIndexed((i, e) => i > 0 && e.isOdd).toList(),
        equals([3, 5]),
      );
    });

    test('empty iterable yields nothing', () {
      expect(<int>[].whereIndexed((i, e) => true).toList(), isEmpty);
    });
  });

  group('flatMap', () {
    test('maps and flattens', () {
      expect(
        [[1, 2], [3, 4]].flatMap((e) => e).toList(),
        equals([1, 2, 3, 4]),
      );
    });

    test('works with transformation', () {
      expect(
        [1, 2, 3].flatMap((n) => [n, n * 10]).toList(),
        equals([1, 10, 2, 20, 3, 30]),
      );
    });

    test('empty inner iterables produce nothing', () {
      expect(
        [1, 2, 3].flatMap((n) => <int>[]).toList(),
        isEmpty,
      );
    });

    test('empty iterable yields nothing', () {
      expect(<List<int>>[].flatMap((e) => e).toList(), isEmpty);
    });
  });

  group('none', () {
    test('returns true when no element matches', () {
      expect([1, 3, 5].none((n) => n.isEven), isTrue);
    });

    test('returns false when any element matches', () {
      expect([1, 2, 3].none((n) => n.isEven), isFalse);
    });

    test('returns true for empty iterable', () {
      expect(<int>[].none((n) => true), isTrue);
    });
  });

  group('takeWhileInclusive', () {
    test('includes the first failing element', () {
      expect(
        [1, 2, 3, 4, 5].takeWhileInclusive((n) => n < 3).toList(),
        equals([1, 2, 3]),
      );
    });

    test('all pass returns all elements', () {
      expect(
        [1, 2, 3].takeWhileInclusive((n) => n < 10).toList(),
        equals([1, 2, 3]),
      );
    });

    test('first fails returns only first element', () {
      expect(
        [5, 1, 2].takeWhileInclusive((n) => n < 3).toList(),
        equals([5]),
      );
    });

    test('empty iterable yields nothing', () {
      expect(<int>[].takeWhileInclusive((n) => true).toList(), isEmpty);
    });
  });
}
