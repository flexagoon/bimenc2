# BImEnc
A demonstration of basic text → image encryption.

## Installation
1. Clone the repository
2. Run `dart pub get` to install the dependencies (or use your IDE if it provides such functionality)

## Usage
``` bash
# Encrypting text
dart run bin/bimenc2.dart -t <text> -f <filename>

# Decrypting an image
dart run bin/bimenc2.dart -f <filename>

# You can also use the -i flag to enable invisible mode.
# Invisible mode images look completely white to human eye,
# But they can become undecryptable if compressed in size.
dart run bin/bimenc2.dart -t <text> -f <filename> -i
dart run bin/bimenc2.dart -f <filename> -i
```
