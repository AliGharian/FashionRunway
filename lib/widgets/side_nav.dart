import 'package:flutter/material.dart';
import '../constants.dart';

List<String> items = ['Home', 'Products', 'Contacts', 'About'];

class SideNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: kDarkBlue,
      height: size.height,
      width: size.width * 1 / 9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          LogoType(text: 'MARC JACOBS'),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: items.map((String item) {
              return Text(
                item,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  MenuItem({this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
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
      quarterTurns: 1,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.yellow[700],
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }
}
