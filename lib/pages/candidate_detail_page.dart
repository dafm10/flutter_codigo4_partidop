import 'package:flutter/material.dart';
import 'package:flutter_codigo4_partidop/ui/general/colors.dart';

class CandidateDetailPage extends StatelessWidget {
  const CandidateDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: COLOR_BRAND_PRIMARY,
            expandedHeight: _height * 0.4,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Hola"),
              centerTitle: true,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    "http://192.168.1.37:8000/media/candidatos/fracisco_sagasti.jpg",
                    fit: BoxFit.cover,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.center,
                        end: Alignment.bottomCenter,
                        colors: [
                          COLOR_BRAND_PRIMARY.withOpacity(0),
                          COLOR_BRAND_PRIMARY.withOpacity(0.5),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 300,
                  color: Colors.redAccent,
                ),
                Container(
                  height: 400,
                  color: Colors.blueAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
