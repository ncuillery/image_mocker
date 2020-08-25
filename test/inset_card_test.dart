import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:image_mocker/src/data.dart';
import 'package:image_mocker/src/widgets/inset_card.dart';

import 'golden_testing_utils.dart';
import 'test_cache_manager.dart';

class AllowShadowsTestWidgetsFlutterBinding
    extends AutomatedTestWidgetsFlutterBinding {
  @override
  bool get disableShadows => false;
}

const testService = PlaceholderService(
  name: 'Place Kitten',
  description:
      'Use the Internet first-class citizens as placeholders for your Website.',
  url: 'https://placekitten.com',
  pictureUrl: 'https://placekitten.com/1024/768',
  tags: ['Fun', 'Grayscale'],
);

void main() {
  AllowShadowsTestWidgetsFlutterBinding();
  HttpOverrides.global = null;

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

      // Allow CachedNetworkImage to mount the Image widget in reaction
      // to the File Stream event.
      await tester.pump();

      // Preload the image.
      final element = tester.element(find.byType(Image));
      final Image widget = element.widget;
      await precacheImage(widget.image, element);

      // Finally pump a new frame to display the image
      await tester.pumpAndSettle();
    });

    await expectLater(
      find.byType(InsetCard),
      matchesGoldenFile('insert_card.png'),
    );
  });
}
