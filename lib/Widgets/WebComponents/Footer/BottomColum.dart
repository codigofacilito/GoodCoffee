
import 'package:flutter/material.dart';
import 'package:goodcoffee/Values/ResponsiveApp.dart';

class BottomColumn extends StatelessWidget {
  final String heading;
  final String s1;
  final String s2;
  final String s3;

  BottomColumn({
    this.heading,
    this.s1,
    this.s2,
    this.s3,
  });
  ResponsiveApp responsiveApp;
  @override
  Widget build(BuildContext context) {
    responsiveApp=ResponsiveApp(context);
    return Padding(
      padding: responsiveApp.edgeInsetsApp.onlyLargeBottomEdgeInsets,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: Theme.of(context).accentTextTheme.headline6,
          ),
          createS(s1,context),
          createS(s2,context),
          createS(s3,context)
        ],
      ),
    );
  }

  createS(String s,context){
    return Padding(padding: responsiveApp.edgeInsetsApp.onlySmallTopEdgeInsets,child:Text(
      s,
      style: Theme.of(context).accentTextTheme.bodyText1,
    ));
  }
}
