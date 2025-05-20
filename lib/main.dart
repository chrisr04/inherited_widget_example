import 'package:flutter/material.dart';
import 'package:inherited_widgets_example/home_screen.dart';
import 'package:inherited_widgets_example/theme_toggle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDark = false;

  void _changeTheme() {
    setState(() {
      _isDark = !_isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ThemeToggle(
      isDark: _isDark,
      changeTheme: _changeTheme,
      child: MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
        home: HomeScreen(),
      ),
    );
  }
}
