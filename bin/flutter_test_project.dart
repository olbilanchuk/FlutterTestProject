import 'dart:io';

import 'practice_1.dart';

void main(List<String> arguments) {
  _readConsolePassword(PasswordCheckerImpl());
}

void _readConsolePassword(PasswordChecker passwordChecker) {
  print('Enter password:');

  String password = stdin.readLineSync() ?? "";
  int steps = passwordChecker.check(password);

  if (steps != PasswordChecker.passwordStrong) {
    print(
        '$password is not strong password. Steps to make password strong = $steps');
    _readConsolePassword(passwordChecker);
  } else {
    print('$password is strong');
  }
}
