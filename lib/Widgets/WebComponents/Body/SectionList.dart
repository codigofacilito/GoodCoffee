
import 'package:flutter/material.dart';
import 'package:goodcoffee/Modelo/Section.dart';
import 'package:goodcoffee/Values/ResponsiveApp.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'MenuSection.dart';
import 'ProductSection.dart';

class SectionListView extends StatelessWidget {
  AutoScrollController autoScrollController;

   SectionListView(this.autoScrollController);
  ResponsiveApp responsiveApp;
  @override
  Widget build(BuildContext context) {
    responsiveApp=ResponsiveApp(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          sections.length+1, (index) {
          return (index == 0)
              ? Padding(
              padding: responsiveApp.edgeInsetsApp.allExLargeEdgeInsets,
              child: addScroll(MenuSection(autoScrollController), 0))
              :Padding(
              padding: responsiveApp.edgeInsetsApp.allExLargeEdgeInsets,
              child: addScroll(ProductSection(sections[index - 1]), index));
        } ,
        ));
  }

  addScroll(Widget child, index) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: autoScrollController,
      index: index,
      child: child,
    );
  }
}
