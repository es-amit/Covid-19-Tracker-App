import 'dart:async';

import 'package:covid_19_tracker/screens/world_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math'as math;
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late final AnimationController _controller  = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this)..repeat();


    @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const WorldStatesScreen()));
    });
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(

              animation: _controller,
              // ignore: sized_box_for_whitespace
              child: Container(
                height: 200,
                width: 200,
                child: const Center(
                  child: Image(image: AssetImage('assets/virus.png')),
                ),
              ), 
              builder: (BuildContext context, Widget? child){
                return Transform.rotate(
                  angle: _controller.value* 2.0* math.pi,
                  child: child,);
                  
              }),
              SizedBox(height: MediaQuery.of(context).size.height* 0.08,),
              const Align(
                alignment: Alignment.center,
                child: Text('Covid-19\nTracker App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),),
              )
          ],
        )),
    );
  }
}