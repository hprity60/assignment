import 'package:assignment/transaction/transaction/transaction_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = true;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Efectivo App',
      theme: ThemeData(
        fontFamily: 'SF Pro Display',
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        scaffoldBackgroundColor:
            isDarkMode ? Colors.transparent : const Color(0xFFF5F7FA),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(
            color: isDarkMode ? Colors.white : Colors.black54,
          ),
        ),
        cardTheme: CardTheme(
          color: isDarkMode ? const Color(0xFF1E2229) : Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      home: TransactionScreen(isDarkMode: isDarkMode, toggleTheme: toggleTheme),
    );
  }
}
