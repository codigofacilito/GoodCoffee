import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goodcoffee/Util/Keys.dart';
import 'package:goodcoffee/Util/SizingInfo.dart';
import 'package:goodcoffee/Values/ResponsiveApp.dart';
import 'package:goodcoffee/Widgets/Components/Carousel.dart';
import 'package:goodcoffee/Widgets/MobileComponents/MenuTap.dart';
import 'package:goodcoffee/Widgets/MobileComponents/ShopAppBar.dart';
import 'package:goodcoffee/Widgets/MobileComponents/ShopDrawer.dart';
import 'package:goodcoffee/Widgets/WebComponents/Body/MenuSection.dart';
import 'package:goodcoffee/Widgets/WebComponents/Body/SectionList.dart';
import 'package:goodcoffee/Widgets/WebComponents/Footer/Footer.dart';
import 'package:goodcoffee/Widgets/WebComponents/Header/Header.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _scrollPosition = 0;
  double _opacity = 0;

  AutoScrollController autoScrollController;
  bool _isVisible = false;
  ResponsiveApp responsiveApp;

  _scrollListener() {
    setState(() {
      _scrollPosition = autoScrollController.position.pixels;
    });
  }

  @override
  void initState() {

    autoScrollController = AutoScrollController(
      //add this for advanced viewport boundary. e.g. SafeArea
        viewportBoundaryGetter: () =>
            Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);

    autoScrollController.addListener(_scrollListener);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    responsiveApp=ResponsiveApp(context);

    _opacity = _scrollPosition < responsiveApp.opacityHeight
        ? _scrollPosition / responsiveApp.opacityHeight
        : 1;

    _isVisible = _scrollPosition >= responsiveApp.menuHeight;
    return Scaffold(
        key: homeScaffoldKey,
        backgroundColor: Theme.of(context).backgroundColor,
        floatingActionButton: Visibility(
          visible: _isVisible,
          child: FloatingActionButton(
            onPressed: () => {
              autoScrollController.scrollToIndex(0)},
            child:  Icon(Icons.arrow_upward),
          ),
        ),
        appBar:
      isMobileAndTablet(context)
            ? ShopAppBar(_opacity)
            : Header(_opacity),
        drawer: ShopDrawer(),
        body: ListView(controller: autoScrollController, children: [
          Carousel(),
         isMobileAndTablet(context)
              ? MenuTap()
              : SectionListView(autoScrollController),
          isMobileAndTablet(context) ? SizedBox.shrink() : Footer()
        ]));
  }
}
