import 'package:flutter/material.dart';
import 'package:flutter_codigo4_partidop/ui/general/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemListHomeWidget extends StatelessWidget {
  String title;
  String subTitle;
  String imageLeading;
  Function onPressed;

  ItemListHomeWidget({
    required this.title,
    required this.subTitle,
    required this.imageLeading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: COLOR_BRAND_PRIMARY,
        boxShadow: const [
          BoxShadow(
            color: Color(0xff0D48C1),
            blurRadius: 12,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: ListTile(
        onTap: (){
          onPressed();
        },
        // minLeadingWidth para el espacio entre los items
        minLeadingWidth: 0,
        contentPadding: EdgeInsets.zero,
        leading: SvgPicture.asset(
          imageLeading,
          color: Colors.white,
          height: _height * 0.04,
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          subTitle,
          style: TextStyle(color: Colors.white70, fontSize: 13.0),
        ),
        trailing: SvgPicture.asset(
          "assets/images/bx-chevron-right.svg",
          color: Colors.white,
          height: _height * 0.04,
        ),
      ),
    );
  }
}
