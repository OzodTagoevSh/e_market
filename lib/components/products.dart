import 'package:e_market/pages/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/************************ PRODUCTS CLASS ***************************/

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      'name': 'Samsung A32',
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
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return SingleProduct(
          productName: productList[index]['name'],
          productPicture: productList[index]['picture'],
          oldPrice: productList[index]['oldPrice'],
          price: productList[index]['price'],
        );
      },
    );
  }
}

class SingleProduct extends StatelessWidget {
  final productName;
  final productPicture;
  final oldPrice;
  final price;

  SingleProduct(
      {required this.productName,
      required this.productPicture,
      required this.oldPrice,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: productName,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => ProductDetails(
                  productDetailsName: productName,
                  productDetailsPicture: productPicture,
                  productDetailsOldPrice: oldPrice,
                  productDetailsPrice: price,
                ))),
            child: GridTile(
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    productName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  title: Text(
                    '\$$price',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  subtitle: Text(
                    '\$$oldPrice',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w800,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ),
              ),
              child: Image.asset(
                productPicture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
