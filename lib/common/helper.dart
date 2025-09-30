import 'package:flutter/material.dart';

class Helper {
  Helper._();

  static bool isEmpty(dynamic str) {
    return str == null || str.isEmpty;
  }

  static bool isNotEmpty(dynamic str) {
    return !isEmpty(str);
  }

  static Locale? parseLocale(String? language) {
    if (isEmpty(language)) {
      return null;
    }
    final codes = language!.split('_');
    final size = codes.length;
    return Locale.fromSubtags(
      languageCode: codes[0],
      scriptCode: size == 3 ? codes[1] : null,
      countryCode: size == 1 ? null : codes[size == 3 ? 2 : 1],
    );
  }

  static String typeName(Type type) => type.toString();

  static Map<String, T> typeNameMap<T>(Map<Type, T> map) {
    final Map<String, T> target = {};
    target.addAll(map.map((key, value) => MapEntry(typeName(key), value)));
    return target;
  }
}
