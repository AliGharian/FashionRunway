import 'package:fashion_runway/constants.dart';
import 'package:fashion_runway/utilities/page_change_notifier.dart';
import 'package:fashion_runway/utilities/responsive_controller.dart';
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
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  // final PageController controller;
  // Body(this.controller);
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: LargeChild(),
      smallScreen: LargeChild(),
    );
  }
}

class LargeChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SideNav(),
        ScrollableList(),
      ],
    );
  }
}

class SmallChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
