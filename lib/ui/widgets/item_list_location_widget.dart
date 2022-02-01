
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_partidop/ui/general/colors.dart';

class ItemListLocationWidget extends StatelessWidget {
  const ItemListLocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
      height: _height * 0.14,
      width: _width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black87.withOpacity(0.08),
            blurRadius: 12.0,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            //height: _height * 0.14,
            width: _width * 0.25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14.0),
                bottomLeft: Radius.circular(14.0),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://visitalima.pe/wp-content/uploads/2020/09/1-2.jpg"),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Base Rimac",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: COLOR_BRAND_PRIMARY,
                        fontSize: 16.0),
                  ),
                  Text(
                    "Lima - Rimac",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black87.withOpacity(0.6),
                      fontSize: 14.0,
                    ),
                  ),
                  Text(
                    "Av. Santa Rosa 183, Piedra Liza, Rimac",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black87.withOpacity(0.6),
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
