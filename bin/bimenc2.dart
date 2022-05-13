import 'package:args/command_runner.dart';

import '../commands/decode.dart';
import '../commands/encode.dart';

void main(List<String> args) {
  final runner = CommandRunner(
    'bimenc2',
    'A demonstration of basic text to image encryption',
  );
  runner.addCommand(EncodeCommand());
  runner.addCommand(DecodeCommand());
  runner.run(args);
}
