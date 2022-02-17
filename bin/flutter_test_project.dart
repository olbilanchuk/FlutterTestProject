import 'dart:io';

import 'practice_1.dart';
import 'practice_2.dart';

const int practice1 = 1;
const int practice2 = 2;

void main(List<String> arguments) {
  _runPractices();
}

void _runPractices() {
  print('Enter practice number:');

  int? practiceNumber = int.tryParse(stdin.readLineSync() ?? "");
  if (practiceNumber == null) {
    return _runPractices();
  }

  switch (practiceNumber) {
    case practice1:
      return _readConsolePassword(PasswordCheckerImpl());
    case practice2:
      return _runPractice2(FactorialCalculatorImpl());
  }

  return _runPractices();
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

void _runPractice2(FactorialCalculator factorialCalculator) {
  print('Enter number to calculate factorial:');
  int? number = int.tryParse(stdin.readLineSync() ?? "");

  if (number == null) {
    return _runPractice2(factorialCalculator);
  }

  factorialCalculator
      .calculate(number)
      .then((value) => print('$number factorial = $value'));
}
