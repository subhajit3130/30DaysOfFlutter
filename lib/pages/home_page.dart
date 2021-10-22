import 'package:catalog_app/model/catalog.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:catalog_app/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    // await Future.delayed(Duration(seconds: 5));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    // print(catalogJson.toString());
    final decodedData = jsonDecode(catalogJson);
    // print(decodedData);
    var productData = decodedData["products"];
    // print(productData.toString());
    CatalogItems.items =
        List.from(productData).map<Item>((e) => Item.fromMap(e)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(50, (index) => CatalogItems.items[0]);

    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: CatalogItems.items.length,
            itemBuilder: (context, index) {
              return ItemWidget(
                item: CatalogItems.items[index],
              );
            }),
      ),
      drawer: MyDrawer(),
    );
  }
}
