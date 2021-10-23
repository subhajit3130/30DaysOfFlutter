import 'package:catalog_app/model/catalog.dart';
import 'package:flutter/material.dart';

class ItemWidgetGridView extends StatelessWidget {
  // const ItemWidget({Key? key}) : super(key: key);

  final Item item;

  const ItemWidgetGridView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: GridTile(
        header: Container(
          child: Text(
            item.name,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
          ),
          padding: const EdgeInsets.all(7),
        ),
        child: Image.network(
          item.image,
        ),
        footer: Container(
          child: Text(
            "${item.price} INR",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          padding: const EdgeInsets.all(7),
        ),
      ),
    );
  }
}
