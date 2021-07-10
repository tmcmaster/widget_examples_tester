import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_builder/theme_builder.dart';

class StyledRiverpodApp extends StatelessWidget {
  final ThemeBuilderThemes? themes;
  final bool logging;
  final Widget child;
  final List<Override> overrides;

  const StyledRiverpodApp({
    Key? key,
    this.themes,
    this.logging = false,
    required this.child,
    this.overrides = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        if (themes != null) ThemeBuilderProviders.themes.overrideWithProvider(Provider((_) => themes!)),
        ...overrides,
      ],
      observers: [
        if (logging) _Logger(),
      ],
      child: ThemeBuilder(
        builder: (BuildContext context, ThemeBuilderStyle style) {
          return MaterialApp(
            themeMode: ThemeMode.light,
            theme: style.theme,
            darkTheme: style.darkTheme,
            home: SafeArea(
              child: Scaffold(
                body: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: child,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Logger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase provider, Object? newValue) {
    print('{"provider": "${provider.name ?? provider.runtimeType}","newValue": "$newValue"}');
  }
}
