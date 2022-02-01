import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_codigo4_partidop/models/bases_model.dart';
import 'package:flutter_codigo4_partidop/models/candidate_model.dart';
import 'package:flutter_codigo4_partidop/utils/constants.dart';
import 'package:http/http.dart' as http;

class APIService {
  Future<List<CandidateModel>> getListCandidate() async {
    try {
      List<CandidateModel> listCandidate = [];
      String _path = "$pathProduction/candidato/";
      Uri _uri = Uri.parse(_path);
      http.Response response = await http.get(_uri);
      if (response.statusCode == 200) {
        String source = Utf8Decoder().convert(response.bodyBytes);
        List myList = json.decode(source);
        listCandidate = myList.map<CandidateModel>((e) => CandidateModel.fromJson(e)).toList();
        return listCandidate;
      }
      return [];
    } on TimeoutException catch (e) {
      return Future.error("1");
    } on SocketException catch (e) {
      return Future.error("2");
    } on Error catch (e) {
      return Future.error("3");
    }
  }

  Future<List<BasesModel>> getListbases() async {
    try{
      List<BasesModel> listBases = [];
      String _path = "$pathProduction/base/";
      Uri _uri = Uri.parse(_path);
      http.Response response = await http.get(_uri);
      if (response.statusCode == 200) {
        String source = Utf8Decoder().convert(response.bodyBytes);
        List myList = json.decode(source);
        listBases = myList.map<BasesModel>((e) => BasesModel.fromJson(e)).toList();
        return listBases;
      }
      return [];
    } on TimeoutException catch (e) {
      return Future.error("1");
    } on SocketException catch (e) {
      return Future.error("2");
    } on Error catch (e) {
      return Future.error("3");
    }
  }

}