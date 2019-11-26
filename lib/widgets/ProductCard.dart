import 'package:flutter/material.dart';
import '../style.dart';

class ProductCard extends StatelessWidget {
  final String imgUrl;
  final String name;
  final int color;
  ProductCard({this.imgUrl, this.name, this.color});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: Container(
        width: 165,
        height: 240,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(left: 5, right: 5, bottom: 20),
                child: Container(
                  width: 140,
                  height: 170,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            offset: Offset(0, 10),
                            blurRadius: 12)
                      ]),
                ),
              ),
            ),
            Positioned(
              right: -32,
              top: -10,
              child: Image.asset(imgUrl, width: 170, height: 150),
            ),
            Positioned(
              left: 30,
              bottom: 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(name, style: productTitleStyle),
                  Text(
                    "colors $color",
                    style: productsubTitleStyle,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
