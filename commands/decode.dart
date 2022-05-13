import 'package:args/command_runner.dart';

import '../modules/image_processor.dart' as ip;
import '../modules/mask_processor.dart' as mp;
import '../modules/number_processor.dart' as np;
import '../modules/text_processor.dart' as tp;

class DecodeCommand extends Command {
  @override
  final name = 'decode';

  @override
  final description = 'Decode an image';

  DecodeCommand() {
    argParser
      ..addOption(
        'file',
        abbr: 'f',
        mandatory: true,
      )
      ..addFlag(
        'invisible',
        abbr: 'i',
        negatable: false,
      );
  }

  @override
  void run() {
    try {
      final decImg = ip.decode(
        argResults!['file'],
        invisible: argResults!['invisible'],
      );
      final decMask = mp.unmask(decImg);
      final decNum = np.decode(decMask);
      final decText = tp.decode(decNum);
      print(decText);
    } catch (e) {
      print('Invalid image!');
    }
  }
}
