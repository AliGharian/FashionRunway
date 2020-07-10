import 'package:flutter/material.dart';

class PageNumberNotifier with ChangeNotifier {
  double _page;
  double _offset;

  PageNumberNotifier(PageController pageController) {
    pageController.addListener(() {
      _page = pageController.page;
      _offset = pageController.offset;
      notifyListeners();
    });
  }
  double get page => _page;
  double get offset => _offset;
}
