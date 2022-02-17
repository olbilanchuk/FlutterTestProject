import 'dart:io';

const int parseErrorCode = -1;

int tryParseString(final String? value) {
  return int.tryParse(value ?? "") ?? parseErrorCode;
}