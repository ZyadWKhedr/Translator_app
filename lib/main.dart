import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translator_app/view/home_page.dart/home_page.dart';
import 'package:translator_app/view_model/language_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark());
  }
}
