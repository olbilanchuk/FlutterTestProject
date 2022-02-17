import 'dart:core';

abstract class FactorialCalculator {
  Future<int> calculate(final int number);
}

class FactorialCalculatorImpl implements FactorialCalculator {
  @override
  Future<int> calculate(final int number) async {
    if (number < 0) return Future.error("Can't calculate factorial for $number");
    return Future(() => _factorial(number));
  }

  int _factorial(final int number) {
    if (number == 0) return 1;
    return number * _factorial(number - 1);
  }

/*  int _factorial(final int number) {
    if (number == 0 || number == 1) return 1;

    int previousValue = number - 1;
    int result = number;

    do {
      result = result * previousValue;
      previousValue = previousValue - 1;
    } while (previousValue != 1);


    return result;
  }*/
}
