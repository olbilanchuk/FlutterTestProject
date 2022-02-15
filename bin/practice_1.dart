import 'dart:core';

abstract class PasswordChecker {
  static const int passwordStrong = 0;

  int check(String password);
}

class PasswordCheckerImpl implements PasswordChecker {
  static const int _minPasswordLength = 6;
  static const int _maxPasswordLength = 20;

  static const String _regExpRequiredSymbols =
      r"(?=.*[a-z])(?=.*[A-Z])(?=.*?[0-9])";
  static const String _regExpMinSymbolsRepeating = r"(.)\1{2,}";
  static const String _regExpSpaces = r"\s+";

  @override
  int check(String password) {
    int stepsRequired = PasswordChecker.passwordStrong;
    final String passwordWithoutSpace =
    password.replaceAll(RegExp(_regExpSpaces), '');

    void onRequiredStep() => stepsRequired++;
    _checkPasswordLength(passwordWithoutSpace.length, onRequiredStep);
    _checkPasswordRequiredSymbols(passwordWithoutSpace, onRequiredStep);
    _checkPasswordSymbolsRepeating(passwordWithoutSpace, onRequiredStep);

    return stepsRequired;
  }

  void _checkPasswordLength(final int length, void Function() onRequiredStep) {
    _notifyIfRequired(length < _minPasswordLength || length > _maxPasswordLength, onRequiredStep);
  }

  void _checkPasswordRequiredSymbols(final String password,
      void Function() onRequiredStep) {
    _notifyIfRequired(!RegExp(_regExpRequiredSymbols).hasMatch(password), onRequiredStep);
  }

  void _checkPasswordSymbolsRepeating(final String password,
      void Function() onRequiredStep) {
    _notifyIfRequired(
        RegExp(_regExpMinSymbolsRepeating).hasMatch(password), onRequiredStep);
  }

  void _notifyIfRequired(final bool required, void Function() onRequiredStep) {
    if (required) {
      onRequiredStep();
    }
  }

}
