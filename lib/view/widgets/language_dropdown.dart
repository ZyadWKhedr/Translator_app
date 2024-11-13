import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translator_app/view_model/language_provider.dart';

class LanguageDropdown extends StatelessWidget {
  final bool isFromLanguage;

  const LanguageDropdown({Key? key, required this.isFromLanguage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LanguageProvider>(context);
    return DropdownButton<String>(
      value: isFromLanguage ? provider.fromLanguage : provider.toLanguage,
      items: provider.languages.map((lang) {
        return DropdownMenuItem(
          value: lang,
          child: Text(lang),
        );
      }).toList(),
      onChanged: (newValue) {
        if (newValue != null) {
          isFromLanguage
              ? provider.setFromLanguage(newValue)
              : provider.setToLanguage(newValue);
        }
      },
    );
  }
}
