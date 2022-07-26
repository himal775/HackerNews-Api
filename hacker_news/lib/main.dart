import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacker_news/home.dart';
import 'package:hacker_news/provider.dart';
import 'package:hacker_news/service.dart';

void main() async {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
          appBar: AppBar(),
          body: FutureBuilder(
              future: getdata(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    child: ListView.builder(
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (BuildContext context, index) {
                          return ListTile(
                              leading: GestureDetector(
                            child: Text(snapshot.data[index]),
                            onTap: () async {
                              final List s = await getdata();
                              final values = (snapshot.data[index]);
                              int r = s.indexOf(values);

                              Get.to(Home2(num: r));
                            },
                          ));
                        }),
                  );
                } else if (snapshot.hasError) {
                  throw " Error ";
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })),
    );
  }
}
