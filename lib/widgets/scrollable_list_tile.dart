import 'package:fashion_runway/constants.dart';
import 'package:fashion_runway/models/look_details.dart';
import 'package:flutter/material.dart';

class ScrollableListTile extends StatelessWidget {
  final LookDetail lookDetail;
  final Color color;

  ScrollableListTile({this.lookDetail, this.color});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20.0),
      color: color,
      height: size.height / 2,
      child: Column(
        children: [
          Container(
            child: Image.asset(
              lookDetail.imageURL,
              height: size.height / 2 - 100,
              fit: BoxFit.fitWidth,
            ),
          ),
          Text(
            lookDetail.description,
            style: TextStyle(
              color: kDarkBlue,
              fontSize: 18.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.favorite_border,
                color: kDarkBlue,
              ),
              Text('\$ ${lookDetail.price}'),
            ],
          ),
        ],
      ),
    );
  }
}
