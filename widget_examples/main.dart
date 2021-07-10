import 'package:flutter/material.dart';
import 'package:widget_examples_tester/src/styled_riverpod_app.dart';
import 'package:widget_examples_tester/src/widget_examples_tester.dart';
import 'package:widget_examples_tester/src/widget_examples_tester_providers.dart';

import 'shared/app_style.dart';
import 'test/examples.dart';

void main() {
  final fullBuilderList = [
    TextExamplesBuilder(),
  ];

  final debugBuilderList = [
    TextExamplesBuilder(),
  ];

  runApp(
    StyledRiverpodApp(
      themes: AppStyle.themes,
      logging: false,
      overrides: [
        WidgetExamplesTesterProviders.exampleBuildersList.overrideWithValue(debugBuilderList),
      ],
      child: WidgetExamplesTester(),
    ),
  );
}
