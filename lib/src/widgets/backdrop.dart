import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
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
        child: CachedNetworkImage(
          imageUrl: placeholderService.pictureUrl,
          cacheManager: GetIt.instance.get<BaseCacheManager>(),
          placeholder: (_, __) => Container(
            color: Colors.grey[200],
          ),
        ),
      ),
    );
  }
}
