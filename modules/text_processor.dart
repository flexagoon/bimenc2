String encode(String text) {
  final List<String> encoded = [];
  final letters = text.codeUnits;
  for (int letter in letters) {
    encoded.add(letter.toString().length.toString());
  }
  encoded.add('0');
  encoded.add(letters.join());
  return encoded.join();
}

String decode(String number) {
  final lengths = number.split('0')[0].split('');
  final text = number.split('0').sublist(1).join('0');
  final List<int> codepoints = [];
  var i = 0;
  for (String length in lengths) {
    final List<String> codepoint = [];
    for (int n = 0; n < int.parse(length); n++) {
      codepoint.add(text[i]);
      i += 1;
    }
    codepoints.add(int.parse(codepoint.join()));
  }
  final decoded = String.fromCharCodes(codepoints);
  return decoded;
}
