class News{
  String? title;
  String? description;
  String? image;
  String? publishedAt;
  String? content;

  News({this.title, this.description, this.image, this.content, this.publishedAt});
  News.fromJson(Map json){
    title = json['title'];
    description = json['description'];
    image = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

}