import 'package:dio/dio.dart';
import 'package:flutter/physics.dart';
import 'package:hacker_news/model.dart';

Future getdata() async {
  final dio = Dio();
  final response = await dio.get(
      "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty");
  final item = [];
  for (int i = 0; i < 15; i++) {
    final id = (response.data as List)[i];
    final news = await dio.get(
        "https://hacker-news.firebaseio.com/v0/item/$id.json?print=pretty");
    final response1 = news.data['title'];
    final m = response1.toString();
    item.add(m);
  }
  return item;
}

Future getKids() async {
  final dio = Dio();
  final response = await dio.get(
      "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty");
  final item = [];
  for (int i = 0; i < 15; i++) {
    final int id = (response.data as List)[i];
    final news = await dio.get(
        "https://hacker-news.firebaseio.com/v0/item/$id.json?print=pretty");
    final response1 = news.data['kids'];
    final m = response1.toString();
    item.add(m);
  }
  return item;
}

Future getComments() async {
  final dio = Dio();
  final c = await getKids();
  final item = [];
  c.forEach((var i) async {
    final j = i.toString().substring(1, 9);
    final k = j.toString();
    item.add(k);
  });
  return (item);
}

Future result({required int value}) async {
  final dio = Dio();
  final c = await getComments();
  final item = [];
  for (var i in c) {
    final news = await dio
        .get("https://hacker-news.firebaseio.com/v0/item/$i.json?print=pretty");
    final response1 = news.data['text'];
    final m = response1.toString();
    item.add(m);
  }
  return item[value];
}
