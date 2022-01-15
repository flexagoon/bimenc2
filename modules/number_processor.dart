List<int> encode(String number) {
  final encoded = [int.parse(number[0])];
  for (int i = 1; i < number.length; i++) {
    final currentDigit = int.parse(number[i]);
    final previousDigit = int.parse(number[i - 1]);
    if (currentDigit >= previousDigit) {
      encoded.add(currentDigit - previousDigit);
    } else {
      encoded.add(currentDigit - previousDigit + 10);
    }
  }
  return encoded;
}

String decode(List<int> number) {
  final decoded = [number[0].toString()];
  for (int i = 1; i < number.length; i++) {
    final currentDigit = number[i];
    final previousDigit = int.parse(decoded[i - 1]);
    if (currentDigit + previousDigit < 10) {
      decoded.add((currentDigit + previousDigit).toString());
    } else {
      decoded.add((currentDigit + previousDigit - 10).toString());
    }
  }
  return decoded.join();
}
