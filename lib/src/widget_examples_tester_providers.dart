import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'examples_builder.dart';

class WidgetExamplesTesterProviders {
  static final exampleBuildersList = Provider<List<ExamplesBuilder>>(
    (_) => [],
    name: 'examples-builder-list',
  );

  static final exampleBuildersMap = Provider<Map<String, ExamplesBuilder>>(
    (ref) => {for (var item in ref.watch(exampleBuildersList)) item.name: item},
    name: 'examples-builder-map',
  );

  static final exampleSetNames = Provider<List<String>>((ref) {
    final map = ref.watch(exampleBuildersMap);
    return map.keys.toList()..sort();
  });

  static final selectedExamplesBuilderType = StateProvider<String>(
    (ref) => ref.watch(exampleBuildersList)[0].name,
    name: 'selected-examples-type',
  );

  static final selectedExamplesBuilder = Provider<ExamplesBuilder>(
    (ref) {
      final map = ref.watch(exampleBuildersMap);
      final type = ref.watch(selectedExamplesBuilderType).state;
      return map[type]!;
    },
    name: 'selected-examples-builder',
  );
}
