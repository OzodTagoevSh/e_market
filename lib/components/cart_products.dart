import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  const CartProducts({Key? key}) : super(key: key);

  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var productsOnCart = [
    {
      'name': 'Samsung A32',
      'picture': 'images/products/galaxy.jpeg',
      'price': 230,
      'memory': '64Gb',
      'color': 'Black',
      'quantity': 1,
    },
    {
      'name': 'Iphone 12',
      'picture': 'images/products/iphone.jpeg',
      'price': 1100,
      'memory': '256Gb',
      'color': 'Gold',
      'quantity': 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: productsOnCart.length,
        itemBuilder: (context, index) {
          return SingleCartProduct(
            cartProductName: productsOnCart[index]['name'],
            cartProductPicture: productsOnCart[index]['picture'],
            cartProductPrice: productsOnCart[index]['price'],
            cartProductMemory: productsOnCart[index]['memory'],
            cartProductColor: productsOnCart[index]['color'],
            cartProductQuantity: productsOnCart[index]['quantity'],
          );
        },
      ),
    );
  }
}

class SingleCartProduct extends StatelessWidget {
  final cartProductName;
  final cartProductPicture;
  final cartProductPrice;
  final cartProductMemory;
  final cartProductColor;
  final cartProductQuantity;

  SingleCartProduct({
    this.cartProductName,
    this.cartProductPicture,
    this.cartProductPrice,
    this.cartProductMemory,
    this.cartProductColor,
    this.cartProductQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // =========== SECTION FOR LEADING ==========
        leading: Image.asset(cartProductPicture, fit: BoxFit.cover),

        // =========== SECTION FOR TITLE ============
        title: Text(cartProductName),

        // =========== SECTION FOR SUBTITLE =========
        subtitle: Column(
          children: [
            // ROW INSIDE COLUMN
            Row(
              children: [
                // =========== SECTION FOR MEMORY =================
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text('Memory: '),
                ),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(cartProductMemory, style: TextStyle(color: Colors.red),),
                ),

                // =========== SECTION FOR COLOR ==================
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 8.0, 8.0, 8.0),
                  child: Text('Color: '),
                ),

                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(cartProductColor, style: TextStyle(color: Colors.red),),
                ),
              ],
            ),
            // =========== SECTION // =========== SECTION FOR PRICE ==================FOR PRICE ==================
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.topLeft,
                child: Text('\$$cartProductPrice',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                  ),
                ),
              ),
            ),
          ],
        ),
        /*trailing: Column(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_drop_up, size: 2.0,),),
            Text('$cartProductQuantity'),
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_drop_down, size: 2.0,),),
          ],
        ),

         */
      ),
    );
  }
}

