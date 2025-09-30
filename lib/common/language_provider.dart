import 'package:flutter/material.dart';
import 'package:sandbox/common/helper.dart';
import 'package:sandbox/common/local_storages.dart';

const String _LANGUAGE_KEY = "language";

final class LanguageProvider extends ChangeNotifier {
  bool _isInit = false;

  late String? _language;

  late Locale? _locale;

  String? get language => _language;
  Locale? get locale => _locale;

  LanguageProvider init() {
    if (!_isInit) {
      _language = LocalStorages.getString(_LANGUAGE_KEY);
      _locale = Helper.parseLocale(_language);
      _isInit = true;
    }
    return this;
  }

  void saveLanguage(String? language) {
    _language = language;
    if (Helper.isEmpty(language)) {
      LocalStorages.remove(_LANGUAGE_KEY);
    } else {
      _locale = Helper.parseLocale(language);
      LocalStorages.put(_LANGUAGE_KEY, language);
    }
  }

  void refresh() => notifyListeners();
}
