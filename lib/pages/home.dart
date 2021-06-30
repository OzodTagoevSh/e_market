import 'package:flutter/material.dart';
import 'package:e_market/components/horizontal_listview.dart';
import 'package:e_market/components/carousel.dart';
import 'package:e_market/components/drawer.dart';
import 'package:e_market/components/products.dart';
import 'package:e_market/pages/cart.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('E-Market'),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      drawer: Drawer(
        child: DrawerView(),
      ),
      body: Column(
        children: [
          // CAROUSEL PART
          CarouselView(),

          // PADDING WIDGET
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(alignment: Alignment.centerLeft, child: Text('Categories')),
          ),

          // HORIZONTAL LIST FOR CATEGORIES
          HorizontalList(),

          // PADDING WIDGET
          Padding(
            padding: EdgeInsets.all(8.0),
            child:Container(alignment: Alignment.centerLeft, child: Text('Recent Products')),
          ),

          // GRID VIEW FOR RECENT PRODUCTS
          Flexible(child: Products()),
        ],
      ),
    );
  }
}