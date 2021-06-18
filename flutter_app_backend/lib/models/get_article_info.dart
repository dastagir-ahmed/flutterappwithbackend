class ArticleInfo{
  int id;
  String article_content;
  String title;
  String description;
  String created_at;
  String img;
  String author;

  ArticleInfo(String img,int id, String article_content, String title, String description, String created_at, String author){
    this.id=id;
    this.article_content=article_content;
    this.description=description;
    this.title=title;
    this.created_at=created_at;
    this.img=img;
    this.author=author;
  }

  ArticleInfo.fromJson(Map json)
          :id=json['id'],
          author=json['author'],
          article_content=json['article_content'],
          description=json['description'],
          title=json['title'],
          created_at=json['created_at'],
          img=json['img'];
  Map toJson(){
    return {
      'id':id,
      'article_content':article_content,
      'title':title,
      'description':description,
      'created_at':created_at,
      'img':img,
      'author':author,
    };
  }

}