import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Shopping Cart'),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {

            },
          icon: Icon(Icons.search),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text('Total: '),
                subtitle: Text('\$250'),
              ),
            ),
            
            Expanded(child: MaterialButton(
              onPressed: () {},
              child: Text('Check Out', style: TextStyle(color: Colors.white),),
              color: Colors.red,
            )),
          ],
        ),
      ),
    );
  }
}
