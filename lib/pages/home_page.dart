import 'package:fashion_runway/constants.dart';
import 'package:fashion_runway/utilities/page_change_notifier.dart';
import 'package:fashion_runway/utilities/responsive_controller.dart';
import 'package:fashion_runway/widgets/navbar.dart';
import 'package:fashion_runway/widgets/runway.dart';
import 'package:fashion_runway/widgets/scrollable_list.dart';
import 'package:fashion_runway/widgets/side_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final PageController _pageController = PageController(
    initialPage: lookURLs.length - 1,
  );
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PageNumberNotifier(_pageController),
      child: Scaffold(
        body: Body(_pageController),
      ),
    );
  }
}

class Body extends StatelessWidget {
  final PageController controller;
  Body(this.controller);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: LargeChild(controller),
      smallScreen: SmallChild(controller),
    );
  }
}

class LargeChild extends StatelessWidget {
  final PageController controller;
  LargeChild(this.controller);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SideNav(),
        Runway(controller, false),
        ScrollableList(false),
      ],
    );
  }
}

class SmallChild extends StatelessWidget {
  final PageController controller;
  SmallChild(this.controller);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Navbar(),
        Runway(controller, true),
        ScrollableList(true),
      ],
    );
  }
}
