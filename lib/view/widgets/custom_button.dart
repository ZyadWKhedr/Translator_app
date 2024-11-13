import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translator_app/view_model/language_provider.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider =
        Provider.of<LanguageProvider>(context, listen: false);

    double screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: () {
        languageProvider.translateText();
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.1,
          vertical: 16,
        ),
        backgroundColor: const Color(0xffE739FA),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        'Translate',
        style: TextStyle(
          fontSize: screenWidth > 600 ? 20 : 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
