import 'dart:ui';

import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Category(
            imageLocation: 'images/categories/smartphone.png',
            imageCaption: 'Smartphones',
          ),
          Category(
            imageLocation: 'images/categories/laptop.png',
            imageCaption: 'Laptops',
          ),
          Category(
            imageLocation: 'images/categories/perfume.png',
            imageCaption: 'Perfume',
          ),
          Category(
            imageLocation: 'images/categories/sport.png',
            imageCaption: 'Sport',
          ),
          Category(
            imageLocation: 'images/categories/tv.png',
            imageCaption: 'Televisor',
          ),
          Category(
            imageLocation: 'images/categories/fridge.png',
            imageCaption: 'Appliances',
          ),
          Category(
            imageLocation: 'images/categories/fashion.png',
            imageCaption: 'Fashion',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  Category({required this.imageLocation, required this.imageCaption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {

        },
        child: Container(
          width: 120.0,
          child: ListTile(
            title: Image.asset(
              imageLocation,
              color: Colors.red,
            ),
            subtitle: Text(
              imageCaption,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11.0),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

