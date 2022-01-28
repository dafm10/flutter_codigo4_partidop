import 'package:flutter/material.dart';
import 'package:flutter_codigo4_partidop/ui/general/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CandidateDetailPage extends StatefulWidget {
  @override
  State<CandidateDetailPage> createState() => _CandidateDetailPageState();
}

class _CandidateDetailPageState extends State<CandidateDetailPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int valueTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: COLOR_BRAND_PRIMARY,
              expandedHeight: _height * 0.4,
              elevation: 0,
              floating: true,
              pinned: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Holass"),
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
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: _tabController,
                  indicatorColor: COLOR_BRAND_PRIMARY,
                  indicatorWeight: 3.0,
                  labelColor: Colors.black87,
                  unselectedLabelColor: Colors.black26,
                  onTap: (int value) {
                    setState(() {
                      valueTab = value;
                    });
                  },
                  tabs: [
                    Tab(
                      text: "¿Quien soy?",
                      icon: SvgPicture.asset(
                        "assets/images/user.svg",
                        color: valueTab == 0
                            ? COLOR_BRAND_PRIMARY
                            : Colors.black26,
                      ),
                      /*child: Text(
                        "¿Quien soy?",
                        style: TextStyle(
                          color: _tabController!.index == 0 ? Colors.black87 : Colors.black26,
                        ),
                      ),*/
                    ),
                    Tab(
                      text: "Información",
                      icon: SvgPicture.asset(
                        "assets/images/info.svg",
                        color: valueTab == 1
                            ? COLOR_BRAND_PRIMARY
                            : Colors.black26,
                      ),
                      /*child: Text(
                        "Información",
                        style: TextStyle(
                          color: _tabController!.index == 1 ? Colors.black87 : Colors.black26,
                        ),
                      ),*/
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                style: TextStyle(
                  color: Colors.black87
                ),
              ),
            ),
            Center(
              child: Text(
                "2",
                style: TextStyle(color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  // tamaño maximo
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    // throw UnimplementedError();
    return true;
  }
}
