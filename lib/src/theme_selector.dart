import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_builder/theme_builder.dart';

class ThemeSelector extends ConsumerWidget {
  const ThemeSelector({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styleNames = ref.watch(ThemeBuilderProviders.styleNames);
    final selectedStyleName = ref.watch(ThemeBuilderProviders.selectedStyleName.notifier);

    return Container(
      width: 200,
      padding: EdgeInsets.all(20),
      child: (styleNames.isNotEmpty
          ? DropdownSearch<StyleName>(
              popupProps: PopupProps.menu(
                showSelectedItems: false,
              ),
              items: styleNames,
              itemAsString: (item) => item.text,
              onChanged: (selected) => selectedStyleName.state = selected!,
              selectedItem: selectedStyleName.state,
            )
          : Text('No Examples')),
    );
  }
}
