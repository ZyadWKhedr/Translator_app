import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LanguageProvider with ChangeNotifier {
  final translator = GoogleTranslator();

  List<String> languages = [
    'English',
    'Arabic',
    'Japanese',
    'German',
    'French',
    'Italian',
    'Spanish',
    'Russian',
    'Greek',
    'Hebrew',
    'Turkish',
    'Ukrainian',
    'Chinese'
  ];

  String fromLanguage = 'English';
  String toLanguage = 'Arabic';
  String translatedText = '';
  TextEditingController inputController = TextEditingController();

  void setFromLanguage(String language) {
    fromLanguage = language;
    notifyListeners();
  }

  void setToLanguage(String language) {
    toLanguage = language;
    notifyListeners();
  }

  Future<void> translateText() async {
    try {
      final translation = await translator.translate(
        inputController.text,
        from: getLanguageCode(fromLanguage),
        to: getLanguageCode(toLanguage),
      );
      translatedText = translation.text;
      notifyListeners();
    } catch (e) {
      translatedText = 'Translation failed';
      notifyListeners();
    }
  }

  String getLanguageCode(String language) {
    Map<String, String> languageCodes = {
      'English': 'en',
      'Arabic': 'ar',
      'Japanese': 'ja',
      'German': 'de',
      'French': 'fr',
      'Italian': 'it',
      'Spanish': 'es',
      'Russian': 'ru',
      'Greek': 'el',
      'Hebrew': 'he',
      'Turkish': 'tr',
      'Ukrainian': 'uk',
      'Chinese': 'zh',
    };
    return languageCodes[language] ?? 'en';
  }
}
