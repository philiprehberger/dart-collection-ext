# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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
