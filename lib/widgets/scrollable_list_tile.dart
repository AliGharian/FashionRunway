import 'package:fashion_runway/constants.dart';
import 'package:fashion_runway/models/look_details.dart';
import 'package:flutter/material.dart';

class ScrollableListTile extends StatelessWidget {
  final LookDetail lookDetail;
  final Color color;
  final bool isOnMobile;

  ScrollableListTile({this.lookDetail, this.color, this.isOnMobile});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20.0),
      color: color,
      height: isOnMobile ? size.height * 4 / 9 : size.height / 2,
      width: isOnMobile ? size.width / 2 : size.width * 2 / 9,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.favorite_border,
            color: kDarkBlue,
          ),
          Center(
            child: Image.asset(lookDetail.imageURL,
                height: size.height / 2 - (isOnMobile ? 170 : 130),
                fit: BoxFit.fitWidth),
          ),
          Text(
            lookDetail.description,
            style: TextStyle(
              color: kDarkBlue,
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ ${lookDetail.price}',
                style: TextStyle(
                  color: kDarkBlue,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.add,
                color: kDarkBlue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
