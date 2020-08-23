import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:image_mocker/src/data.dart';
import 'package:image_mocker/src/widgets/backdrop.dart';
import 'package:image_mocker/src/widgets/inset.dart';

class InsetCard extends StatefulWidget {
  final PlaceholderService placeholderService;

  const InsetCard({Key key, @required this.placeholderService})
      : assert(placeholderService != null),
        super(key: key);

  @override
  _InsetCardState createState() => _InsetCardState();
}

class _InsetCardState extends State<InsetCard> {
  final GlobalKey _globalKey = GlobalKey();
  double insetHeight = 0.0;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(_onFirstBuild);
    super.initState();
  }

  void _onFirstBuild(_) {
    this.setState(() {
      insetHeight = _globalKey.currentContext.size.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: InsetShadow(height: insetHeight),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: insetHeight / 2),
          child: Backdrop(placeholderService: widget.placeholderService),
        ),
        Container(
          key: _globalKey,
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Inset(placeholderService: widget.placeholderService),
        ),
      ],
    );
  }
}
