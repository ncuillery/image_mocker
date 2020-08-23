import 'package:flutter/material.dart';
import 'package:image_mocker/src/data.dart';
import 'package:image_mocker/src/widgets/tag_chip.dart';
import 'package:url_launcher/url_launcher.dart';

class InsetShadow extends StatelessWidget {
  final double height;

  const InsetShadow({
    Key key,
    @required this.height,
  })  : assert(height != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200],
            spreadRadius: 8.0,
            blurRadius: 8.0,
          )
        ],
      ),
    );
  }
}

class Inset extends StatelessWidget {
  final PlaceholderService placeholderService;

  const Inset({Key key, @required this.placeholderService})
      : assert(placeholderService != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      child: Ink(
        child: InkWell(
          onTap: () async {
            final canOpen = await canLaunch(placeholderService.url);
            if (canOpen) {
              await launch(placeholderService.url);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        placeholderService.name,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Icon(
                      Icons.open_in_new,
                      color: Colors.grey[400],
                    )
                  ],
                ),
                Divider(),
                Text(
                  placeholderService.description,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Divider(),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 4.0,
                  runSpacing: 4.0,
                  children: placeholderService.tags
                      .map((tag) => TagChip(tag: tag))
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
