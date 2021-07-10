import 'package:flutter/cupertino.dart';

abstract class ExamplesBuilder {
  final String name;
  final double aspectRatio;
  final int columns;
  final ExampleBuildFunction build;

  ExamplesBuilder({
    required this.name,
    required this.build,
    this.aspectRatio = 1.0,
    this.columns = 1,
  });

  //List<Widget> build();
}

typedef ExampleBuildFunction = List<Widget> Function();

typedef ExamplesBuilderBuilder = ExamplesBuilder Function();
