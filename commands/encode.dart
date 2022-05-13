import 'package:args/command_runner.dart';

import '../modules/image_processor.dart' as ip;
import '../modules/mask_processor.dart' as mp;
import '../modules/number_processor.dart' as np;
import '../modules/text_processor.dart' as tp;

class EncodeCommand extends Command {
  @override
  final name = 'encode';

  @override
  final description = 'Convert text to an image';

  EncodeCommand() {
    argParser
      ..addOption(
        'text',
        abbr: 't',
        mandatory: true,
      )
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
    final number = tp.encode(argResults!['text']);
    final enc = np.encode(number);
    final masked = mp.mask(enc);
    ip.encode(
      masked,
      argResults!['file'],
      invisible: argResults!['invisible'],
    );
  }
}
