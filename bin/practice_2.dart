import 'dart:core';

abstract class FactorialCalculator {

  static const int minValue = 0;

  Future<BigInt> calculate(final int number);
}

class FactorialCalculatorImpl implements FactorialCalculator {
  @override
  Future<BigInt> calculate(final int number) async {
    if (number < FactorialCalculator.minValue) {
      return Future.error("Can't calculate factorial for $number");
    }
    return Future(() => _factorial(number));
  }

  BigInt _factorial(final int number) {
    if (number == FactorialCalculator.minValue) return BigInt.from(1);
    return BigInt.from(number) * _factorial(number - 1);
  }
}
