import 'dart:math';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  //initialize the width and height as global variable
  double _width = 200;
  double _height = 200;
  //initialize the color as a global variable
  Color _color = Colors.green;
  //give the border of the container
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implicit Animation'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedContainer(
                width: _width,
                height: _height,
                decoration:
                    BoxDecoration(color: _color, borderRadius: _borderRadius),
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.black,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      //create the random numbers generator
                      final random = Random();
                      //generate the random height and width
                      _width = random.nextInt(300).toDouble();
                      _height = random.nextInt(400).toDouble();
                      //generate the random colors
                      _color = Color.fromRGBO(random.nextInt(256),
                          random.nextInt(256), random.nextInt(256), 2);
                      //generate the random radius of the container
                      _borderRadius =
                          BorderRadius.circular(random.nextInt(100).toDouble());
                    });
                  },
                  child: const Text(
                    'Click',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
