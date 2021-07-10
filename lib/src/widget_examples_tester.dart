import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'examples_selector.dart';
import 'theme_selector.dart';
import 'widget_tester_container.dart';

class WidgetExamplesTester extends ConsumerWidget {
  const WidgetExamplesTester({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Wrap(
            children: [
              ThemeSelector(),
              ExamplesSelector(),
            ],
          ),
          Expanded(
            child: WidgetTesterContainer(),
          ),
        ],
      ),
    );
  }
}
