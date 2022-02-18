import 'dart:io';

import 'package:image/image.dart';

void encode(List<int> number, String filename, {bool invisible = false}) {
  final foreground = invisible
      ? int.parse('fffefefe', radix: 16)
      : int.parse('ff000000', radix: 16);
  final background = int.parse('ffffffff', radix: 16);
  final image = Image(number.length, 9);
  image.fill(background);
  number.asMap().forEach((column, amount) {
    for (int pixel = 0; pixel < amount; pixel++) {
      image.setPixel(column, 8 - pixel, foreground);
    }
  });
  File(filename).writeAsBytes(encodePng(image));
}

List<int> decode(String filename, {bool invisible = false}) {
  final foreground = invisible
      ? int.parse('fffefefe', radix: 16)
      : int.parse('ff000000', radix: 16);
  final file = File(filename);
  final image = decodePng(file.readAsBytesSync())!;
  final List<int> decoded = [];
  for (int column = 0; column < image.width; column++) {
    var counter = 0;
    for (int row = 0; row < 9; row++) {
      if (image.getPixelSafe(column, row) == foreground) {
        counter += 1;
      }
    }
    decoded.add(counter);
  }
  return decoded;
}
