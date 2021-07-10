part of 'examples.dart';

class TextExamplesBuilder extends ExamplesBuilder {
  TextExamplesBuilder()
      : super(
          name: 'Text',
          columns: 2,
          build: () => [
            Text(''),
            for (int i = 3; i < 15; i = i + 2) Text(faker.lorem.words(i).join(' ')),
          ],
        );
}
