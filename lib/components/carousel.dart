import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselView extends StatelessWidget {
  const CarouselView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.grey[100],
      child: CarouselSlider(
        items: [
          ContainerForCarousel(imageLocation: 'phones.jpg',),
          ContainerForCarousel(imageLocation: 'perfume.jpg',),
          ContainerForCarousel(imageLocation: 'clothes.jpg',),
          ContainerForCarousel(imageLocation: 'laptop.jpg',),
          ContainerForCarousel(imageLocation: 'fridges.jpg',),
        ],
        options: CarouselOptions(
          initialPage: 0,
          height: 200.0,
          autoPlay: false,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: Duration(milliseconds: 1000),
          autoPlayInterval: Duration(seconds: 5),
          enlargeCenterPage: true,
          aspectRatio: 16/9,
          enableInfiniteScroll: true,
          viewportFraction: 0.8,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}

class ContainerForCarousel extends StatelessWidget {

  final imageLocation;
  ContainerForCarousel({this.imageLocation});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(
          image: AssetImage('images/$imageLocation'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

