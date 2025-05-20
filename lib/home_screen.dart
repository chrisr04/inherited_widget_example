import 'package:flutter/material.dart';
import 'package:inherited_widgets_example/theme_toggle.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Theme Toggle Demo')),
      body: Center(child: const ThemeMessage()),
      floatingActionButton: const ThemeButton(),
    );
  }
}

class ThemeMessage extends StatelessWidget {
  const ThemeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeToggle = ThemeToggle.of(context);
    return Text(
      'El tema es: ${themeToggle.isDark ? 'Oscuro' : 'Claro'}',
      style: const TextStyle(fontSize: 24),
    );
  }
}

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeToggle = ThemeToggle.of(context);
    return FloatingActionButton(
      onPressed: themeToggle.changeTheme,
      child: Icon(themeToggle.isDark ? Icons.dark_mode : Icons.light_mode),
    );
  }
}
