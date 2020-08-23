import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_mocker/src/data.dart';
import 'package:image_mocker/src/widgets/inset_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final safeAreaPadding = MediaQuery.of(context).padding;

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8.0) +
            EdgeInsets.only(
              top: safeAreaPadding.top,
              bottom: safeAreaPadding.bottom,
            ),
        children: placeholderServices.map((placeholderService) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InsetCard(placeholderService: placeholderService),
          );
        }).toList(),
      ),
    );
  }
}
