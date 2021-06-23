import 'package:flutter/material.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        UserAccountsDrawerHeader(
          currentAccountPicture: GestureDetector(
            child: CircleAvatar(
              //backgroundImage: AssetImage('images/avatar.jpg'),
              child: Icon(Icons.person, color: Colors.white,),
              backgroundColor: Colors.grey,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.redAccent,
          ),
          accountName: Text('Ozod Tagoev'),
          accountEmail: Text('ozod.tagoev@gmail.com'),
        ),
        InkWell(
          onTap: () {

          },
          child: ListTile(
            title: Text('Home Page'),
            leading: Icon(Icons.home, color: Colors.red,),
          ),
        ),
        InkWell(
          onTap: () {

          },
          child: ListTile(
            title: Text('My Account'),
            leading: Icon(Icons.person, color: Colors.red,),
          ),
        ),
        InkWell(
          onTap: () {

          },
          child: ListTile(
            title: Text('My Orders'),
            leading: Icon(Icons.shopping_basket, color: Colors.red,),
          ),
        ),
        InkWell(
          onTap: () {

          },
          child: ListTile(
            title: Text('Categories'),
            leading: Icon(Icons.dashboard, color: Colors.red,),
          ),
        ),
        InkWell(
          onTap: () {

          },
          child: ListTile(
            title: Text('Favorites'),
            leading: Icon(Icons.favorite, color: Colors.red,),
          ),
        ),
        Divider(
          height: 50,
          color: Colors.grey[400],
        ),
        InkWell(
          onTap: () {

          },
          child: ListTile(
            title: Text('Settings'),
            leading: Icon(Icons.settings, color: Colors.blue,),
          ),
        ),
        InkWell(
          onTap: () {

          },
          child: ListTile(
            title: Text('About'),
            leading: Icon(Icons.help, color: Colors.blue,),
          ),
        ),
      ],
    );
  }
}
