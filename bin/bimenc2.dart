import 'package:args/args.dart';

import '../modules/image_processor.dart' as ip;
import '../modules/mask_processor.dart' as mp;
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
      final masked = mp.mask(enc);
      ip.encode(
        masked,
        options['file'],
        invisible: options['invisible'],
      );
    } else if (options['file'] != null) {
      try {
        final decImg = ip.decode(
          options['file'],
          invisible: options['invisible'],
        );
        final decMask = mp.unmask(decImg);
        final decNum = np.decode(decMask);
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
