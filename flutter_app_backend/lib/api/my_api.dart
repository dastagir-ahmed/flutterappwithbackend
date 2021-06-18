import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class CallApi{
  final String _url = 'http://mark.dbestech.com/api/';
  final String _imgUrl='http://mark.dbestech.com/uploads/';
  getImage(){
    return _imgUrl;
  }
  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.post(
        Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: _setHeaders()
    );
  }
  getData(apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken() ;
    return await http.get(
        Uri.parse(fullUrl),
        headers: _setHeaders()
    );
  }

  _setHeaders() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
  };

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return '?token=$token';
  }


  getArticles(apiUrl) async {

  }
  getPublicData(apiUrl) async {

  }

}