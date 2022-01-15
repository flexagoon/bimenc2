import 'package:args/args.dart';

import '../modules/image_processor.dart' as ip;
import '../modules/number_processor.dart' as np;
import '../modules/text_processor.dart' as tp;

void main(List<String> args) {
  final parser = ArgParser();
  parser
    ..addOption(
      'text',
      abbr: 't',
    )
    ..addOption(
      'file',
      abbr: 'f',
    )
    ..addFlag(
      'invisible',
      abbr: 'i',
      negatable: false,
    );

  try {
    final options = parser.parse(args);
    if (options['text'] != null && options['file'] != null) {
      final number = tp.encode(options['text']);
      final enc = np.encode(number);
      ip.encode(
        enc,
        options['file'],
        invisible: options['invisible'],
      );
    } else if (options['file'] != null) {
      try {
        final decImg = ip.decode(
          options['file'],
          invisible: options['invisible'],
        );
        final decNum = np.decode(decImg);
        final decText = tp.decode(decNum);
        print(decText);
      } catch (e) {
        print('Invalid image!');
      }
    } else {
      print('Invalid arguments!');
    }
  } on FormatException {
    print('Invalid arguments!');
  }
}
