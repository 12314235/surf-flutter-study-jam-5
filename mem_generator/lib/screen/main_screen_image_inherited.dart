import 'package:flutter/material.dart';

import '../services/image_source.dart';

class MainScreenMemeProperties extends InheritedWidget {
  const MainScreenMemeProperties({required this.imageSource, required this.text, super.key, required super.child});

  final MemeSource imageSource;
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
    return imageSource != oldWidget.imageSource || text != oldWidget.text;
  }
}
