import 'package:flutter/material.dart';
import 'package:yesno_app_4sa/config/theme/app_theme.dart';
import 'package:yesno_app_4sa/presentation/chat/chat_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yes No App',
      debugShowCheckedModeBanner: false,
      // theme: cómo queremos que luzca la parte visual de la aplicación
      theme: AppTheme( selectedColor: 6 ).theme(),
      home: ChatScreen()
    );
  }
}