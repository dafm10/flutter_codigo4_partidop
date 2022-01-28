import 'package:flutter/material.dart';
import 'package:flutter_codigo4_partidop/ui/general/colors.dart';

class ItemListCandidateWidget extends StatelessWidget {
  String image;
  String name;
  String region;
  String resumen;
  //String? profesion;
  int numero;

  ItemListCandidateWidget({
    required this.name,
    required this.image,
    required this.region,
    //this.profesion,
    required this.numero,
    required this.resumen,
  });

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.08),
            blurRadius: 12.0,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: _height * 0.114,
            width: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  image,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: COLOR_BRAND_PRIMARY,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    region,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Color(0xff1b1b1b),
                      fontSize: 15.0,
                    ),
                  ),
                  Text(
                    resumen,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Color(0xff1b1b1b).withOpacity(0.6),
                      fontSize: 13.0,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: _width * 0.175,
            height: _height * 0.114,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: COLOR_BRAND_PRIMARY,
            ),
            child: Text(
              numero.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
