import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translator_app/view/widgets/custom_button.dart';
import 'package:translator_app/view/widgets/custom_text_field.dart';
import 'package:translator_app/view_model/language_provider.dart';
import '../widgets/gradient_container.dart';
import '../widgets/language_dropdown.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Translator App',
          style: TextStyle(
            color: Color(0xffE739FA),
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 26, 29, 46),
      ),
      body: GradientContainer(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Language Selection Row
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'From:',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10),
                          LanguageDropdown(isFromLanguage: true),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'To:',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10),
                          LanguageDropdown(isFromLanguage: false),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Input and Output Text Fields in a Row
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Enter text:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffE739FA),
                            ),
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: languageProvider.inputController,
                            hintText: 'Type here...',
                            maxLines: 5,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Translation:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffE739FA),
                            ),
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: TextEditingController(
                              text: languageProvider.translatedText,
                            ),
                            hintText: 'Translation will appear here...',
                            maxLines: 5,
                            readOnly: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                CustomButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
