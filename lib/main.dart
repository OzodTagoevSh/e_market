import 'package:e_market/components/horizontal_listview.dart';
import 'package:flutter/material.dart';
import 'components/carousel.dart';
import 'components/drawer.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: HomePage(),
));

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

              },
              icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      drawer: Drawer(
        child: DrawerClass(),
      ),
      body: ListView(
        children: [
          CarouselClass(),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Categories'),
          ),

          HorizontalList(),
        ],
      ),
    );
  }
}
