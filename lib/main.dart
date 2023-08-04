import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran/constant.dart';
import 'index.dart';

void main() {
  runApp(const MyApp());
}

List arabic =[];
List malayalam =[];
List quran =[];

readJson ()async{
  final String response =await rootBundle.loadString("key");
  final data=json.decode(response);
  arabic=data["quran"];
  malayalam=data["malayalam"];
  return quran=[arabic,malayalam];
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await readJson();
      await getSettings();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quran',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const IndexPage(),
    );
  }
}
