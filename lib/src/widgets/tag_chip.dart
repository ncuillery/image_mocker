import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  final String tag;

  const TagChip({Key key, this.tag})
      : assert(tag != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      visualDensity: VisualDensity.compact,
      backgroundColor: Colors.grey[200],
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      label: Text(
        tag,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
