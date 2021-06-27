import 'package:e_market/pages/product_details.dart';
import 'package:flutter/material.dart';

// TODO: SIMILAR PRODUCTS SHOULD BE UPDATED

class SimilarProducts extends StatefulWidget {
  const SimilarProducts({Key? key}) : super(key: key);

  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
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
    },
    {
      'name': 'Redmi Note 9',
      'picture': 'images/products/redmi_note9.jpeg',
      'oldPrice': 220,
      'price': 210,
    },
    {
      'name': 'BQ',
      'picture': 'images/products/bq.jpeg',
      'oldPrice': 110,
      'price': 105,
    },
    {
      'name': 'Redmi 10T',
      'picture': 'images/products/redmi_10t.jpeg',
      'oldPrice': 585,
      'price': 580,
    },
    {
      'name': 'Huawei P40',
      'picture': 'images/products/huawei_p40.jpeg',
      'oldPrice': 650,
      'price': 610,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: productList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return SimilarSingleProduct(
          productName: productList[index]['name'],
          productPicture: productList[index]['picture'],
          oldPrice: productList[index]['oldPrice'],
          price: productList[index]['price'],
        );
      },
    );
  }
}


class SimilarSingleProduct extends StatelessWidget {
  final productName;
  final productPicture;
  final oldPrice;
  final price;

  SimilarSingleProduct(
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
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetails(
                  productDetailsName: productName,
                  productDetailsPicture: productPicture,
                  productDetailsOldPrice: oldPrice,
                  productDetailsPrice: price,
                ))),
            child: GridTile(
              footer: Container(
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        productName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      ),
                    ),
                    Text(
                      '\$$price',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '\$$oldPrice',
                      style: TextStyle(decoration: TextDecoration.lineThrough),
                    ),
                  ],
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


