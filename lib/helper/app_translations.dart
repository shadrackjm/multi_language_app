import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class AppTranslations {
  static Map<String, dynamic>? _localizedValues;

  static Future<AppTranslations> load(Locale locale) async {
    String jsonString = await rootBundle
        .loadString('assets/translations/${locale.languageCode}.json');
    _localizedValues = json.decode(jsonString);
    return AppTranslations();
  }

  dynamic translate(String key) {
    return _localizedValues![key];
  }
}
