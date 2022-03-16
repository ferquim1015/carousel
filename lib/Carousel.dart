import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DestinationCarousel extends StatefulWidget {
  const DestinationCarousel({required key}) : super(key: key);

  @override
  State<DestinationCarousel> createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {

  int _current = 0;

  final List<String> images = [
    'assets/images/uno.jpg',
    'assets/images/dos.jpg',
    'assets/images/tres.jpg',
    'assets/images/cuatro.jpg',
  ];

  final List<String> places = [
    'Politics',
    'heath & Safety',
    'Globant',
    'all',
  ];

  List<Widget> generateImageTitles(){
    return images.map((element)=>ClipRRect(
      child: Image.asset(element,
      fit:BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(15.0),
    )).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      padding: const EdgeInsets.only(top:50),
      child:Stack(
        children: [
          CarouselSlider(items: generateImageTitles(),
              options: CarouselOptions(
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 18/8,
                onPageChanged: (index, other) {
                  setState(() {
                    _current = index;
                  });
                }
              )),
          AspectRatio(aspectRatio: 18/8,
          child:Center(
              child:Text(
                places[_current],
                style: TextStyle(
                  decoration: TextDecoration.none,
                   color:Colors.pink[300],
                  fontSize:MediaQuery.of(context).size.width/15
                ),
              )

              ))
        ],
    )
    );
  }
}
