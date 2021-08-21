import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fnews_app/helper/data.dart';
import 'package:fnews_app/helper/news.dart';
import 'package:fnews_app/models/ArticleModel.dart';
import 'package:fnews_app/models/category_model.dart';
import 'package:fnews_app/ui/category_card.dart';
import 'package:fnews_app/ui/news_tile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = List<CategoryModel>.empty(growable: true);

//  var article;

  ArticleModel article = new ArticleModel.empty();
  bool _loading = true;

  void getNews() async {
    News news = News();
    //await news.getNews();
    article = await news.getNews();

    print("article list${article.articles[2].title}");
    print(article.articles.runtimeType);
    // log('article: $article');
    // setState(() {
    // _loading = false;
    // }
    // );
  }

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Flutter',
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              'News',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              // Category
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 70,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryCard(
                          categoryImageUrl: categories[index].categoryImageUrl,
                          categoryName: categories[index].categoryName);
                    }),
              ),
              // Article Top Headlines
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: ListView.builder(
                  itemCount: article.articles.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Hello '),
                    );
                    // return NewsTile(
                    //     articleImageUrl: article.articles[index].urlToImage,
                    //     title: article.articles[index].title,
                    //     content: article.articles[index].content,
                    //     desc: article.articles[index].urlToImage,
                    //     postUrl: article.articles[index].urlToImage);
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
