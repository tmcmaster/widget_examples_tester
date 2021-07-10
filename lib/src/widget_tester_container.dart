import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_tester/widget_tester.dart';

import 'widget_examples_tester_providers.dart';

class WidgetTesterContainer extends ConsumerWidget {
  const WidgetTesterContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final examplesBuilder = watch(WidgetExamplesTesterProviders.selectedExamplesBuilder);
    final exampleWidgets = examplesBuilder.build();
    final aspectRatio = examplesBuilder.aspectRatio;
    final columns = examplesBuilder.columns;
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: (exampleWidgets.isNotEmpty
          ? WidgetTester(
              options: WidgetTesterOptions(
                columns: columns,
                aspectRatio: aspectRatio,
              ),
              children: exampleWidgets,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('No Examples Selected.', style: theme.textTheme.headline2),
              ],
            )),
    );
  }
}
