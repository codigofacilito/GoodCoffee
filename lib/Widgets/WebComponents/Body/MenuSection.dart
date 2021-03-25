import 'package:flutter/material.dart';
import 'package:goodcoffee/Modelo/Menu.dart';
import 'package:goodcoffee/Values/ResponsiveApp.dart';
import 'package:goodcoffee/Values/StringApp.dart';
import 'package:goodcoffee/Widgets/WebComponents/Body/Container/MenuContainer.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import 'Container/SectionContainer.dart';

class MenuSection extends StatelessWidget {

  AutoScrollController _scrollController;
  MenuSection(this._scrollController);
  ResponsiveApp responsiveApp;
  @override
  Widget build(BuildContext context) {
    responsiveApp=ResponsiveApp(context);

    return Column(
      children: [
        SectionContainer(
          title: sectionMenuTitleStr,
          subTitle: sectionMenuSubTitleStr,
        ),
        Padding(padding: responsiveApp.edgeInsetsApp.onlyExLargeTopEdgeInsets,child:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              menu.length, (index) => MenuContainer(index: index,onPress:()=> scrollIndex(index+1))),
        ))
      ],
    );
  }

  scrollIndex(index){
    _scrollController.scrollToIndex(index);
  }
}
