import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  var productList = [
    {
      'name': 'Samsung Galaxy A32',
      'picture': 'images/products/galaxy.jpeg',
      'oldPrice': 250,
      'price': 230,
    },
    {
      'name': 'Iphone 12',
      'picture': 'images/products/iphone.jpeg',
      'oldPrice': 1200,
      'price': 1100,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SingleProduct extends StatelessWidget {

  final productName;
  final productPicture;
  final oldPrice;
  final price;

  SingleProduct({
    required this.productName,
    required this.productPicture,
    required this.oldPrice,
    required this.price
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

