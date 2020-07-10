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
          TopIcons(),
          LogoType(text: 'MARC JACOBS'),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items.map((String item) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  item,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              );
            }).toList(),
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

class TopIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_basket,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
