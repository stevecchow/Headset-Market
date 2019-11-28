import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularButton extends StatelessWidget {
  final Color color;
  final Icon iconData;
  final Function onPressed;
  CircularButton({
    this.color,
    this.iconData,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.only(left: 14.0),
      child: Container(
        width: ScreenUtil().setWidth(120),
        height: ScreenUtil().setWidth(120),
        // width: 65,
        // height: 65,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            // gradient: LinearGradient(colors: colors, tileMode: TileMode.clamp)),
            color: color,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 10),
                blurRadius: 10,
                spreadRadius: 4,
              )
            ]),
        child: RawMaterialButton(
          shape: CircleBorder(),
          onPressed: onPressed,
          child: iconData,
        ),
      ),
    );
  }
}
