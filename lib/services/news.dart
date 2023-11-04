// import 'dart:convert';

// import 'package:pacex/model/article_model.dart';
// import 'package:http/http.dart' as http;

// class News {
//   List<ArticleModel> news = [];

//   Future<void> getNews() async {
//     String url =
//         "https://newsapi.org/v2/everything?q=tesla&from=2023-10-04&sortBy=publishedAt&apiKey=API_KEY";

//     var responce = await http.get(Uri.parse(url));

//     var jsonData = jsonDecode(responce.body);

//     if(jsonData["status"]=='ok'){
//       jsonData["articles"].forEach(element){
//         if(element["UrlToImage"]!=null && element["description"]!=null){
//         ArticleModel articleModel= ArticleModel(
//           title: element["title"],
//           description: element["description"],
//           url: element["url"],
//           urlToImage: element["urlToImage"],
//           content: element['content'],
//           author: element["author"],
//         );

//         news.add(articleModel);

//         }
//       }
//     }
//   }
// }


import 'dart:convert';
import 'package:pacex/model/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "https://newsapi.org/v2/everything?q=tesla&from=2023-10-04&sortBy=publishedAt&apiKey=API_KEY";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == 'ok') {
      List<dynamic> articles = jsonData["articles"];
      
      for (var articleData in articles) {
        if (articleData["urlToImage"] != null && articleData["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: articleData["title"],
            description: articleData["description"],
            url: articleData["url"],
            urlToImage: articleData["urlToImage"],
            content: articleData['content'],
            author: articleData["author"],
          );

          news.add(articleModel);
        }
      }
    }
  }
}
