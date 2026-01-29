# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.5.0] - 2026-04-12

### Added
- `mapIndexed()` to transform elements with access to their index
- `whereIndexed()` to filter elements with access to their index
- `flatMap()` to map each element to an iterable and flatten the results
- `none()` to check if no elements satisfy a predicate
- `takeWhileInclusive()` like takeWhile but includes the first failing element

### Changed
- Reverted minimum Dart SDK from 3.8 back to 3.6 (no 3.8-specific APIs used)

## [0.4.0] - 2026-04-06

### Changed
- Bump minimum Dart SDK from 3.6 to 3.8
- Widen `lints` dependency to `>=5.0.0 <7.0.0`

## [0.3.0] - 2026-04-05

### Added
- `frequencies()` to count occurrences of each element in an iterable
- `associateBy()` to create a map from elements using a key selector function

## [0.2.0] - 2026-04-04

### Added
- `partition()` to split iterables into two lists based on a predicate
- `intersperse()` to insert a separator between elements
- `sliding()` for overlapping window iteration with configurable step
- `sumBy()` for numeric summation by selector
- `averageBy()` for numeric averaging by selector
- `mapValues()` map extension to transform values while keeping keys

## [0.1.1] - 2026-04-03

### Fixed
- Primary barrel file now matches package name for pub.dev validation

## [0.1.0] - 2026-04-03

### Added
- `groupBy` — group elements by a key function
- `countBy` — count elements by a key function
- `chunk` — split iterables into fixed-size chunks
- `distinctBy` — remove duplicates by a key function
- `minBy` — find the element with the minimum value by a key function
- `maxBy` — find the element with the maximum value by a key function
- `zip` — pair elements from two iterables using records
- `firstWhereOrNull` — safe lookup returning null instead of throwing
- `sortedBy` — return a sorted copy by a key function
- `filterKeys` — filter map entries by key
- `filterValues` — filter map entries by value
- `mapKeys` — transform map keys while keeping values
