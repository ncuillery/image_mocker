import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:image_mocker/src/data.dart';
import 'package:image_mocker/src/widgets/inset_card.dart';

import 'golden_testing_utils.dart';
import 'test_cache_manager.dart';

const testService = PlaceholderService(
  name: 'My Own Service',
  description:
      'My own placeholder service regrouping all the killer features from the other ones. It is used by all the developers and designers in the world.',
  url: 'http://github.com/ncuillery',
  pictureUrl: 'https://myownservice.com/example',
  tags: ['Stock photo', 'Text', 'Grayscale', 'Themes'],
);

void main() {
  GetIt.instance.registerSingleton<BaseCacheManager>(
    TestCacheManager(),
  );

  setUpAll(() async {
    await loadFonts();
  });

  testWidgets('InsetCard renders correctly', (WidgetTester tester) async {
    await configureScreenSize(tester);

    await tester.runAsync(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: UnconstrainedBox(
            constrainedAxis: Axis.horizontal,
            child: InsetCard(placeholderService: testService),
          ),
        ),
      );
    });

    await tester.pumpAndSettle();

    await expectLater(
      find.byType(InsetCard),
      matchesGoldenFile('insert_card.png'),
    );
  });
}
