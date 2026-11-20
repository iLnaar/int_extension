import 'dart:typed_data';

import 'package:decimal/decimal.dart';
import 'package:int_extension/int_extension.dart';
import 'package:test/test.dart';

void main() {
  group('integer constants', () {
    test('contains signed 64-bit bounds and digit count', () {
      expect(intMin, -9223372036854775808);
      expect(intMax, 9223372036854775807);
      expect(intMaxDigits, 19);
    });
  });

  group('intFromDynamic', () {
    test('returns integers unchanged', () {
      expect(intFromDynamic(42), 42);
      expect(intFromDynamic(-42), -42);
    });

    test('truncates doubles toward zero', () {
      expect(intFromDynamic(12.9), 12);
      expect(intFromDynamic(-12.9), -12);
    });

    test('truncates Decimal values toward zero', () {
      expect(intFromDynamic(Decimal.parse('12.9')), 12);
      expect(intFromDynamic(Decimal.parse('-12.9')), -12);
    });

    test('parses integer strings', () {
      expect(intFromDynamic('42'), 42);
      expect(intFromDynamic('-42'), -42);
    });

    test('returns the default for an invalid string', () {
      expect(intFromDynamic('not an integer'), isNull);
      expect(intFromDynamic('not an integer', 7), 7);
    });

    test('ignores the default when a string parses successfully', () {
      expect(intFromDynamic('42', 7), 42);
    });

    test('returns null for null and unsupported values', () {
      expect(intFromDynamic(null), isNull);
      expect(intFromDynamic(true), isNull);
      expect(intFromDynamic(<int>[1]), isNull);
    });
  });

  group('IntExtn', () {
    test('max returns the greater value, including ties', () {
      expect(7.max(10), 10);
      expect(10.max(7), 10);
      expect(7.max(7), 7);
    });

    test('min returns the lesser value, including ties', () {
      expect(7.min(10), 7);
      expect(10.min(7), 7);
      expect(7.min(7), 7);
    });

    test('toBytes returns four native-endian bytes for the 32-bit value', () {
      const value = 0x01020304;
      final bytes = value.toBytes();

      expect(bytes, isA<Uint8List>());
      expect(bytes, hasLength(4));
      expect(ByteData.sublistView(bytes).getInt32(0, Endian.host), value);
    });

    test('toBytes preserves negative values in signed 32-bit form', () {
      final bytes = (-42).toBytes();

      expect(bytes, hasLength(4));
      expect(ByteData.sublistView(bytes).getInt32(0, Endian.host), -42);
    });
  });
}
