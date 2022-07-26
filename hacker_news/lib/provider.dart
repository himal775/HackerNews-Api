import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacker_news/model.dart';
import 'package:hacker_news/service.dart';
import 'package:dio/dio.dart';

final getResult = FutureProvider<List>(((ref) async {
  final dio = Dio();
  final response = await dio.get(
      "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty");
  final item = [];
  for (int i = 0; i < 15; i++) {
    final int id = (response.data as List)[i];
    final news = await dio.get(
        "https://hacker-news.firebaseio.com/v0/item/$id.json?print=pretty");
    final response1 = news.data["title"];
    final m = response1.toString();
    item.add(m);
  }
  return item;
}));
