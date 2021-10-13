import 'dart:ffi';

class item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}

final products = [
  item(
      id: "item_1",
      name: "iPhone 13 Pro Max",
      desc: "Latest release of iPhone series",
      price: 129900.00,
      color: "#fdfdfa",
      image:
          "https://phonetechx.com/wp-content/uploads/2021/03/Apple-iPhone-13-Pro-Max.jpg")
];
