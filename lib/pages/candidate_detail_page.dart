import 'package:flutter/material.dart';
import 'package:flutter_codigo4_partidop/ui/general/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

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
    _tabController!.addListener(() {
      valueTab = _tabController!.index;
      setState(() {

      });
    });
  }

  handleTabSelection(){
    setState(() {

    });
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
              floating: false,
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
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      title: Text("Francisco Sagasti",
                        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,),
                      ),
                      trailing: Icon(Icons.share, color: COLOR_BRAND_PRIMARY,),
                    ),
                    ListTile(
                      title: Text("Postula por la región:",
                        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,),
                      ),
                      subtitle: Text("Lima"),
                    ),
                    ListTile(
                      title: Text("Profesión:",
                        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,),
                      ),
                      subtitle: Text("Ingeniero Industrial"),
                    ),
                    ListTile(
                      title: Text("Email",
                        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,),
                      ),
                      subtitle: Text("contacto@dominio.com"),
                    ),
                    ListTile(
                      title: Text("Experiencia",
                        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,),
                      ),
                      subtitle: Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                      ),
                    ),
                    ListTile(
                      title: Text("Página web",
                        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,),
                      ),
                      subtitle: Text("https://tudominio.com",
                        style: TextStyle(
                          color: COLOR_BRAND_PRIMARY,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: SvgPicture.asset("assets/images/link.svg", color: COLOR_BRAND_PRIMARY,),
                    ),
                    ListTile(
                      title: Text("Redes Sociales",
                        style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold,),
                      ),
                      subtitle: Row(
                        children: [
                          IconButton(
                            onPressed: (){},
                            icon: SvgPicture.asset("assets/images/facebook.svg", color: COLOR_BRAND_PRIMARY,),
                          ),
                          IconButton(
                            onPressed: (){},
                            icon: SvgPicture.asset("assets/images/twitter.svg", color: COLOR_BRAND_PRIMARY,),
                          ),
                          IconButton(
                            onPressed: (){},
                            icon: SvgPicture.asset("assets/images/instagram.svg", color: COLOR_BRAND_PRIMARY,),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: _height * 0.015,),
                  ],
                ),
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
