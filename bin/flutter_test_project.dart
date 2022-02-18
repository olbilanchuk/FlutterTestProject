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

  final int? practiceNumber = int.tryParse(stdin.readLineSync() ?? "");

  switch (practiceNumber) {
    case practice1:
      return _runPractice1(PasswordCheckerImpl());
    case practice2:
      return _runPractice2(FactorialCalculatorImpl());
    default:
      return _runPractices();
  }

}

void _runPractice1(PasswordChecker passwordChecker) {
  print('Enter password:');

  final String password = stdin.readLineSync() ?? "";
  final int steps = passwordChecker.check(password);

  if (steps != PasswordChecker.passwordStrong) {
    print(
        '$password is not strong password. Steps to make password strong = $steps');
    _runPractice1(passwordChecker);
  } else {
    print('$password is strong');
  }
}

void _runPractice2(FactorialCalculator factorialCalculator) async {
  print('Enter number to calculate factorial:');
  final int? number = int.tryParse(stdin.readLineSync() ?? "");

  if (number == null) {
    return _runPractice2(factorialCalculator);
  }

  final BigInt result = await factorialCalculator.calculate(number);

  print('$number factorial = $result');
}
