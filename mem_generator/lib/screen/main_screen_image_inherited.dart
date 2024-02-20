import 'package:flutter/material.dart';

class MainScreenImageUrl extends InheritedWidget {
  const MainScreenImageUrl({required this.url, super.key, required super.child});

  final String url;

  static MainScreenImageUrl? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MainScreenImageUrl>();
  }

  static MainScreenImageUrl of(BuildContext context) {
    final MainScreenImageUrl? result = maybeOf(context);
    assert(result != null, 'No MainScreenImageUrl found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant MainScreenImageUrl oldWidget) {
    return url != oldWidget.url;
  }
  
}
