import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widget_examples_tester_providers.dart';

class ExamplesSelector extends ConsumerWidget {
  const ExamplesSelector({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedExamplesBuilderType = ref.watch(WidgetExamplesTesterProviders.selectedExamplesBuilderType.notifier);
    final examplesTypeList = ref.watch(WidgetExamplesTesterProviders.exampleSetNames);
    return Container(
      width: 400,
      padding: EdgeInsets.all(20),
      child: (examplesTypeList.isNotEmpty
          ? DropdownSearch<String>(
              popupProps: PopupProps.menu(
                showSelectedItems: true,
              ),
              items: examplesTypeList,
              onChanged: (selected) => selectedExamplesBuilderType.state = selected!,
              selectedItem: selectedExamplesBuilderType.state)
          : Text('No Examples')),
    );
  }
}
