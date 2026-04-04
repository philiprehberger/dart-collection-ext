# philiprehberger_collection_ext

[![Tests](https://github.com/philiprehberger/dart-collection-ext/actions/workflows/ci.yml/badge.svg)](https://github.com/philiprehberger/dart-collection-ext/actions/workflows/ci.yml)
[![pub package](https://img.shields.io/pub/v/philiprehberger_collection_ext.svg)](https://pub.dev/packages/philiprehberger_collection_ext)
[![Last updated](https://img.shields.io/github/last-commit/philiprehberger/dart-collection-ext)](https://github.com/philiprehberger/dart-collection-ext/commits/main)

Iterable and Map extensions for groupBy, chunk, zip, partition, sliding, and more

## Requirements

- Dart >= 3.6

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  philiprehberger_collection_ext: ^0.2.0
```

Then run:

```bash
dart pub get
```

## Usage

```dart
import 'package:philiprehberger_collection_ext/collection_ext.dart';
```

### groupBy

```dart
final grouped = [1, 2, 3, 4, 5, 6].groupBy((n) => n.isEven ? 'even' : 'odd');
// {odd: [1, 3, 5], even: [2, 4, 6]}
```

### chunk

```dart
final chunks = [1, 2, 3, 4, 5].chunk(2);
// [[1, 2], [3, 4], [5]]
```

### zip

```dart
final pairs = [1, 2, 3].zip(['a', 'b', 'c']).toList();
// [(1, 'a'), (2, 'b'), (3, 'c')]
```

### distinctBy

```dart
final unique = [1, 2, 3, 2, 1].distinctBy((n) => n).toList();
// [1, 2, 3]
```

### partition

```dart
final (evens, odds) = [1, 2, 3, 4, 5].partition((n) => n.isEven);
// evens: [2, 4], odds: [1, 3, 5]
```

### intersperse

```dart
final result = [1, 2, 3].intersperse(0).toList();
// [1, 0, 2, 0, 3]
```

### sliding

```dart
final windows = [1, 2, 3, 4].sliding(2).toList();
// [[1, 2], [2, 3], [3, 4]]

final stepped = [1, 2, 3, 4].sliding(2, step: 2).toList();
// [[1, 2], [3, 4]]
```

### sumBy / averageBy

```dart
final total = [1, 2, 3].sumBy((n) => n);     // 6
final avg = [2, 4, 6].averageBy((n) => n);    // 4.0
```

### Map Extensions

```dart
final filtered = {'a': 1, 'b': 2, 'c': 3}.filterValues((v) => v > 1);
// {b: 2, c: 3}

final uppered = {'a': 1, 'b': 2}.mapKeys((k) => k.toUpperCase());
// {A: 1, B: 2}

final doubled = {'a': 1, 'b': 2}.mapValues((v) => v * 10);
// {a: 10, b: 20}
```

## API

### Iterable Extensions

| Method | Description |
|--------|-------------|
| `groupBy(key)` | Group elements by a key function |
| `countBy(key)` | Count elements by a key function |
| `chunk(size)` | Split into chunks of the given size |
| `distinctBy(key)` | Remove duplicates by a key function |
| `minBy(key)` | Find element with minimum key value |
| `maxBy(key)` | Find element with maximum key value |
| `zip(other)` | Pair elements with another iterable |
| `firstWhereOrNull(test)` | Safe lookup returning null instead of throwing |
| `sortedBy(key)` | Return a sorted copy by a key function |
| `partition(predicate)` | Split elements into matching and non-matching lists |
| `intersperse(separator)` | Insert a separator between each pair of elements |
| `sliding(size, step)` | Overlapping windows of elements |
| `sumBy(selector)` | Sum of values by a selector function |
| `averageBy(selector)` | Average of values by a selector function |

### Map Extensions

| Method | Description |
|--------|-------------|
| `filterKeys(test)` | Filter entries by key predicate |
| `filterValues(test)` | Filter entries by value predicate |
| `mapKeys(transform)` | Transform keys while keeping values |
| `mapValues(transform)` | Transform values while keeping keys |

## Development

```bash
dart pub get
dart analyze --fatal-infos
dart test
```

## Support

If you find this project useful:

- [Star the repo](https://github.com/philiprehberger/dart-collection-ext)
- [Report issues](https://github.com/philiprehberger/dart-collection-ext/issues?q=is%3Aissue+is%3Aopen+label%3Abug)
- [Suggest features](https://github.com/philiprehberger/dart-collection-ext/issues?q=is%3Aissue+is%3Aopen+label%3Aenhancement)
- [Sponsor development](https://github.com/sponsors/philiprehberger)
- [All Open Source Projects](https://philiprehberger.com/open-source-packages)
- [GitHub Profile](https://github.com/philiprehberger)
- [LinkedIn Profile](https://www.linkedin.com/in/philiprehberger)

## License

[MIT](LICENSE)
