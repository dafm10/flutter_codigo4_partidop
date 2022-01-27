import 'package:flutter/material.dart';
import 'package:flutter_codigo4_partidop/ui/general/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: COLOR_BRAND_PRIMARY,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo.png",
            height: _height * 0.17,
          ),
          SizedBox(
            height: _height * 0.01,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: COLOR_BRAND_PRIMARY,
              boxShadow: [
                BoxShadow(
                  color: Color(0xff0D48C1),
                  blurRadius: 12,
                  offset: Offset(4,4),
                ),
              ],
            ),
            child: ListTile(
              // minLeadingWidth para el espacio entre los items
              minLeadingWidth: 0,
              contentPadding: EdgeInsets.zero,
              leading: SvgPicture.asset(
                "assets/images/bx-male-female.svg",
                color: Colors.white,
                height: 34.0,
              ),
              title: Text(
                "Candidatos al congreso",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "Contamos con un equipo de verdad ¡Conócelos!",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 13.0
                ),
              ),
              trailing: SvgPicture.asset(
                "assets/images/bx-chevron-right.svg",
                color: Colors.white,
                height: 34.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
