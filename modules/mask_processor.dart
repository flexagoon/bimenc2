List<int> mask(List<int> number) {
  final masked = <int>[];
  for (var i = 0; i < number.length; i++) {
    final digit = number[i];
    if (i % 2 == 0) {
      final newDigit = digit == 0 ? 9 : digit - 1;
      masked.add(newDigit);
    } else {
      masked.add(digit);
    }
  }
  return masked;
}

List<int> unmask(List<int> number) {
  final unmasked = <int>[];
  for (var i = 0; i < number.length; i++) {
    final digit = number[i];
    if (i % 2 == 0) {
      final newDigit = digit == 9 ? 0 : digit + 1;
      unmasked.add(newDigit);
    } else {
      unmasked.add(digit);
    }
  }
  return unmasked;
}
