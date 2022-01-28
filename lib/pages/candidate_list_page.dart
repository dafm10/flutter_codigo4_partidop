import 'package:flutter/material.dart';
import 'package:flutter_codigo4_partidop/models/candidate_model.dart';
import 'package:flutter_codigo4_partidop/pages/candidate_detail_page.dart';
import 'package:flutter_codigo4_partidop/services/api_services.dart';
import 'package:flutter_codigo4_partidop/ui/general/colors.dart';
import 'package:flutter_codigo4_partidop/ui/widgets/item_list_candidate_widget.dart';

class CandidateListPage extends StatefulWidget {
  const CandidateListPage({Key? key}) : super(key: key);

  @override
  _CandidateListPageState createState() => _CandidateListPageState();
}

class _CandidateListPageState extends State<CandidateListPage> {
  final APIService _apiService = APIService();
  List<String> regionList = [
    "Lima",
    "Arequipa",
    "Tacna",
    "Cusco",
    "Huancavelica",
    "La Libertad",
    "Ayacucho",
  ];

  String regionValue = "";
  List<CandidateModel> listCandidate = [];
  List<CandidateModel> listCandidateAux = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    regionValue = regionList[0];
    _apiService.getListCandidate().then((value) {
      listCandidate = value;
      listCandidateAux = value;
      changeRegion(regionValue);
    });
  }

  changeRegion(String region) {
    listCandidate = listCandidateAux;
    listCandidate =
        listCandidate.where((element) => element.region == region).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //print("xxxx ${listCandidate.where((element) => element.region == "Lima").toList()}");

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: COLOR_BRAND_PRIMARY,
        /*title: DropdownButtonFormField(
          dropdownColor: COLOR_BRAND_PRIMARY,
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
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
                color: Colors.white,
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
        ),*/
        title: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: COLOR_BRAND_PRIMARY,
          ),
          child: DropdownButton(
            underline: Container(),
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      value: e,
                    ))
                .toList(),
            onChanged: (String? value) {
              regionValue = value!;
              changeRegion(regionValue);
            },
          ),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: listCandidate.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemListCandidateWidget(
            image: listCandidate[index].foto,
            name: listCandidate[index].nombre,
            region: listCandidate[index].region,
            resumen: listCandidate[index].resumen,
            numero: listCandidate[index].numero,
            //profesion: listCandidate[index].profesion,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CandidateDetailPage()));
            },
          );
        },
      ),
    );
  }
}
