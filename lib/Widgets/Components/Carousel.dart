import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:goodcoffee/Modelo/Carousel.dart';
import 'package:goodcoffee/Util/SizingInfo.dart';
import 'package:goodcoffee/Values/ResponsiveApp.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  final CarouselController _controller = CarouselController();

  int _current = 0;

  ResponsiveApp responsiveApp;

  List<Widget> generateImageTiles() {
    return carousel
        .map(
          (element) => ClipRRect(
        borderRadius:
        BorderRadius.circular(responsiveApp.carouselRadiusWidth),
        child: Image.asset(
          element.image,
          fit: BoxFit.cover,
        ),
      ),
    )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    responsiveApp = ResponsiveApp(context);
    var imageSliders = generateImageTiles();
    return Stack(
      children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              scrollPhysics: isMobileAndTablet(context)
                  ? PageScrollPhysics()
                  : NeverScrollableScrollPhysics(),
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio:  18/8,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                  for (int i = 0; i < carousel.length; i++)
                    carousel[i].isSelected=(i == index)?true:false;

                });
              }),
          carouselController: _controller,
        ),
        Positioned.fill(
            child: Center(
              child: Text(
                carousel[_current].title,
                style: TextStyle(
                  letterSpacing: responsiveApp.letterSpacingCarouselWidth,
                  fontFamily: 'Electrolize',
                  fontSize: responsiveApp.headline3,
                ),
              ),
            )),
        isMobileAndTablet(context)
            ? Container()
            : Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: responsiveApp.carouselContainerWidth,
                  height: responsiveApp.carouselContainerHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        carousel.length,
                            (index) => InkWell(
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onTap: () {
                            _controller.animateToPage(index);
                          },
                          child: Container(
                            width: responsiveApp
                                .carouselCircleContainerWidth,
                            height: responsiveApp
                                .carouselCircleContainerHeight,
                            margin: responsiveApp
                                .edgeInsetsApp.allSmallEdgeInsets,
                            decoration: BoxDecoration(
                                color: carousel[index].isSelected
                                    ? Colors.white
                                    : Colors.blueGrey,
                                shape: BoxShape.circle),
                          ),
                        )),
                  )),
            ))
      ],
    );
  }
}
