import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  final String type;
  final String text;

  InfoText({this.type, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$type: ',
          style: Theme.of(context).accentTextTheme.bodyText2,
        ),
        Flexible(
          child: Text(
            text,
            style: Theme.of(context).accentTextTheme.bodyText1,
          ),
        )
      ],
    );
  }
}
