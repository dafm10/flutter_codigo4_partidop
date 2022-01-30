import 'package:flutter/material.dart';
import 'package:flutter_codigo4_partidop/models/candidate_model.dart';
import 'package:flutter_codigo4_partidop/ui/general/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class CandidateDetailPage extends StatefulWidget {
  CandidateModel candidate;

  CandidateDetailPage({required this.candidate});

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
      setState(() {});
    });
  }

  handleTabSelection() {
    setState(() {});
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
              floating: false,
              pinned: true,
              snap: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(widget.candidate.nombre),
                centerTitle: true,
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      widget.candidate.foto,
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
              //floating: false,
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
                widget.candidate.resumen,
                style: TextStyle(color: Colors.black87),
              ),
            ),
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        widget.candidate.nombre,
                        style: const TextStyle(
                          color: COLOR_BRAND_PRIMARY,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: SvgPicture.asset(
                        "assets/images/link.svg",
                        color: COLOR_BRAND_PRIMARY,
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        "Postula por la región:",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(widget.candidate.region),
                    ),
                    ListTile(
                      title: const Text(
                        "Número:",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(widget.candidate.numero.toString()),
                    ),
                    widget.candidate.profesion != ""
                        ? ListTile(
                            title: const Text(
                              "Profesión:",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(widget.candidate.profesion!),
                          )
                        : Container(),
                    widget.candidate.email != ""
                        ? ListTile(
                            title: const Text(
                              "Email",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(widget.candidate.email!),
                          )
                        : Container(),
                    widget.candidate.experiencia != ""
                        ? ListTile(
                            title: const Text(
                              "Experiencia",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              widget.candidate.experiencia!,
                            ),
                          )
                        : Container(),
                    widget.candidate.paginaWeb != ""
                        ? ListTile(
                            title: const Text(
                              "Página web",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              widget.candidate.paginaWeb!,
                              style: const TextStyle(
                                color: COLOR_BRAND_PRIMARY,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: IconButton(
                              icon: SvgPicture.asset(
                                "assets/images/link.svg",
                                color: COLOR_BRAND_PRIMARY,
                              ),
                              onPressed: () async {
                                await launch(widget.candidate.paginaWeb!);
                              },
                            ),
                          )
                        : Container(),
                    ListTile(
                      title: const Text(
                        "Redes Sociales",
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          widget.candidate.facebook != ""
                              ? IconButton(
                                  onPressed: () async {
                                    await launch(widget.candidate.facebook!);
                                  },
                                  icon: SvgPicture.asset(
                                    "assets/images/facebook.svg",
                                    color: COLOR_BRAND_PRIMARY,
                                  ),
                                )
                              : Container(),
                          widget.candidate.twitter != ""
                              ? IconButton(
                                  onPressed: () async {
                                    await launch(widget.candidate.twitter!);
                                  },
                                  icon: SvgPicture.asset(
                                    "assets/images/twitter.svg",
                                    color: COLOR_BRAND_PRIMARY,
                                  ),
                                )
                              : Container(),
                          widget.candidate.instagram != ""
                              ? IconButton(
                                  onPressed: () async {
                                    await launch(widget.candidate.instagram!);
                                  },
                                  icon: SvgPicture.asset(
                                    "assets/images/instagram.svg",
                                    color: COLOR_BRAND_PRIMARY,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _height * 0.015,
                    ),
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
      color: Colors.white,
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
