import 'package:flutter/material.dart';
import 'package:hacker_news/service.dart';

class Home2 extends StatelessWidget {
  int num;

  Home2({Key? key, required this.num}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: FutureBuilder(
              future: result(value: num),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data != null) {
                  return Center(
                    child: Text(snapshot.data),
                  );
                } else if (snapshot.hasError) {
                  throw "Error";
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              })),
    );
  }
}
