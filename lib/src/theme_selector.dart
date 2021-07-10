import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_builder/theme_builder.dart';

class ThemeSelector extends ConsumerWidget {
  const ThemeSelector({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final styleNames = watch(ThemeBuilderProviders.styleNames);
    final selectedStyleName = watch(ThemeBuilderProviders.selectedStyleName);

    return Container(
      width: 200,
      padding: EdgeInsets.all(20),
      child: (styleNames.isNotEmpty
          ? DropdownSearch<StyleName>(
              itemAsString: (item) => item.text,
              mode: Mode.MENU,
              compareFn: (a, b) => a == b,
              showSelectedItem: true,
              items: styleNames,
              label: 'Themes',
              hint: 'country in menu mode',
              onChanged: (selected) => selectedStyleName.state = selected!,
              selectedItem: selectedStyleName.state)
          : Text('No Examples')),
    );
  }
}
