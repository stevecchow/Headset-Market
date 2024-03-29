import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorSelector extends StatefulWidget {
  final List<Color> colors;
  ColorSelector({@required this.colors});
  @override
  _ColorSelectorState createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  int currentColorIndex = 1;
  bool isSelected;
  List<Widget> colorSelector() {
    List<Widget> colorItemList = new List();

    for (var i = 0; i < widget.colors.length; i++) {
      isSelected = currentColorIndex == i;
      colorItemList.add(
        colorItem(
          color: widget.colors[i],
          isSelected: isSelected,
          ontab: () {
            setState(() {
              currentColorIndex = i;
            });
          },
        ),
      );
    }
    return colorItemList;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: colorSelector(),
    );
  }

  Widget colorItem({Color color, bool isSelected, Function ontab}) {
    return GestureDetector(
      onTap: ontab,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
        child: Container(
          width: ScreenUtil().setWidth(75),
          height: ScreenUtil().setHeight(75),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.white : Colors.transparent,
              width: ScreenUtil().setWidth(8),
            ),
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black38,
                        offset: Offset(0, 5),
                        blurRadius: 5)
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
