import 'package:philiprehberger_collection_ext/collection_ext.dart';

void main() {
  // groupBy
  final grouped = [1, 2, 3, 4, 5, 6].groupBy((n) => n.isEven ? 'even' : 'odd');
  print(grouped); // {odd: [1, 3, 5], even: [2, 4, 6]}

  // chunk
  print([1, 2, 3, 4, 5].chunk(2)); // [[1, 2], [3, 4], [5]]

  // zip
  print([1, 2, 3].zip(['a', 'b', 'c']).toList()); // [(1, a), (2, b), (3, c)]

  // firstWhereOrNull
  print([1, 2, 3].firstWhereOrNull((n) => n > 5)); // null

  // sortedBy
  print(['banana', 'apple', 'cherry'].sortedBy((s) => s.length)); // [apple, banana, cherry]

  // Map extensions
  print({'a': 1, 'b': 2, 'c': 3}.filterValues((v) => v > 1)); // {b: 2, c: 3}
}
