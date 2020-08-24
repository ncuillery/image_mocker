import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> configureScreenSize(WidgetTester tester) async {
  final size = Size(414.0, 896.0);
  await tester.binding.setSurfaceSize(size);
  tester.binding.window.physicalSizeTestValue = size;
  tester.binding.window.devicePixelRatioTestValue = 1;
}

Future<void> _loadFont(String name, String path) async {
  final fontFile = File(path);
  final fontData = await fontFile.readAsBytes();
  final fontLoader = FontLoader(name);
  fontLoader.addFont(Future.value(ByteData.view(fontData.buffer)));
  await fontLoader.load();
}

Future<void> loadFonts() async {
  // TODO https://github.com/flutter/flutter/issues/20907
  if (Directory.current.path.endsWith('/test')) {
    Directory.current = Directory.current.parent;
  }

  await _loadFont(
    'MaterialIcons',
    'test/assets/MaterialIcons-Regular.ttf',
  );
  await _loadFont(
    'Roboto',
    'test/assets/Roboto-Regular.ttf',
  );
}
