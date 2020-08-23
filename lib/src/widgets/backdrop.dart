import 'package:flutter/material.dart';
import 'package:image_mocker/src/data.dart';

class Backdrop extends StatelessWidget {
  final PlaceholderService placeholderService;

  const Backdrop({Key key, @required this.placeholderService})
      : assert(placeholderService != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      clipBehavior: Clip.antiAlias,
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Image.network(placeholderService.pictureUrl),
      ),
    );
  }
}
