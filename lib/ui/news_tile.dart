import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {
  // const NewsTile({ Key? key }) : super(key: key);
  final String articleImageUrl;
  final String title;
  final String desc;
  final String content;
  final String postUrl;

  NewsTile(
      {required this.articleImageUrl,
      required this.title,
      required this.content,
      required this.desc,
      required this.postUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 40,
        margin: EdgeInsets.only(bottom: 20.0),
        width: MediaQuery.of(context).size.width,
        child: Container(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(
                    articleImageUrl,
                    height: 200.0,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  desc,
                  maxLines: 3,
                  style: TextStyle(color: Colors.black54, fontSize: 14.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
