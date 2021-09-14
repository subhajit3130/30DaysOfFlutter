import 'package:catalog_app/home_page.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(CatalogApp());
}

class CatalogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
