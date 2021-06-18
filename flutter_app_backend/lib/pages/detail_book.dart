import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_backend/components/text_widget.dart';
import 'package:flutter_app_backend/models/get_article_info.dart';

import 'all_books.dart';


class DetailBookPage extends StatefulWidget {
  final ArticleInfo articleInfo ;
  final int index;
   DetailBookPage({Key key, this.articleInfo, this.index}) : super(key: key);

  @override
  _DetailBookPageState createState() => _DetailBookPageState();
}

class _DetailBookPageState extends State<DetailBookPage> {
  @override
  Widget build(BuildContext context) {
  final double screenWidth=MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              toolbarHeight: 30,
              backgroundColor: Color(0xFFffffff),
              elevation: 0.0,
            ),
          body:Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left:0, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          padding:EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          icon:

                      Icon(Icons.arrow_back_ios, color:Color(0xFF363f93)),
                          onPressed:()=>Navigator.pop(context))
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  child: Row(
                    children: [
                      Material(
                        elevation:0.0,
                        child: Container(
                          height: 180,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3)
                              )
                            ],
                            image: DecorationImage(
                              image: NetworkImage(
                                "http://mark.dbestech.com/uploads/"+this.widget.articleInfo.img
                              ),
                              fit:BoxFit.fill
                            )
                          ),

                        ),
                      ),
                      Container(
                        width: screenWidth-30-180-20,
                        margin: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10,),
                            TextWidget(text:this.widget.articleInfo.title, fontSize: 30,),
                            TextWidget(text:"Author: Dylan Ahmed", fontSize: 20,color:Color(0xFF7b8ea3)),
                            Divider(color:Colors.grey),
                            TextWidget(text:this.widget.articleInfo.title, fontSize: 16,color:Color(0xFF7b8ea3)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40,),
                Divider(color:Color(0xFF7b8ea3)),
                SizedBox(height: 10,),

                Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.favorite, color:Color(0xFF7b8ea3), size: 40,),
                          SizedBox(width: 10,),
                          TextWidget(text:"Like", fontSize: 20),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.share, color:Color(0xFF7b8ea3), size: 40,),
                          SizedBox(width: 10,),
                          TextWidget(text:"Share", fontSize: 20),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.bookmarks_sharp, color:Color(0xFF7b8ea3), size: 40,),
                          SizedBox(width: 10,),
                          TextWidget(text:"Bookself", fontSize: 20),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40,),
                Row(
                  children: [
                    TextWidget(text:"Details", fontSize: 30,),
                    Expanded(child: Container())
                  ],
                ),
                SizedBox(height: 30,),
                Container(
                  height: 200,
                  child: TextWidget(text:this.widget.articleInfo.article_content, fontSize: 16, color: Colors.grey),
                ),
                Divider(color:Color(0xFF7b8ea3)),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AllBooks()));
                  },
                  child:
                Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      TextWidget(text:"Check the directory", fontSize: 20,),
                      Expanded(child: Container()),
                      IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: null)
                    ],
                  ),

                ),
                ),
                Divider(color:Color(0xFF7b8ea3)),

              ],
            ),
          )
        ),
      ),
    );
  }
}
