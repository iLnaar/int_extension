import 'dart:typed_data';

import 'package:decimal/decimal.dart';

/// The largest signed 64-bit integer value.
const int intMax = 9223372036854775807;

/// The smallest signed 64-bit integer value.
const int intMin = -9223372036854775808;

/// The number of decimal digits in the largest signed 64-bit integer value.
const int intMaxDigits = 19;

/// Converts [dynamicValue] to an integer.
///
/// [dynamicValue] is returned unchanged when it is an integer. Doubles and
/// [Decimal] values are truncated to an integer. Strings are parsed as
/// integers; if parsing fails, [defaultValue] is returned. Returns `null` for
/// `null` and unsupported value types.
///
/// [defaultValue] is the value returned when [dynamicValue] is a string that
/// cannot be parsed as an integer.
int? intFromDynamic(dynamic dynamicValue, [int? defaultValue]) {
  if (dynamicValue is int) return dynamicValue;
  if (dynamicValue is double) return dynamicValue.toInt();
  if (dynamicValue is String) return int.tryParse(dynamicValue) ?? defaultValue;
  if (dynamicValue is Decimal) return dynamicValue.toBigInt().toInt();
  return null;
}

/// Convenience operations for integer values.
extension IntExtn on int {
  /// Returns the greater of this integer and [value2].
  int max(int value2) => this >= value2 ? this : value2;

  /// Returns the lesser of this integer and [value2].
  int min(int value2) => this <= value2 ? this : value2;

  /// Encodes this integer as four bytes in the platform's native byte order.
  ///
  /// The value is written through a signed 32-bit view, so the resulting bytes
  /// contain its 32-bit representation.
  Uint8List toBytes() => Uint8List(4)..buffer.asInt32List()[0] = this;
}
