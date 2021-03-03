import 'package:flutter/material.dart';

import '../constants.dart';

class bottomCard extends StatefulWidget {
  final String str;
  final String string;
  final String unit;

  bottomCard({@required this.str, @required this.string, this.unit});

  @override
  _bottomCardState createState() => _bottomCardState();
}

class _bottomCardState extends State<bottomCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.str,
          style: kText_style,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Text(
              widget.string,
              style: kBoldText_style,
            ),
            Text(widget.unit),
          ],
        ),


      ],
    );
  }
}