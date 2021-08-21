class ArticleModel {
  String status = "";
  int totalResults = 0;
  List<Articles> articles = List.empty();

  ArticleModel(this.status, this.totalResults, this.articles);

  ArticleModel.empty() {}

  ArticleModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles.add(new Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    if (this.articles != null) {
      data['articles'] = this.articles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  Source source = new Source.empty();
  String author = "";
  String title = "";
  String description = "";
  String url = "";
  String urlToImage = "";
  String publishedAt = "";
  String content = "";

  Articles(this.source, this.author, this.title, this.description, this.url,
      this.urlToImage, this.publishedAt, this.content);

  Articles.empty() {}
  factory Articles.fromJson(dynamic json) {
    return Articles(
        json['source'] = new Source.fromJson(json['source']),
        json['author'] ?? "",
        json['title'],
        json['description'],
        json['url'] ?? "",
        json['urlToImage'],
        json['publishedAt'],
        json['content'] ?? "");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.source != null) {
      data['source'] = this.source.toJson();
    }
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    return data;
  }
}

class Source {
  String id = "";
  String name = "";

  Source(this.id, this.name);

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(json['id'] ?? "", json['name'] ?? "");
  }

  Source.empty() {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
