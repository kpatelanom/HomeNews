import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class MyHomeViewWidget extends StatefulWidget {
  MyHomeViewWidget({Key key}) : super(key: key);

  @override
  _HomeViewWidgetState createState() => _HomeViewWidgetState();
}

class _HomeViewWidgetState extends State<MyHomeViewWidget>{
 
  Future<List<NewsData>> _getData() async {
    var data = await http.get('https://newsapi.org/v2/top-headlines?country=in&general=business&apiKey=<API_KEY>');
    var jsonData = json.decode(data.body);
    print(jsonData);
    List<NewsData> news = [];
    if(jsonData["status"] == 'ok'){
      var articles = jsonData["articles"];
      for(var item in articles){
      NewsData user = NewsData(item["index"], item["source"]["name"], item["title"],item["description"], item["urlToImage"],item["content"]);
      news.add(user);
    }
    }else{
      print('error in getting data');
    }
    
    return news;
  }
 @override
  initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext contex){
    return Scaffold(
     body: Container(
     child: FutureBuilder(
       future: _getData(),
       builder: (BuildContext context, AsyncSnapshot snapshot){
         if(snapshot.data == null){
           return Container(
             child: Center(
               child: Text("Loading...")
               ),
           );
         }else{
         return ListView.builder(
           itemCount: snapshot.data.length,
           itemBuilder: (BuildContext context, int index){
             return Column(
               children:<Widget>[
                 ListTile(
                   leading: Image.network(
                      snapshot.data[index].urlToImage
                     ),
                  title: Text(snapshot.data[index].title,style: TextStyle(
                    fontFamily: 'arial san-serif',
                    fontSize: 18.0,
                  )),
                  subtitle: Text(snapshot.data[index].description,style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'arial san-serif',
                    color: Colors.black54
                  )),
                ),
                Divider(),
               ]
             );
           },
         );
       }
      },
     )
     )
    );
  }
}

class NewsData{
  final int index;
  final String sourceName;
  final String title;
  final String description;
  final String urlToImage;
  final String content;
  NewsData(this.index, this.sourceName, this.title, this.description, this.urlToImage, this.content);
}