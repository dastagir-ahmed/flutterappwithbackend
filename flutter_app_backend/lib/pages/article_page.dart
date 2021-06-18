import 'dart:convert';

import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_backend/api/my_api.dart';
import 'package:flutter_app_backend/components/text_widget.dart';
import 'package:flutter_app_backend/models/get_article_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'detail_book.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key key}) : super(key: key);

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  var articles = <ArticleInfo>[];
  var allarticles = <ArticleInfo>[];

  @override
  void initState() {
    _getArticles();
    super.initState();
  }
  
  _getArticles() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = localStorage.getString("user");

/*
    if(user!=null){
    var userInfo=jsonDecode(user);
      debugPrint(userInfo);
    }else{
      debugPrint("no info");
    }*/
    await _initData();
  }
  _initData() async {
   await CallApi().getPublicData("recommendedarticles").then((response){
      setState(() {
        Iterable list = json.decode(response.body);
        articles= list.map((model)=>ArticleInfo.fromJson(model)).toList();
      });
    });
   await CallApi().getPublicData("allarticles").then((response){
     setState(() {
       Iterable list = json.decode(response.body);
       allarticles= list.map((model)=>ArticleInfo.fromJson(model)).toList();
     });
   });

  }
  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    final double width=MediaQuery.of(context).size.width;
    debugPrint(height.toString());
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Color(0xFFffffff),
        elevation: 0.0,
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
