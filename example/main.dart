import 'package:decimal/decimal.dart';
import 'package:int_extension/int_extension.dart';

void main() {
  // Convert supported values to int.
  print(intFromDynamic(42)); // 42
  print(intFromDynamic(12.8)); // 12
  print(intFromDynamic(Decimal.parse('12.8'))); // 12
  print(intFromDynamic('123')); // 123
  print(intFromDynamic('invalid', 0)); // 0
  print(intFromDynamic(null)); // null

  // Use the int extension methods.
  print(7.max(10)); // 10
  print(7.min(10)); // 7
  print(42.toBytes()); // Four bytes in the platform's native byte order

  // Read the signed 64-bit integer limits.
  print(intMin); // -9223372036854775808
  print(intMax); // 9223372036854775807
  print(intMaxDigits); // 19
}
