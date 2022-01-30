import 'package:flutter/material.dart';
import 'package:flutter_codigo4_partidop/pages/candidate_list_page.dart';
import 'package:flutter_codigo4_partidop/pages/location_page.dart';
import 'package:flutter_codigo4_partidop/pages/proposal_page.dart';
import 'package:flutter_codigo4_partidop/ui/general/colors.dart';
import 'package:flutter_codigo4_partidop/ui/widgets/item_list_home_widget.dart';
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
          ItemListHomeWidget(
            title: "Candidatos al Congreso",
            subTitle: "Contamos con un equipo de verdad, ¡Conócelos!",
            imageLeading: "assets/images/bx-male-female.svg",
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CandidateListPage(),
                  ));
            },
          ),
          ItemListHomeWidget(
            title: "Propiuestas Moradas",
            subTitle: "Propuestas Legislativas - Congreso 2020",
            imageLeading: "assets/images/bx-spread.svg",
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProposalPage(),
                  ));
            },
          ),
          ItemListHomeWidget(
            title: "Bases Moradas",
            subTitle: "Descrube la base morada más cerca de ti",
            imageLeading: "assets/images/bx-map.svg",
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LocationPage(),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
