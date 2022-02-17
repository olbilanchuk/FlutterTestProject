import 'dart:core';

abstract class FactorialCalculator {
  Future<BigInt> calculate(final int number);
}

class FactorialCalculatorImpl implements FactorialCalculator {
  @override
  Future<BigInt> calculate(final int number) async {
    if (number < 0) {
      return Future.error("Can't calculate factorial for $number");
    }
    return Future(() => _factorial(number));
  }

  BigInt _factorial(final int number) {
    if (number == 0) return BigInt.from(1);
    return BigInt.from(number) * _factorial(number - 1);
  }

}
