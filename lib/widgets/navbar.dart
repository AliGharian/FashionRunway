import 'package:flutter/material.dart';
import '../constants.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: kDarkBlue,
      height: size.height * 1 / 9,
      width: size.width,
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LogoType(text: 'MARC JACOBS'),
          Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class LogoType extends StatelessWidget {
  final String text;
  LogoType({this.text});
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 0,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.yellow[700],
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
