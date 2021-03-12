import 'package:fashion_runway/pages/products_page.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

List<String> items = [
  'Home',
  'Products',
  'Contacts',
  'About',
];

class SideNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
      color: kDarkBlue,
      height: size.height,
      width: size.width * 1 / 9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SearchField(),
          TopIcons(),
          LogoType(text: 'MARC JACOBS'),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items.map((String item) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    item,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
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

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white10,
      decoration: InputDecoration(
        focusColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(90.0)),
          //borderSide: const BorderSide(),
        ),
        prefixIcon: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (contex) => ProductsPage()));
          },
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        filled: true,
        fillColor: Colors.white10,
        hintText: 'Search...',
        hintStyle: TextStyle(color: Colors.grey),
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
      padding: EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_basket,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
