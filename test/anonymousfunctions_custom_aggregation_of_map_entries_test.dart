import 'package:anonymousfunctions_custom_aggregation_of_map_entries/anonymousfunctions_custom_aggregation_of_map_entries.dart';
import 'package:test/test.dart';

void main() {
  group('Aggregate Map Tests', () {

    final data = {
      'apple': 5,
      'orange': 10,
      'banana': 7,
      'grape': 3,
      'kiwi': 8,
      'avocado': 6
    };

    test('Aggregation excluding specific letter', () {
      expect(aggregateMap(data, excludeLetter: 'a'),
          equals(22)); // 10 (orange) + 8 (kiwi) + 7 (banana) - 3 (grape)
    });

    test('Aggregation with different exclude letter', () {
      expect(
          aggregateMap(data, excludeLetter: 'g'),
          equals(
              14)); //  10 (orange) + 7 (banana) + 8 (kiwi) - (6 (avocado) + 5 (apple))
    });

    test('Aggregation with no matching exclude letter', () {
      expect(
          aggregateMap(data, excludeLetter: 'z'),
          equals(
              11)); //  10 (orange) + 8 (kiwi) + 7 (banana) - 6 (avocado) - 5 (apple) - 3 (grape)
    });

    test('Handle empty map', () {
      expect(aggregateMap({}, excludeLetter: 'a'), equals(0));
    });

    test('Handle map with all excluded keys', () {
      expect(aggregateMap({'avocado': 6, 'apricot': 7}, excludeLetter: 'a'),
          equals(0));
    });
  });
}
