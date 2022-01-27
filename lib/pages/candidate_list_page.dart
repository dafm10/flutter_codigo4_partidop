import 'package:flutter/material.dart';
import 'package:flutter_codigo4_partidop/ui/general/colors.dart';

class CandidateListPage extends StatefulWidget {
  const CandidateListPage({Key? key}) : super(key: key);

  @override
  _CandidateListPageState createState() => _CandidateListPageState();
}

class _CandidateListPageState extends State<CandidateListPage> {
  List<String> regionList = [
    "Lima",
    "Arequipa",
    "Tacna",
    "Cusco",
    "Huancavelica",
    "La Libertad",
  ];

  String regionValue = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    regionValue = regionList[0];
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: COLOR_BRAND_PRIMARY,
        title: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: regionValue,
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
            items: regionList
                .map((e) => DropdownMenuItem(
                      child: Text(
                        e,
                        style: TextStyle(
                          color: Colors.black87.withOpacity(0.6),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      value: e,
                    ))
                .toList(),
            onChanged: (String? value) {
              regionValue = value!;
              setState(() {});
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
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
                        "https://www.ideeleradio.pe/wp-content/uploads/2017/11/Francisco-Sagasti-Ideeleradio-Foto-Andina.jpg",
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
                          "Francisco Sagasti",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: COLOR_BRAND_PRIMARY,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          "Lima",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Color(0xff1b1b1b),
                            fontSize: 15.0,
                          ),
                        ),
                        Text(
                          "Ingeniero Industria (UNI), magister (Penn State University",
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
                    "1",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
