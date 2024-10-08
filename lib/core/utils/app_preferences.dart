import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tech_tide/core/utils/local_manager.dart';

const String _prefsKeyLanguage = "PREFS_KEY_LANG";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Locale getAppLocal() {
    String? language = _sharedPreferences.getString(_prefsKeyLanguage);
    if (language != null && language.isNotEmpty) {
      return LocaleManager.localeFromString(language);
    } else {
      return LocaleManager.defaultLocale;
    }
  }

  Future<void> setAppLanguage(LanguageType language) async {
    await _sharedPreferences.setString(_prefsKeyLanguage, language.value);
  }
}
