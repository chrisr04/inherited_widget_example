import 'package:flutter/material.dart';

class ThemeToggle extends InheritedWidget {
  const ThemeToggle({
    super.key,
    required this.isDark,
    required this.changeTheme,
    required super.child,
  });

  final bool isDark;
  final VoidCallback changeTheme;

  static ThemeToggle? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeToggle>();
  }

  static ThemeToggle of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<ThemeToggle>();
    assert(result != null, 'No ThemeToggle found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ThemeToggle oldWidget) => isDark != oldWidget.isDark;
}
