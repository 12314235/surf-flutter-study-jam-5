import 'package:flutter/material.dart';

class MainScreenMemeProperties extends InheritedWidget {
  const MainScreenMemeProperties({required this.url, required this.text, super.key, required super.child});

  final String url;
  final String text;

  static MainScreenMemeProperties? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MainScreenMemeProperties>();
  }

  static MainScreenMemeProperties of(BuildContext context) {
    final MainScreenMemeProperties? result = maybeOf(context);
    assert(result != null, 'No MainScreenImageUrl found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant MainScreenMemeProperties oldWidget) {
    return url != oldWidget.url || text != oldWidget.text;
  }
  
}
