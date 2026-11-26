# int_extension

A Dart package that expands the functionality of the built-in `int` type with
useful extensions and utilities.

## Installation

Add the package to your project:

```sh
dart pub add int_extension
```

Then import it:

```dart
import 'package:int_extension/int_extension.dart';
```

## Usage

### Convert a value to `int`

`intFromDynamic` returns integers unchanged, converts `double` and `Decimal`
values by truncating their fractional part, and parses strings as integers. If
a string cannot be parsed, the optional default value is returned. For `null`
and unsupported value types, it returns `null`.

```dart
import 'package:decimal/decimal.dart';
import 'package:int_extension/int_extension.dart';

void main() {
  print(intFromDynamic(12)); // 12
  print(intFromDynamic(12.8)); // 12
  print(intFromDynamic(Decimal.parse('12.8'))); // 12
  print(intFromDynamic('42')); // 42
  print(intFromDynamic('not a number', 0)); // 0
  print(intFromDynamic(null)); // null
}
```

### `IntExtn` extension

The `int` extension provides `max`, `min`, and `toBytes`:

```dart
void main() {
  print(7.max(10)); // 10
  print(7.min(10)); // 7

  final bytes = 42.toBytes();
  print(bytes); // 4 bytes in the platform's native byte order
}
```

`toBytes()` writes the value through a signed 32-bit representation and
returns four bytes in the platform's native byte order.

### Constants

The package provides constants for the signed 64-bit integer bounds and the
number of decimal digits in the maximum value:

```dart
print(intMin); // -9223372036854775808
print(intMax); // 9223372036854775807
print(intMaxDigits); // 19
```
