import 'dart:math';
import 'dart:ui';
import 'package:fashion_runway/utilities/page_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

var cardAspectRatio = 18.0 / 15.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class Runway extends StatelessWidget {
  final PageController controller;
  final bool isOnMobile;
  Runway(this.controller, this.isOnMobile);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [kLightBlue, Colors.white],
            begin: const FractionalOffset(0.5, 0.0),
            end: const FractionalOffset(0.3, 0.5),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      width: isOnMobile ? size.width : size.width * 2 / 3,
      height: isOnMobile ? size.height * 4 / 9 : size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          LookQueue(),
          LookNumber(),
          WelcomeText(),
          Positioned.fill(
            child: PageView.builder(
              itemCount: lookURLs.length,
              pageSnapping: true,
              controller: controller,
              reverse: false,
              itemBuilder: (context, index) {
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LookQueue extends StatelessWidget {
  double _heavisideStep(double x) {
    if (x >= 0)
      return sqrt(x);
    else
      return -2 * sqrt(-x);
  }

  var currentPage;
  @override
  Widget build(BuildContext context) {
    List<String> images = lookURLs;
    return Consumer<PageNumberNotifier>(
      builder: (context, notifier, child) {
        currentPage = notifier.page ?? images.length - 1;
        return AspectRatio(
          aspectRatio: widgetAspectRatio,
          child: LayoutBuilder(builder: (context, contraints) {
            List<Widget> lookList = [];

            for (var i = 0; i < images.length; i++) {
              var x = (currentPage - i);
              var start = _heavisideStep(x) * contraints.maxWidth / 3;
              var offset = (currentPage - i) * 100;

              var lookItem = Positioned.directional(
                end: start,
                height: contraints.maxHeight - offset,
                textDirection: TextDirection.ltr,
                child: ImageFiltered(
                  imageFilter:
                      ImageFilter.blur(sigmaX: (x) * 1, sigmaY: (x) * 1),
                  child: AspectRatio(
                    aspectRatio: contraints.maxHeight / contraints.maxWidth,
                    child: Opacity(
                      opacity: 1.0,
                      child: Container(
                        alignment: Alignment.center,
                        height: contraints.maxHeight,
                        child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage(images[i]),
                        ),
                      ),
                    ),
                  ),
                ),
              );
              lookList.add(lookItem);
            }
            return Stack(
              alignment: Alignment.center,
              children: lookList,
            );
          }),
        );
      },
    );
  }
}

class LookNumber extends StatelessWidget {
  int number = lookURLs.length - 1;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      child: Consumer<PageNumberNotifier>(
        builder: (context, notifier, child) {
          if (notifier.page == null)
            number = lookURLs.length - 1;
          else
            number = notifier.page.toInt();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'LOOK',
                    style: TextStyle(
                      color: kDarkBlue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Opacity(
                    opacity:
                        1 - (notifier.page != null ? notifier.page % 1 : 0.0),
                    child: Text(
                      '${number + 1}',
                      style: TextStyle(
                        color: kDarkBlue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'SHOP THE LOOK',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10.0,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SPRING SUMMER 2020',
            style: TextStyle(
              color: kDarkBlue,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            '''Lorem ipsum dolor sit amet, consectetur adip
elit, sed do eiusmod tempor incididunt
labore et dolore magna aliqua. ''',
            style: TextStyle(
              color: kDarkBlue,
              fontSize: 10.0,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
