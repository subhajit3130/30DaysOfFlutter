import 'package:catalog_app/model/catalog.dart';
import 'package:catalog_app/widgets/drawer.dart';
// import 'package:catalog_app/widgets/item_widget.dart';
import 'package:catalog_app/widgets/item_widget_grid_view.dart';
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
    await Future.delayed(Duration(seconds: 2));
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
        child: (CatalogItems.items != null && CatalogItems.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return ItemWidgetGridView(
                    item: CatalogItems.items[index],
                  );
                },
                itemCount: CatalogItems.items.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}


// ListView.builder(
//                 itemCount: CatalogItems.items.length,
//                 itemBuilder: (context, index) {
//                   return ItemWidget(
//                     item: CatalogItems.items[index],
//                   );
//                 })